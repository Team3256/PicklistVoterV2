create table "public"."Leaderboard Voter 2" (
    "leaderboard_code" bigint not null,
    "submissions" jsonb[],
    "name" text,
    "admin_session_id" uuid,
    "teams" jsonb[]
);


alter table "public"."Leaderboard Voter 2" enable row level security;

CREATE UNIQUE INDEX "Leaderboard Voter 2_leaderboard_code_key" ON public."Leaderboard Voter 2" USING btree (leaderboard_code);

CREATE UNIQUE INDEX "Leaderboard Voter 2_pkey" ON public."Leaderboard Voter 2" USING btree (leaderboard_code);

alter table "public"."Leaderboard Voter 2" add constraint "Leaderboard Voter 2_pkey" PRIMARY KEY using index "Leaderboard Voter 2_pkey";

alter table "public"."Leaderboard Voter 2" add constraint "Leaderboard Voter 2_leaderboard_code_key" UNIQUE using index "Leaderboard Voter 2_leaderboard_code_key";

grant delete on table "public"."Leaderboard Voter 2" to "anon";

grant insert on table "public"."Leaderboard Voter 2" to "anon";

grant references on table "public"."Leaderboard Voter 2" to "anon";

grant select on table "public"."Leaderboard Voter 2" to "anon";

grant trigger on table "public"."Leaderboard Voter 2" to "anon";

grant truncate on table "public"."Leaderboard Voter 2" to "anon";

grant update on table "public"."Leaderboard Voter 2" to "anon";

grant delete on table "public"."Leaderboard Voter 2" to "authenticated";

grant insert on table "public"."Leaderboard Voter 2" to "authenticated";

grant references on table "public"."Leaderboard Voter 2" to "authenticated";

grant select on table "public"."Leaderboard Voter 2" to "authenticated";

grant trigger on table "public"."Leaderboard Voter 2" to "authenticated";

grant truncate on table "public"."Leaderboard Voter 2" to "authenticated";

grant update on table "public"."Leaderboard Voter 2" to "authenticated";

grant delete on table "public"."Leaderboard Voter 2" to "service_role";

grant insert on table "public"."Leaderboard Voter 2" to "service_role";

grant references on table "public"."Leaderboard Voter 2" to "service_role";

grant select on table "public"."Leaderboard Voter 2" to "service_role";

grant trigger on table "public"."Leaderboard Voter 2" to "service_role";

grant truncate on table "public"."Leaderboard Voter 2" to "service_role";

grant update on table "public"."Leaderboard Voter 2" to "service_role";


