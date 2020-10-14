
--ZIXIN HAO
--30758017
set echo on
spool week9_dml_output.txt.
--9.2.1 UPDATE
select * from enrolment;
select * from unit;

--1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.

update unit
set unit_name =  'place holder unit' where unit_name = 'FIT Last Unit' and unit_code = 'FIT9999';

--2. Enter the mark and grade for the student with the student number of 11111113 for the unit
--code FIT5132 that the student enrolled in semester 2 of 2014. The mark is 75 and the grade
--is D.

update enrolment
set enrol_mark= 75, enrol_grade='D' where stu_nbr=11111113 and unit_code='FIT5132' and enrol_semester=2 and enrol_year=2014; 

--3. The university has introduced a new grade classification scale. The new classifications are:
update enrolment
set enrol_grade = 
case when enrol_mark between 45 and 54 then 'P1'
when enrol_mark between 55 and 64 then 'P2'
when enrol_mark between 65 and 74 then 'C'
when enrol_mark between 75 and 84 then 'D'
when enrol_mark between 85 and 100 then 'HD'
when enrol_mark between 0 and 44 then 'N'
end
;

--9.2.2 DELETE
--task1
Delete from enrolment 
where stu_nbr=11111114 and enrol_semester='2' and enrol_year=2014;

--task2
delete from enrolment where stu_nbr=11111113;
delete from student where stu_nbr=11111113;

--task3
select * from student;
insert into student values(11111113,'Wendy','Wheat',to_date('21-Feb-2000','dd-Mon-yyyy'));

commit;
spool off
set echo off
