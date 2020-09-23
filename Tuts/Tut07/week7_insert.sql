--ZIXIN HAO 
--30758017

--7.3.1 Basic INSERT statement
set echo on
spool week7_insert_output.txt

INSERT INTO student VALUES (
    11111111,
    'Bloggs',
    'Fred',
    TO_DATE('01-Jan-1990', 'dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111112,
    'Nice',
    'Nick',
    TO_DATE('10-Oct-94', 'dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111113,
    'Wheat',
    'Wendy',
    TO_DATE('5-May-90', 'dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111114,
    'Sheen',
    'Cindy',
    TO_DATE('25-Dec-96', 'dd-Mon-yyyy')
);

COMMIT;

INSERT INTO unit VALUES (
    'FIT9999',
    'FIT Last Unit'
);

INSERT INTO unit VALUES (
    'FIT5132',
    'Introduction to Databases'
);

INSERT INTO unit VALUES (
    'FIT5016',
    'Project'
);

INSERT INTO unit VALUES (
    'FIT5111',
    'Student''s Life'
);

COMMIT;

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5132',
    2013,
    '1',
    35,
    'N'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5016',
    2013,
    '1',
    61,
    'C'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5132',
    2013,
    '2',
    42,
    'N'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5111',
    2013,
    '2',
    76,
    'D'
);

INSERT INTO enrolment VALUES (
    11111111,
    'FIT5132',
    2014,
    '2',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES (
    11111112,
    'FIT5132',
    2013,
    '2',
    83,
    'HD'
);

INSERT INTO enrolment VALUES (
    11111112,
    'FIT5111',
    2013,
    '2',
    79,
    'D'
);

INSERT INTO enrolment VALUES (
    11111113,
    'FIT5132',
    2014,
    '2',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES (
    11111113,
    'FIT5111',
    2014,
    '2',
    NULL,
    NULL
);

INSERT INTO enrolment VALUES (
    11111114,
    'FIT5111',
    2014,
    '2',
    NULL,
    NULL
);

COMMIT;

--check table
SELECT
    *
FROM
    student;

SELECT
    *
FROM
    unit;

SELECT
    *
FROM
    enrolment;
    
--7.3.2 Using Sequences in an insert statement

--1
--Create a sequence for student table
CREATE SEQUENCE student_seq INCREMENT BY 1 START WITH 11111115;

--CHECK THE sequence
SELECT
    *
FROM
    user_sequences
WHERE
    sequence_name = 'STUDENT_SEQ';

SELECT
    student_seq.NEXTVAL
FROM
    dual;

--2
INSERT INTO student VALUES (
    student_seq.CURRVAL,
    'MICKEY',
    'MOUSE',
    TO_DATE('21-Feb-2000', 'dd-Mon-yyyy')
);

COMMIT;

SELECT
    *
FROM
    student;

INSERT INTO enrolment VALUES (
    student_seq.CURRVAL,
    'FIT5132',
    2016,
    '2',
    NULL,
    NULL
);

SELECT
    *
FROM
    enrolment;

--7.3.3 Advanced INSERT
INSERT INTO student VALUES (
    student_seq.NEXTVAL,
    'ALLEN',
    'HAO',
    TO_DATE('23-Feb-2000', 'dd-Mon-yyyy')
);

INSERT INTO enrolment VALUES (
    student_seq.CURRVAL,
    (
        SELECT
            unit_code
        FROM
            unit
        WHERE
            unit_name = 'Introduction to Databases'
    ),
    2015,
    '1',
    NULL,
    NULL
);

COMMIT;

--7.3.4 

CREATE TABLE fit5111_student
    AS
        SELECT
            *
        FROM
            enrolment
        WHERE
            unit_code = 'FIT5111';

SELECT
    *
FROM
    fit5111_student;
    
spool off
set echo off
    