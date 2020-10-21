--add set echo and spool command here
set echo on
spool week10_sql_intermediate_output.txt
/*
Databases Week 10 Tutorial
week10_sql_intermediate.sql

student id: 30758017
student name:ZIXIN HAO
last modified date: 

*/

/* 1. Find the average mark of FIT2094 in semester 2, 2019. 
Show the average mark with two decimal places. 
Name the output column as â€œAverage Markâ€?. */
SELECT
    to_char(AVG(mark), '990.99') AS "Average mark"
FROM
    uni.enrolment
WHERE
        semester = 2
    AND EXTRACT(YEAR FROM ofyear) = 2019
    AND unitcode = 'FIT2094';


/* 2. List the average mark for each offering of FIT9136. 
In the listing, include the year and semester number. 
Sort the result according to the year then the semester.*/
SELECT
    semester,
    EXTRACT(YEAR FROM ofyear)            AS year,
    to_char(AVG(mark), '990.99')         AS average_mark
FROM
    uni.enrolment
WHERE
    unitcode = 'FIT9136'
GROUP BY
    semester,
    EXTRACT(YEAR FROM ofyear);





/* 3. Find the number of students enrolled in FIT1045 in the year 2019, 
under the following conditions:
      a. Repeat students are counted each time
      b. Repeat students are only counted once
*/
SELECT
    *
FROM
    uni.enrolment
WHERE
        unitcode = 'FIT1045'
    AND EXTRACT(YEAR FROM ofyear) = 2019;
-- a. Repeat students are counted each time

SELECT
    COUNT(studid)
FROM
    uni.enrolment
WHERE
        unitcode = 'FIT1045'
    AND EXTRACT(YEAR FROM ofyear) = 2019;
  
-- b. Repeat students are only counted once

SELECT
    COUNT(DISTINCT studid)
FROM
    uni.enrolment
WHERE
        unitcode = 'FIT1045'
    AND EXTRACT(YEAR FROM ofyear) = 2019;

/* 4. Find the total number of prerequisite units for FIT5145. */

SELECT
    COUNT(has_prereq_of)
FROM
    uni.prereq
WHERE
    unitcode = 'FIT5145';
  
  
/* 5. Find the total number of prerequisite units for each unit. 
In the list, include the unitcode for which the count is applicable. 
Order the list by unit code.*/
SELECT
    unitcode,
    COUNT(has_prereq_of)
FROM
    uni.prereq
GROUP BY
    unitcode
ORDER BY
    unitcode;


/*6. Find the total number of students 
whose marks are being withheld (grade is recorded as 'WH') 
for each unit offered in semester 1 2020. 
In the listing include the unit code for which the count is applicable. 
Sort the list by descending order of the total number of students 
whose marks are being withheld.*/
SELECT
    unitcode,
    COUNT(studid) AS total
FROM
    uni.enrolment
WHERE
        grade = 'WH'
    AND semester = 1
    AND EXTRACT(YEAR FROM ofyear) = 2020
GROUP BY
    unitcode
ORDER BY
    total DESC;


/* 7. For each prerequisite unit, calculate how many times 
it has been used as a prerequisite (number of times used). 
In the listing include the prerequisite unit code, 
the prerequisite unit name and the number of times used. 
Sort the output by unit name. */
SELECT
    p.has_prereq_of,
    unitname,
    COUNT(has_prereq_of) AS "Times used"
FROM
         uni.prereq p
    JOIN uni.unit u ON u.unitcode = p.has_prereq_of
GROUP BY
    u.unitname,
    p.has_prereq_of
ORDER BY
    u.unitname;


/*8. Display unit code and unit name of units 
which had at least 1 student who was granted deferred exam 
(grade is recorded as 'DEF') in semester 1 2020. 
Order the list by unit code.*/
SELECT
    e.unitcode,
    u.unitname
FROM
         uni.enrolment e
    JOIN uni.unit u ON u.unitcode = e.unitcode
WHERE
        grade = 'DEF'
    AND semester = 1
    AND EXTRACT(YEAR FROM ofyear) = 2020
GROUP BY
    e.unitcode,
    u.unitname
ORDER BY
    unitcode;


/* 9. Find the unit/s with the highest number of enrolments 
for each offering in the year 2019. 
Sort the list by semester then by unit code. */
SELECT
    unitcode,
    COUNT(studid) AS numbers
FROM
    uni.enrolment
WHERE
    EXTRACT(YEAR FROM ofyear) = 2019
GROUP BY
    semester,
    unitcode
HAVING
    COUNT(studid) = (
        SELECT
            MAX(COUNT(studid))
        FROM
            uni.enrolment
        WHERE
            EXTRACT(YEAR FROM ofyear) = 2019
        GROUP BY
            semester,
            unitcode
    );


/* 10. Find all students enrolled in FIT3157 in semester 1, 2020 
who have scored more than the average mark for FIT3157 in the same offering? 
Display the students' name and the mark. 
Sort the list in the order of the mark from the highest to the lowest 
then in increasing order of student name.*/

SELECT
    studfname
    || ' '
    || studlname AS "student name",
    mark
FROM
         uni.enrolment e
    JOIN uni.student s ON e.studid = s.studid
WHERE
        unitcode = 'FIT3157'
    AND semester = 1
    AND EXTRACT(YEAR FROM ofyear) = 2020
    AND mark > (
        SELECT
            round(AVG(mark), 2)
        FROM
                 uni.enrolment e
            JOIN uni.student s ON e.studid = s.studid
        WHERE
                unitcode = 'FIT3157'
            AND semester = 1
            AND EXTRACT(YEAR FROM ofyear) = 2020
    )
ORDER BY
    mark DESC,
    studfname
    || ' '
    || studlname ASC;
    
    
spool off
set echo off