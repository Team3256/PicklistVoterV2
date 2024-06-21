DROP TABLE "Leaderboard Voter 2";
DROP TABLE "Leaderboard Voter 3";

DROP TYPE submissions;
DROP TYPE teams;
DROP TYPE records;

CREATE TYPE submissions AS (
                               "id" uuid,
                               "name" text,
                               "picks" bigint[],
                               "weighting" float8
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
                         "extra_stats" float8[],
                         "sort_orders" float8[],
                         "qual_average" float8,
                         "matches_played" bigint
                     );

create table "public"."'Leaderboard Voter 1.1'" (
                                                "leaderboard_code" bigint not null,
                                                "submissions" submissions[] not null ,
                                                "name" text not null ,
                                                "admin_session_id" uuid not null ,
                                                "teams" teams[] not null
);


alter table "public"."'Leaderboard Voter 1.1'" enable row level security;

CREATE UNIQUE INDEX "'Leaderboard Voter 1.1'_leaderboard_code_key" ON public."'Leaderboard Voter 1.1'" USING btree (leaderboard_code);

CREATE UNIQUE INDEX "'Leaderboard Voter 1.1'_pkey" ON public."'Leaderboard Voter 1.1'" USING btree (leaderboard_code);

alter table "public"."'Leaderboard Voter 1.1'" add constraint "'Leaderboard Voter 1.1'_pkey" PRIMARY KEY using index "'Leaderboard Voter 1.1'_pkey";

alter table "public"."'Leaderboard Voter 1.1'" add constraint "'Leaderboard Voter 1.1'_leaderboard_code_key" UNIQUE using index "'Leaderboard Voter 1.1'_leaderboard_code_key";

grant delete on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant insert on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant references on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant select on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant trigger on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant truncate on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant update on table "public"."'Leaderboard Voter 1.1'" to "anon";

grant delete on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant insert on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant references on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant select on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant trigger on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant truncate on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant update on table "public"."'Leaderboard Voter 1.1'" to "authenticated";

grant delete on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant insert on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant references on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant select on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant trigger on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant truncate on table "public"."'Leaderboard Voter 1.1'" to "service_role";

grant update on table "public"."'Leaderboard Voter 1.1'" to "service_role";
