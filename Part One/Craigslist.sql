CREATE TABLE "regions" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" text UNIQUE,
  "password" varchar(15),
  "pref_region_id" [fk]
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "body" text,
  "user_id" [fk],
  "region_id" [fk],
  "category_id" [fk]
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "posts" ("user_id");

ALTER TABLE "regions" ADD FOREIGN KEY ("id") REFERENCES "posts" ("region_id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "posts" ("category_id");

ALTER TABLE "posts" ADD FOREIGN KEY ("region_id") REFERENCES "users" ("pref_region_id");
