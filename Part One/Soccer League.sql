CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "city" text
);

CREATE TABLE "players" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "birthdate" date,
  "team_id" [fk]
);

CREATE TABLE "matches" (
  "id" SERIAL PRIMARY KEY,
  "home_team" text,
  "away_team" text,
  "match_date" date
);

CREATE TABLE "referees" (
  "id" SERIAL PRIMARY KEY,
  "head_ref" text,
  "assist_ref1" text,
  "assist_ref2" text,
  "match_id" [fk]
);

CREATE TABLE "goals" (
  "id" SERIAL PRIMARY KEY,
  "player_id" [fk],
  "team_id" [fk],
  "match_id" [fk]
);

CREATE TABLE "results" (
  "id" SERIAL PRIMARY KEY,
  "team_id" [fk],
  "match_id" [fk],
  "result (W, L or D)" text
);

CREATE TABLE "league_time" (
  "id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "rankings" (
  "id" SERIAL PRIMARY KEY,
  "team_id" [fk],
  "total_games" int,
  "total_wins" int,
  "total_losses" int,
  "total_draws" int
);

ALTER TABLE "teams" ADD FOREIGN KEY ("id") REFERENCES "players" ("team_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "referees" ("match_id");

ALTER TABLE "players" ADD FOREIGN KEY ("id") REFERENCES "goals" ("player_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "goals" ("match_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("id") REFERENCES "goals" ("team_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("id") REFERENCES "results" ("team_id");

ALTER TABLE "matches" ADD FOREIGN KEY ("id") REFERENCES "results" ("match_id");

ALTER TABLE "teams" ADD FOREIGN KEY ("id") REFERENCES "rankings" ("team_id");
