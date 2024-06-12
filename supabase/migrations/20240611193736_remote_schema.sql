create table "public"."Leaderboard Voter" (
    "leaderboard_code" bigint not null,
    "submissions" jsonb[],
    "name" text,
    "admin_session_id" uuid,
    "teams" jsonb[]
);


alter table "public"."Leaderboard Voter" enable row level security;

CREATE UNIQUE INDEX "Leaderboard Voter_leaderboard_code_key" ON public."Leaderboard Voter" USING btree (leaderboard_code);

CREATE UNIQUE INDEX "Leaderboard Voter_pkey" ON public."Leaderboard Voter" USING btree (leaderboard_code);

alter table "public"."Leaderboard Voter" add constraint "Leaderboard Voter_pkey" PRIMARY KEY using index "Leaderboard Voter_pkey";

alter table "public"."Leaderboard Voter" add constraint "Leaderboard Voter_leaderboard_code_key" UNIQUE using index "Leaderboard Voter_leaderboard_code_key";

grant delete on table "public"."Leaderboard Voter" to "anon";

grant insert on table "public"."Leaderboard Voter" to "anon";

grant references on table "public"."Leaderboard Voter" to "anon";

grant select on table "public"."Leaderboard Voter" to "anon";

grant trigger on table "public"."Leaderboard Voter" to "anon";

grant truncate on table "public"."Leaderboard Voter" to "anon";

grant update on table "public"."Leaderboard Voter" to "anon";

grant delete on table "public"."Leaderboard Voter" to "authenticated";

grant insert on table "public"."Leaderboard Voter" to "authenticated";

grant references on table "public"."Leaderboard Voter" to "authenticated";

grant select on table "public"."Leaderboard Voter" to "authenticated";

grant trigger on table "public"."Leaderboard Voter" to "authenticated";

grant truncate on table "public"."Leaderboard Voter" to "authenticated";

grant update on table "public"."Leaderboard Voter" to "authenticated";

grant delete on table "public"."Leaderboard Voter" to "service_role";

grant insert on table "public"."Leaderboard Voter" to "service_role";

grant references on table "public"."Leaderboard Voter" to "service_role";

grant select on table "public"."Leaderboard Voter" to "service_role";

grant trigger on table "public"."Leaderboard Voter" to "service_role";

grant truncate on table "public"."Leaderboard Voter" to "service_role";

grant update on table "public"."Leaderboard Voter" to "service_role";


