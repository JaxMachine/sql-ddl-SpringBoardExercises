--Data Base Schema For a Medical Center --
-- from terminal run psql < medical_center.sql--

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

--Doctor Table--
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    speacialty TEXT,
    accepting_patients BOOLEAN
);
--Patient Table --
CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL
);

--Diseases Table--
CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    diseases_name TEXT NOT NULL
);

--Diagnosis Table--
CREATE TABLE diagnois(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL
);

--Appointment Table --
CREATE TABLE appointments(
    id SERIAL PRIMARY KEY,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

--Medical History Table--
CREATE TABLE medical_history(
    id SERIAL PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointments,
    diagnois_id INTEGER REFERENCES diagnois ON DELETE SET NULL
)