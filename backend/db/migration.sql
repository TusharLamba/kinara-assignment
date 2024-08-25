-- Database: school

-- DROP DATABASE IF EXISTS school;

CREATE DATABASE school
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



-- Table: public.student

-- DROP TABLE IF EXISTS public.student;

CREATE TABLE IF NOT EXISTS public.student
(
    id integer NOT NULL DEFAULT nextval('student_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dob date NOT NULL,
    CONSTRAINT student_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;


-- Table: public.exam

-- DROP TABLE IF EXISTS public.exam;

CREATE TABLE IF NOT EXISTS public.exam
(
    subject character varying(50) COLLATE pg_catalog."default" NOT NULL,
    marks integer NOT NULL,
    student_id integer NOT NULL,
    dateofexam date NOT NULL,
    CONSTRAINT exam_pkey PRIMARY KEY (subject, dateofexam, student_id),
    CONSTRAINT exam_student_id_fkey FOREIGN KEY (student_id)
        REFERENCES public.student (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.exam
    OWNER to postgres;


-- INSERT STATEMENTS

INSERT INTO student (name, dob) VALUES ('John Doe', '2000-01-01');
INSERT INTO student (name, dob) VALUES ('Jane Smith', '2001-02-02');
INSERT INTO student (name, dob) VALUES ('Alice Johnson', '2002-03-03');
INSERT INTO student (name, dob) VALUES ('Bob Brown', '1999-12-12');
INSERT INTO student (name, dob) VALUES ('Charlie Davis', '2003-05-05');
INSERT INTO student (name, dob) VALUES ('Emily Clark', '2001-08-08');
INSERT INTO student (name, dob) VALUES ('Frank Harris', '2000-11-11');
INSERT INTO student (name, dob) VALUES ('Grace Lewis', '2002-06-06');
INSERT INTO student (name, dob) VALUES ('Henry Walker', '1998-07-07');
INSERT INTO student (name, dob) VALUES ('Isla Young', '2003-09-09');
INSERT INTO student (name, dob) VALUES ('Jack Wilson', '2000-10-10');
INSERT INTO student (name, dob) VALUES ('Kate Martin', '2001-12-12');
INSERT INTO student (name, dob) VALUES ('Liam King', '1999-01-01');
INSERT INTO student (name, dob) VALUES ('Mia Scott', '2002-04-04');
INSERT INTO student (name, dob) VALUES ('Noah Turner', '2003-03-03');
INSERT INTO student (name, dob) VALUES ('Olivia Baker', '2000-02-02');
INSERT INTO student (name, dob) VALUES ('Paul Nelson', '2001-05-05');
INSERT INTO student (name, dob) VALUES ('Quinn Perez', '1998-06-06');
INSERT INTO student (name, dob) VALUES ('Rachel Hall', '2003-07-07');
INSERT INTO student (name, dob) VALUES ('Sam Carter', '2002-08-08');



-- John Doe's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 85, 1, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 90, 1, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 78, 1, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 88, 1, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 82, 1, '2024-05-05');

-- Jane Smith's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 75, 2, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 82, 2, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 85, 2, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 70, 2, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 77, 2, '2024-05-05');

-- Alice Johnson's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 88, 3, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 92, 3, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 83, 3, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 75, 3, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 89, 3, '2024-05-05');

-- Bob Brown's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 60, 4, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 65, 4, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 70, 4, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 55, 4, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 62, 4, '2024-05-05');

-- Charlie Davis's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 95, 5, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 98, 5, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 90, 5, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 92, 5, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 88, 5, '2024-05-05');

-- Emily Clark's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 85, 6, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 75, 6, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 80, 6, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 85, 6, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 79, 6, '2024-05-05');

-- Frank Harris's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 92, 7, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 88, 7, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 87, 7, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 89, 7, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 91, 7, '2024-05-05');

-- Grace Lewis's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 77, 8, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 80, 8, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 75, 8, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 78, 8, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 74, 8, '2024-05-05');

-- Henry Walker's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 68, 9, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 72, 9, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 66, 9, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 71, 9, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 69, 9, '2024-05-05');

-- Isla Young's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 94, 10, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 93, 10, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 95, 10, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 91, 10, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 92, 10, '2024-05-05');

-- Jack Wilson's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 74, 11, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 77, 11, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 73, 11, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 79, 11, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 75, 11, '2024-05-05');

-- Kate Martin's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 89, 12, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 84, 12, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 87, 12, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 85, 12, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 88, 12, '2024-05-05');

-- Liam King's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 93, 13, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 91, 13, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 89, 13, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 92, 13, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 90, 13, '2024-05-05');

-- Mia Scott's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 87, 14, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 85, 14, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 90, 14, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 84, 14, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 86, 14, '2024-05-05');

-- Noah Turner's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 78, 15, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 82, 15, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 80, 15, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 77, 15, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 79, 15, '2024-05-05');

-- Olivia Baker's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 92, 16, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 89, 16, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 93, 16, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 90, 16, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 88, 16, '2024-05-05');

-- Paul Nelson's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 84, 17, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 80, 17, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 87, 17, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 82, 17, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 85, 17, '2024-05-05');

-- Quinn Perez's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 79, 18, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 83, 18, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 81, 18, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 78, 18, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 76, 18, '2024-05-05');

-- Rachel Hall's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 91, 19, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 88, 19, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 85, 19, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 89, 19, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 92, 19, '2024-05-05');

-- Sam Carter's Exams
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Math', 86, 20, '2024-01-10');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Science', 89, 20, '2024-02-15');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('English', 88, 20, '2024-03-12');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('History', 87, 20, '2024-04-20');
INSERT INTO exam (subject, marks, student_id, dateOfExam) VALUES ('Geography', 84, 20, '2024-05-05');
