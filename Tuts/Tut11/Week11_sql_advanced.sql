--add set echo and spool command here

/*
Databases Week 11 Tutorial
week11_sql_advanced.sql

student id: 30758017
student name:Zixin Hao
last modified date:
*/
set echo on 
spool week11_sql_advanced_output.txt



/* 1. Find the number of scheduled classes assigned to each staff member 
for each semester in 2019. If the number of classes is 2 
then this should be labelled as a correct load, 
more than 2 as an overload and less than 2 as an underload. 
Order the list by decreasing order of the number of scheduled classes 
and when the number of classes is the same order by increasing order of staff id. */
SELECT
    to_char(ofyear, 'yyyy'),
    semester,
    s.staffid,
    stafffname,
    stafflname,
    COUNT(cltype)     AS "number of scheduled class",
    CASE
        WHEN COUNT(cltype) > 2     THEN
            'over load'
        WHEN COUNT(cltype) = 2     THEN
            'correct load'
        WHEN COUNT(cltype) < 2     THEN
            'under load'
    END               AS load_label
FROM
         uni.schedclass c
    JOIN uni.staff s ON s.staffid = c.staffid
WHERE
    to_char(ofyear, 'yyyy') = 2019
GROUP BY
    to_char(ofyear, 'yyyy'),
    semester,
    s.staffid,
    stafffname,
    stafflname
ORDER BY
    COUNT(cltype) DESC,
    staffid ASC;


/* 2. Display the unit code and unit name for units that do not have a prerequisite. 
Order the list in increasing order of unit code. 

There are many approaches that you can take in writing an SQL statement to answer this query. 
You can use the SET OPERATORS, OUTER JOIN and a SUBQUERY. 
Write SQL statements based on all three approaches.*/

/* Using outer join */
SELECT
    u.unitcode,
    unitname
FROM
    uni.prereq    p
    RIGHT OUTER JOIN uni.unit      u ON u.unitcode = p.unitcode
GROUP BY
    u.unitcode,
    unitname
HAVING
    COUNT(has_prereq_of) = 0
ORDER BY
    u.unitcode ASC;

/* Using set operator MINUS */
( SELECT
    unitcode,
    unitname
FROM
    uni.unit
MINUS
SELECT
    p.unitcode,
    unitname
FROM
         uni.prereq p
    JOIN uni.unit u ON p.unitcode = u.unitcode
)
ORDER BY
    unitcode ASC;


/* Using subquery */
SELECT
    unitcode,
    unitname
FROM
    uni.unit
WHERE
    unitcode NOT IN (
        SELECT
            unitcode
        FROM
            uni.prereq
    )
ORDER BY
    unitcode ASC;


/* 3. List all units offered in semester 2 2019 which do not have any enrolment. 
Include the unit code, unit name, and the chief examiner's name in the list. 
Order the list based on the unit code. */
SELECT
    o.unitcode,
    unitname,
    s.stafffname
    || ' '
    || s.stafflname AS examiner_name
FROM
         uni.offering o
    JOIN uni.staff    s ON s.staffid = o.chiefexam
    JOIN uni.unit     u ON u.unitcode = o.unitcode
WHERE
        semester = 2
    AND to_char(ofyear, 'yyyy') = '2019'
    AND o.unitcode NOT IN (
        SELECT DISTINCT
            unitcode
        FROM
            uni.enrolment e
        WHERE
                e.semester = 2
            AND to_char(e.ofyear, 'yyyy') = '2019'
    )
ORDER BY
    o.unitcode;


/* 4. List the full names of students who are enrolled in both ‘Introduction to databases’ 
and ‘Introduction to computer architecture and networks’ (note: both unit names are unique)
in semester 1 2020. Order the list by the students’ full name.*/
SELECT
    studfname
    || ' '
    || studlname AS full_name
FROM
         uni.student s
    JOIN uni.enrolment u ON s.studid = u.studid
WHERE
        semester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
    AND unitcode IN (
        SELECT
            unitcode
        FROM
            uni.enrolment
        WHERE
            unitcode IN (
                SELECT
                    unitcode
                FROM
                    uni.unit
                WHERE
                    unitname = 'Introduction to databases'
            )
    )
INTERSECT
SELECT
    studfname
    || ' '
    || studlname AS full_name
FROM
         uni.student s
    JOIN uni.enrolment u ON s.studid = u.studid
WHERE
        semester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
    AND unitcode IN (
        SELECT
            unitcode
        FROM
            uni.enrolment
        WHERE
            unitcode IN (
                SELECT
                    unitcode
                FROM
                    uni.unit
                WHERE
                    unitname = 'Introduction to computer architecture and networks'
            )
    )
ORDER BY
    full_name;
/* 5. Given that the payment rate for a tutorial is $42.85 per hour 
and the payment rate for a lecture is $75.60 per hour, 
calculate the weekly payment per type of class for each staff member in semester 1 2020. 
In the display, include staff id, staff name, type of class (lecture or tutorial), 
number of classes, number of hours (total duration), 
and weekly payment (number of hours * payment rate). 
Order the list by increasing order of staff id and for a given staff id by type of class.*/

SELECT
    s.staffid,
    f.stafffname
    || ' '
    || f.stafflname                                                                               AS staffname,
    CASE cltype
        WHEN 'L'  THEN
            'Lecture'
        WHEN 'T'  THEN
            'Tutorial'
    END                                                                                           AS type,
    COUNT(classno)                                                                                AS no_of_classes,
    SUM(clduration)                                                                               AS total_hours,
    lpad(to_char(COUNT(classno) * SUM(clduration) * 75.6, '$9999.99'), 20, ' ')                   AS weekly_payment
FROM
         uni.schedclass s
    JOIN uni.staff f ON s.staffid = f.staffid
WHERE
        semester = 1
    AND EXTRACT(YEAR FROM ofyear) = 2020
    AND cltype = 'L'
GROUP BY
    s.staffid,
    f.stafffname
    || ' '
    || f.stafflname,
    cltype
UNION
SELECT
    s.staffid,
    f.stafffname
    || ' '
    || f.stafflname     AS staffname,
    CASE cltype
        WHEN 'L'  THEN
            'Lecture'
        WHEN 'T'  THEN
            'Tutorial'
    END                 AS type,
    COUNT(classno)      AS no_of_classes,
    SUM(clduration)     AS total_hours,
    lpad(to_char(COUNT(classno) * SUM(clduration) * 42.85, '$9999.99'), 20,
         ' ')           AS weekly_payment
FROM
         uni.schedclass s
    JOIN uni.staff f ON s.staffid = f.staffid
WHERE
        semester = 1
    AND EXTRACT(YEAR FROM ofyear) = 2020
    AND cltype = 'T'
GROUP BY
    s.staffid,
    f.stafffname
    || ' '
    || f.stafflname,
    cltype
ORDER BY
    staffid,
    type;


/* 6. Given that the payment rate for a tutorial is $42.85 per hour 
and the payment rate for a lecture is $75.60 per hour, 
calculate the total weekly payment (the sum of both tutorial and lecture payments) 
for each staff member in semester 1 2020. 
In the display, include staff id, staff name, total weekly payment for tutorials, 
total weekly payment for lectures and the total weekly payment. 
If the payment is null, show it as $0.00. 
Order the list by increasing order of staff id.*/
SELECT
    a.staffid,
    a.staffname,
    a.weekly_payment    AS tutorial_payment,
    b.weekly_payment    AS lecture_payment,
    lpad(to_char(to_number(a.weekly_payment, '$999.99') + to_number(b.weekly_payment,
    '$999.99'),
                 '$999.99'),
         20,
         ' ')           AS total_weekly_payment
FROM
         (
        SELECT
            s.staffid,
            f.stafffname
            || ' '
            || f.stafflname                                                               AS staffname,
            CASE cltype
                WHEN 'L'  THEN
                    'Lecture'
                WHEN 'T'  THEN
                    'Tutorial'
            END                                                                           AS type,
            COUNT(classno)                                                                AS no_of_classes,
            SUM(clduration)                                                               AS total_hours,
            to_char((COUNT(classno) * SUM(clduration) * 42.85), '$999.99')                AS weekly_payment
        FROM
                 uni.schedclass s
            JOIN uni.staff f ON s.staffid = f.staffid
        WHERE
                semester = 1
            AND EXTRACT(YEAR FROM ofyear) = 2020
            AND cltype = 'T'
        GROUP BY
            s.staffid,
            f.stafffname
            || ' '
            || f.stafflname,
            cltype
    ) a
    JOIN (
        SELECT
            s.staffid,
            f.stafffname
            || ' '
            || f.stafflname                                                              AS staffname,
            CASE cltype
                WHEN 'L'  THEN
                    'Lecture'
                WHEN 'T'  THEN
                    'Tutorial'
            END                                                                          AS type,
            COUNT(classno)                                                               AS no_of_classes,
            SUM(clduration)                                                              AS total_hours,
            to_char((COUNT(classno) * SUM(clduration) * 75.6), '$999.99')                AS weekly_payment
        FROM
                 uni.schedclass s
            JOIN uni.staff f ON s.staffid = f.staffid
        WHERE
                semester = 1
            AND EXTRACT(YEAR FROM ofyear) = 2020
            AND cltype = 'L'
        GROUP BY
            s.staffid,
            f.stafffname
            || ' '
            || f.stafflname,
            cltype
    ) b ON a.staffid = b.staffid;

/* 7. Assume that all units are worth 6 credit points each, 
calculate each student’s Weighted Average Mark (WAM) and GPA. 
Please refer to these Monash websites: https://www.monash.edu/exams/results/wam 
and https://www.monash.edu/exams/results/gpa for more information about WAM and GPA respectively. 
Do not include WH or DEF grade in the calculation.


Include student id, student full name (in a 40 characters wide column headed “Student Full Name�?), 
WAM and GPA in the display. Order the list by descending order of WAM then descending order of GPA.
*/
SELECT
    s.studid,
    cast((s.studfname
         || ' '
         || s.studlname) as char(40) ) as "Student Full name",
    to_char( sum (case
    WHEN
        substr(unitcode, 4, 1) = 1
        AND mark IS NOT NULL
    THEN
        mark * 3.0 
    when substr(unitcode,4,1)<>1 and mark is not null then
    mark*6 end)/ sum(
                        CASE
                                WHEN substr(unitcode, 4, 1) = 1             THEN
                                        3.0
                                WHEN substr(unitcode, 4, 1) <> 1            THEN
                                        6.0
                        END
                     ),
        '990.99') as WAM,
                      to_char((SUM(
                          CASE
                              WHEN mark IS NOT NULL
                                   AND grade = 'N' THEN
                                  0.3
                              WHEN mark IS NOT NULL
                                   AND grade = 'P' THEN
                                  1
                              WHEN mark IS NOT NULL
                                   AND grade = 'C' THEN
                                  2
                              WHEN mark IS NOT NULL
                                   AND grade = 'D' THEN
                                  3
                              WHEN mark IS NOT NULL
                                   AND grade = 'HD' THEN
                                  4
                          END
                      ) * 6) /(COUNT(mark) * 6),
                              '990.99') AS gpa

from uni.enrolment e
INNER JOIN uni.student s ON e.studid = s.studid
group BY s.studid,
                                                         s.studfname,
                                                         s.studlname
order BY wam DESC,
gpa DESC ;

spool off
set echo off

