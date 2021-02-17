CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "specialty" text
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "date_of_birth" timestamp,
  "insurance" text
);

CREATE TABLE "vists" (
  "id" SERIAL PRIMARY KEY,
  "doctor_id" [fk],
  "patient_id" [fk]
);

CREATE TABLE "diagnoses" (
  "id" int PRIMARY KEY,
  "visit_id" [fk],
  "disease_id" [fk],
  "notes" text
);

CREATE TABLE "diseases" (
  "id" int PRIMARY KEY,
  "name" text,
  "notes" text
);

ALTER TABLE "patients" ADD FOREIGN KEY ("id") REFERENCES "vists" ("patient_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("id") REFERENCES "vists" ("doctor_id");

ALTER TABLE "vists" ADD FOREIGN KEY ("id") REFERENCES "diagnoses" ("visit_id");

ALTER TABLE "diseases" ADD FOREIGN KEY ("id") REFERENCES "diagnoses" ("disease_id");
