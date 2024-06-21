import type { PageServerLoad } from './$types';
import { supabase } from '$lib/supabaseClient';
import type {Submissions} from "$lib/types/types";

export const load = (async ({params}) => {
    const {data, error} = await supabase.from('Leaderboard Voter 1.1').select().eq("leaderboard_code", params.eventCode);
    if (error) {
        console.error(error);
        return {ranked:[]}
    }
    const score = new Map();
    data[0]["submissions"].forEach((submission: Submissions) => {
        submission["picks"].forEach((pick: number, index: number) => {
            if (score.has(pick)) {
                score.set(pick, score.get(pick) + (submission["weighting"] * (submission["picks"].length - index)));
            } else {
                score.set(pick, submission["weighting"] * (submission["picks"].length - index));
            }
            // console.log(score);
        })
    })
    const sortedScore = [...score.entries()].sort((a, b) => b[1] - a[1]);
    const sortedKeys = sortedScore.map(entry => entry[0]);
    console.log(sortedKeys);
    return {ranked: sortedKeys, allData: data[0]};
}) satisfies PageServerLoad;