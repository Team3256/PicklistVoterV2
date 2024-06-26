import type { PageServerLoad } from './$types';
import {supabase} from '$lib/supabaseClient';
import type {Submissions} from "$lib/types/types";

export const load = (async ({params}) => {
    const {data, error} = await supabase.from('Leaderboard Voter 1.1').select().eq("admin_session_id", params.uuid);
    if (error) {
        console.log(error);
        throw new Error("Failed to load data");
    }
    if (data?.length == 0) {
        throw new Error("No data found");
    }
    return {
        data:data?.[0]
    };
}) satisfies PageServerLoad;

export const actions = {
    update: async ({request}) => {
        const formData = await request.formData();
        const admin_session_id = formData.get("admin_session_id") as string;
        const uuid = formData.get("uuid") as string;
        const weighting = formData.get("weighting") as string;
        const {data, error: fetchError} = await supabase.from('Leaderboard Voter 1.1').select().eq("admin_session_id", admin_session_id);
        if (fetchError) {
            console.log("Fetch error" + fetchError);
            throw new Error("Failed to fetch data");
        }
        const submissionData:Submissions[] = [...(data[0]["submissions"])];
        submissionData[submissionData.findIndex((val)=>val.id==uuid)].weighting = parseFloat(weighting);
        console.log(submissionData);
        const {error: submitError} = await supabase.from('Leaderboard Voter 1.1').update({submissions: submissionData}).eq("admin_session_id", admin_session_id);
        if (submitError) {
            console.log("Submit error" + submitError);
            throw new Error("Failed to submit data");
        }
    },
    delete: async ({request}) => {
        const formData = await request.formData();
        const admin_session_id = formData.get("admin_session_id") as string;
        const uuid = formData.get("uuid") as string;
        const {data, error: fetchError} = await supabase.from('Leaderboard Voter 1.1').select().eq("admin_session_id", admin_session_id);
        if (fetchError) {
            console.log("Fetch error" + fetchError);
            throw new Error("Failed to fetch data");
        }
        const submissionData: Submissions[] = [...(data[0]["submissions"])];
        submissionData.splice(submissionData.findIndex((val)=>val.id==uuid), 1);
        console.log(submissionData);
        const {error: submitError} = await supabase.from('Leaderboard Voter 1.1').update({submissions: submissionData}).eq("admin_session_id", admin_session_id);
        if (submitError) {
            console.log("Submit error" + submitError);
            throw new Error("Failed to delete data");
        }
    }
};