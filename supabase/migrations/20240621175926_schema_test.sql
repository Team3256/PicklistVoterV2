CREATE TYPE submissions AS (
    "id" uuid,
    "name" text,
    "picks" bigint[],
    "weighting" bigint
);

CREATE TYPE records AS (
    "ties" bigint,
    "wins" bigint,
    "losses" bigint
);

CREATE TYPE teams AS (
    "dq" bigint,
    "rank" bigint,
    "record" records,
    "team_key" text,
    "extra_stats" bigint[],
    "sort_orders" bigint[],
    "qual_average" bigint,
    "matches_played" bigint
);

create table "public"."Leaderboard Voter 3" (
    "leaderboard_code" bigint not null,
    "submissions" submissions[],
    "name" text,
    "admin_session_id" uuid,
    "teams" teams[]
);


alter table "public"."Leaderboard Voter 3" enable row level security;

CREATE UNIQUE INDEX "Leaderboard Voter 3_leaderboard_code_key" ON public."Leaderboard Voter 3" USING btree (leaderboard_code);

CREATE UNIQUE INDEX "Leaderboard Voter 3_pkey" ON public."Leaderboard Voter 3" USING btree (leaderboard_code);

alter table "public"."Leaderboard Voter 3" add constraint "Leaderboard Voter 3_pkey" PRIMARY KEY using index "Leaderboard Voter 3_pkey";

alter table "public"."Leaderboard Voter 3" add constraint "Leaderboard Voter 3_leaderboard_code_key" UNIQUE using index "Leaderboard Voter 3_leaderboard_code_key";

grant delete on table "public"."Leaderboard Voter 3" to "anon";

grant insert on table "public"."Leaderboard Voter 3" to "anon";

grant references on table "public"."Leaderboard Voter 3" to "anon";

grant select on table "public"."Leaderboard Voter 3" to "anon";

grant trigger on table "public"."Leaderboard Voter 3" to "anon";

grant truncate on table "public"."Leaderboard Voter 3" to "anon";

grant update on table "public"."Leaderboard Voter 3" to "anon";

grant delete on table "public"."Leaderboard Voter 3" to "authenticated";

grant insert on table "public"."Leaderboard Voter 3" to "authenticated";

grant references on table "public"."Leaderboard Voter 3" to "authenticated";

grant select on table "public"."Leaderboard Voter 3" to "authenticated";

grant trigger on table "public"."Leaderboard Voter 3" to "authenticated";

grant truncate on table "public"."Leaderboard Voter 3" to "authenticated";

grant update on table "public"."Leaderboard Voter 3" to "authenticated";

grant delete on table "public"."Leaderboard Voter 3" to "service_role";

grant insert on table "public"."Leaderboard Voter 3" to "service_role";

grant references on table "public"."Leaderboard Voter 3" to "service_role";

grant select on table "public"."Leaderboard Voter 3" to "service_role";

grant trigger on table "public"."Leaderboard Voter 3" to "service_role";

grant truncate on table "public"."Leaderboard Voter 3" to "service_role";

grant update on table "public"."Leaderboard Voter 3" to "service_role";


