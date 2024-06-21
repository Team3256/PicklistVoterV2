import type {Database, Tables} from "$lib/types/supabase";

export type Teams = Database["public"]["CompositeTypes"]["teams"];
export type Submissions = Database["public"]["CompositeTypes"]["submissions"];

export type Leaderboard3 = Tables<"Leaderboard Voter 1.1">;