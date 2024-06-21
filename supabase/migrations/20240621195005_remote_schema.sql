revoke delete on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke insert on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke references on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke select on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke trigger on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke truncate on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke update on table "public"."'Leaderboard Voter 1.1'" from "anon";

revoke delete on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke insert on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke references on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke select on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke trigger on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke truncate on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke update on table "public"."'Leaderboard Voter 1.1'" from "authenticated";

revoke delete on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke insert on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke references on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke select on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke trigger on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke truncate on table "public"."'Leaderboard Voter 1.1'" from "service_role";

revoke update on table "public"."'Leaderboard Voter 1.1'" from "service_role";

alter table "public"."'Leaderboard Voter 1.1'" drop constraint "'Leaderboard Voter 1.1'_leaderboard_code_key";

alter table "public"."'Leaderboard Voter 1.1'" drop constraint "'Leaderboard Voter 1.1'_pkey";

drop index if exists "public"."'Leaderboard Voter 1.1'_leaderboard_code_key";

drop index if exists "public"."'Leaderboard Voter 1.1'_pkey";

drop table "public"."'Leaderboard Voter 1.1'";

create table "public"."Leaderboard Voter 1.1" (
    "leaderboard_code" bigint not null,
    "submissions" submissions[] not null,
    "name" text not null,
    "admin_session_id" uuid not null,
    "teams" teams[] not null
);


alter table "public"."Leaderboard Voter 1.1" enable row level security;

CREATE UNIQUE INDEX "'Leaderboard Voter 1.1'_leaderboard_code_key" ON public."Leaderboard Voter 1.1" USING btree (leaderboard_code);

CREATE UNIQUE INDEX "'Leaderboard Voter 1.1'_pkey" ON public."Leaderboard Voter 1.1" USING btree (leaderboard_code);

alter table "public"."Leaderboard Voter 1.1" add constraint "'Leaderboard Voter 1.1'_pkey" PRIMARY KEY using index "'Leaderboard Voter 1.1'_pkey";

alter table "public"."Leaderboard Voter 1.1" add constraint "'Leaderboard Voter 1.1'_leaderboard_code_key" UNIQUE using index "'Leaderboard Voter 1.1'_leaderboard_code_key";

grant delete on table "public"."Leaderboard Voter 1.1" to "anon";

grant insert on table "public"."Leaderboard Voter 1.1" to "anon";

grant references on table "public"."Leaderboard Voter 1.1" to "anon";

grant select on table "public"."Leaderboard Voter 1.1" to "anon";

grant trigger on table "public"."Leaderboard Voter 1.1" to "anon";

grant truncate on table "public"."Leaderboard Voter 1.1" to "anon";

grant update on table "public"."Leaderboard Voter 1.1" to "anon";

grant delete on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant insert on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant references on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant select on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant trigger on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant truncate on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant update on table "public"."Leaderboard Voter 1.1" to "authenticated";

grant delete on table "public"."Leaderboard Voter 1.1" to "service_role";

grant insert on table "public"."Leaderboard Voter 1.1" to "service_role";

grant references on table "public"."Leaderboard Voter 1.1" to "service_role";

grant select on table "public"."Leaderboard Voter 1.1" to "service_role";

grant trigger on table "public"."Leaderboard Voter 1.1" to "service_role";

grant truncate on table "public"."Leaderboard Voter 1.1" to "service_role";

grant update on table "public"."Leaderboard Voter 1.1" to "service_role";


