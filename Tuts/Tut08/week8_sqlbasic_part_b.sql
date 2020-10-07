--add set echo and spool command here
set echo on 
spool week8_sqlbasic_part_b_output.txt

/*
Databases Week 8 Tutorial Sample Solution
week8_sqlbasic_part_b.sql

student id: 30758017
student name:ZIXIN HAO
last modified date:2020/10/7
*/

/* B1. List all the unit codes, semester and name of the chief examiner 
for all the units that are offered in 2020. Order the output by unit code.*/
SELECT
    o.unitcode,
    o.semester,
    s.stafffname,
    s.stafflname
FROM
         uni.offering o
    JOIN uni.staff s ON s.staffid = o.chiefexam
WHERE
    EXTRACT(YEAR FROM ofyear) = 2020;

  

/* B2. List all the unit codes and the unit names and their year and semester offerings. 
Order the output by unit code then by offering year and semester. 
To display the date correctly in Oracle, you need to use the to_char function. 
For example, to_char(ofyear,'yyyy'). */

SELECT
    o.unitcode                       AS "unit code",
    u.unitname,
    to_char(ofyear, 'yyyy')        AS year,
    o.semester
FROM
         uni.unit u
    JOIN uni.offering o ON u.unitcode = o.unitcode
ORDER BY
    o.unitcode,
    year,
    semester;

  

/* B3. List the unit code, semester, class type (lecture or tutorial), day and time 
for all units taught by Windham Ellard in 2020. 
Sort the list according to the unit code..*/

SELECT
    unitcode                            AS "unit code",
    semester,
    cltype                              AS "class type",
    clday                               AS day,
    to_char(cltime, 'dd-mon-yyyy')      AS time
FROM
         uni.schedclass c
    JOIN uni.staff s ON c.staffid = s.staffid
WHERE
        stafffname = 'Windham'
    AND stafflname = 'Ellard'
    AND EXTRACT(YEAR FROM cltime) = 2020
ORDER BY
    unitcode;


/* B4. Create a study statement for Friedrick Geist. 
A study statement contains unit code, unit name, semester and year study was attempted, 
the mark and grade. If the mark and grade is unknown, show the mark and grade as ‘N/A' 
Sort the list by year, then by semester and unit code. */

SELECT
    unitcode                      AS "unit code",
    unitname                      AS "unit name",
    semester,
    EXTRACT(YEAR FROM ofyear)     AS year,
    nvl(mark, 0),
    nvl(grade, 'N/A')
FROM
         uni.unit u
    NATURAL JOIN uni.enrolment e
ORDER BY
    year,
    semester,
    "unit code";


/* B5. List the unit code and unit name of the prerequisite units 
of 'Introduction to data science' unit. 
Order the output by prerequisite unit code. */

SELECT
    p.has_prereq_of AS unitcode,
    t.unitname
FROM
         uni.unit u
    JOIN uni.prereq    p ON u.unitcode = p.unitcode
    JOIN uni.unit      t ON t.unitcode = p.has_prereq_of
WHERE
    u.unitname = 'Introduction to data science'
ORDER BY
    has_prereq_of;

/* B6. Find all students (list their id, firstname and surname) 
who have received an HD for FIT2094 unit in semester 2 of 2019. 
Sort the list by student id. */
SELECT
    s.studid     AS student_id,
    studfname  AS firstname,
    studlname  AS surname
FROM
         uni.student s
    JOIN uni.enrolment e ON s.studid = e.studid
WHERE
        grade = 'HD'
    AND unitcode = 'FIT2094'
    AND semester = 2
    AND to_char(ofyear, 'yyyy') = '2019'
ORDER BY
    s.studid;

  

/* B7.	List the student full name, and unit code for those students 
who have no mark in any unit in semester 1 of 2020. 
Sort the list by student full name. */
SELECT studfname || ' '
                    || studlname AS student_full_name,
       e.unitcode
FROM
         uni.student s
    JOIN uni.enrolment e USING ( studid )
WHERE
    mark IS NULL
    AND semester = 1
        AND EXTRACT(YEAR FROM ofyear) = 2020
ORDER
    by student_full_name;
    
    
spool off
set echo off