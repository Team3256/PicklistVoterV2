import type { PageServerLoad } from './$types';
import {v4 as uuidv4} from 'uuid';
import { TBA_API_KEY } from '$env/static/private';
import { supabase } from '$lib/supabaseClient';
import { redirect, fail } from '@sveltejs/kit';

export const load = (async () => {
    return {};
}) satisfies PageServerLoad;


interface databaseFormat {
    leaderboard_code: string,
    submissions: Array<any>,
    teams: Array<any>,
    name: string,
    admin_session_id: any;

}
async function pushData(info: databaseFormat) {
    const {error} = await supabase.from("Leaderboard Voter").insert(info)
    if (error) {
        console.log(error)
    }

}

export const actions = {
    default: async ({request})=> {
        const formData = await request.formData();
        const eventCode:string = formData.get("eventCode") as string;
        const name:string = formData.get("leaderboardName") as string;
        if (eventCode == '') {
            return fail(422, {message: "Event code is required", type: "eventCode"});
        }
        if (name == '') {
            return fail(422, {message: "Name is required", type: "name"});
        }
        const response = await fetch(`https://www.thebluealliance.com/api/v3/event/${eventCode}/rankings`, {
            method: 'GET',
            headers: {
                'X-TBA-Auth-Key': TBA_API_KEY
            }
        })
        const data = await response.json();
        if (data["rankings"]==undefined) {
            return fail(422, {message: "Invalid event code", type: "eventCode"});

        }
        const uuid:string = uuidv4();
        const leaderboard_code: string = Math.floor(Math.random()*(999999-100000+1)+100000).toString();
        const info: databaseFormat = {leaderboard_code, submissions:[], teams:data["rankings"], name, admin_session_id: uuid}
        pushData(info);
        throw redirect(307, `/create/${uuid}`);

    }
}