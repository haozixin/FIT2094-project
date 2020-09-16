set echo on
spool week7_schema_output.txt

--ZIXIN HAO 30758017


DROP TABLE UNIT CASCADE CONSTRAINTS PURGE;
DROP TABLE STUDENT CASCADE CONSTRAINTS PURGE;
DROP TABLE ENROLMENT CASCADE CONSTRAINTS PURGE;

CREATE TABLE UNIT
(
unit_code char(7) NOT NULL,
unit_name varchar(50) NOT NULL,
CONSTRAINT unit_pk primary key(unit_code)
);

CREATE TABLE STUDENT
(
stu_nbr numeric(8) NOT NULL,
stu_lname varchar(50) NOT NULL,
stu_fname varchar(50) NOT NULL,
stu_dob DATE NOT NULL);

ALTER TABLE STUDENT
ADD CONSTRAINT student_pk PRIMARY KEY(stu_nbr);

CREATE TABLE ENROLMENT
(
stu_nbr numeric(8) NOT NULL,
unit_code char(7) NOT NULL,
enrol_year numeric(4) NOT NULL,
enrol_semester char(1) NOT NULL,
enrol_mark numeric(4),
enrol_grade char(2)
);

ALTER TABLE ENROLMENT
ADD CONSTRAINT ENROLMENT_PK PRIMARY KEY(stu_ubr,unit_code,enrol_year,enrol_semester);

ALTER TABLE ENROLMENT
ADD CONSTRAINT fk_enrolment_unit FOREIGN KEY(unit_code)
REFERENCES UNIT(unit_code);

ALTER TABLE ENROLMENT
ADD CONSTRAINT fk_enrolment_unit FOREIGN KEY(stu_nbr)
REFERENCES UNIT(stu_nbr);

ALTER TABLE STUDENT
ADD CONSTRAINT check_Stu_nbr CHECK(stu_nbr>10000000);

ALTER TABLE ENROLMENT
ADD CONSTRAINT check_enrol_semester CHECK(enrol_semester IN (1,2,3));

ALTER TABLE UNIT
ADD CONSTRAINT unq_unit_name UNIQUE(unit_name);

set echo off
spool off