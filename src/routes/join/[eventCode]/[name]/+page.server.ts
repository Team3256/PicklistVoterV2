import type { PageServerLoad } from './$types';
import { supabase } from '$lib/supabaseClient';
import {v4 as uuidv4} from 'uuid';
import { redirect } from '@sveltejs/kit';

export const load = (async ({params}) => {
    const {data, error} = await supabase.from('Leaderboard Voter 1.1').select().eq("leaderboard_code", params.eventCode);
    if (error) {
        console.log(error);
        throw new Error("Invalid Code")
    }
    try {
        return {teams: data?.[0]["teams"], eventCode: params.eventCode, name: params.name};
    } catch {
        return {teams: [], eventCode: params.eventCode, name: params.name};
    }
}) satisfies PageServerLoad;


export const actions = {
    default: async ({request})=> {
        const formData = await request.formData();
        const teamList = JSON.parse(formData.get("rankings") as string).map((team:string)=>parseInt(team));
        const eventCode:string = formData.get("eventCode") as string;
        const name:string = formData.get("name") as string;

        if (teamList.length ==0) {
            throw new Error("No teams selected");
        }
        const {data, error: fetchError} = await supabase.from('Leaderboard Voter 1.1').select().eq("leaderboard_code", eventCode);
        if (fetchError) {
            console.log("Fetch error" + fetchError);
            throw new Error("Failed to fetch data");
        }
        const {error: submitError} = await supabase.from('Leaderboard Voter 1.1').update({submissions: [...(data[0]["submissions"]), {name:name, picks: teamList, weighting:1, id:uuidv4()}]}).eq("leaderboard_code", eventCode);
        if (submitError) {
            console.log("Submit error" + submitError);
            throw new Error("Failed to submit data");
        }
        throw redirect(307, `/leaderboard/${eventCode}/`);

    }
}