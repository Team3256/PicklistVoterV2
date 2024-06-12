import type { PageServerLoad } from './$types';

export const load = (async ({params}) => {
    return {eventCode: params.eventCode};
}) satisfies PageServerLoad;