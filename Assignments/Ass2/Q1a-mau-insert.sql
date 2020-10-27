--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:

1. assuming the period of display is two months
2. the beginning of the display generally start with one month after submission. 
3. the date of sale must between beginning and end of display.

*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

--15 ARTWORKs
insert into ARTWORK values(0001,0001,'the blue dancers',2345.47,to_date('21-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0002,0002,'Saint George and the Dragon',2938.94,to_date('10-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0003,0003,'The Burning of the Houses of Parliament',10029.90,to_date('15-Feb-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0004,'night flight',10112.74,to_date('31-Mar-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0005,0005,'The Rules',6029.00,to_date('20-Apr-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0006,0006,'Homage to the Square',9456.94,to_date('1-May-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0007,0007,'Yellow Country',3418.40,to_date('11-Sep-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0008,'Meeting of Two Intensities',3587.90,to_date('16-Oct-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0009,'Blue Concentric',5187.40,to_date('21-Dec-2019','dd-Mon-yyyy'));
insert into ARTWORK values(00010,0010,'For an Anniversary',13000.00,to_date('19-Nov-2019','dd-Mon-yyyy'));
insert into ARTWORK values(00011,0011,'Aventure Pictural',7899.00,to_date('21-Jan-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0012,'Portrait of Henry VIII',8860.00,to_date('21-Apr-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0013,'bacchus and ariadne',40200.94,to_date('1-Apr-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0014,'jupiter and io',50000.00,to_date('26-Jan-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0015,'st john of patmos vision',78000.40,to_date('10-May-2020','dd-Mon-yyyy'));

--10 AW_DISPLAYs

insert into AW_DISPLAY values(1,1,1,to_date('21-Feb-2019','dd-Mon-yyyy'),to_date('10-Apr-2019','dd-Mon-yyyy'),1);

insert into AW_DISPLAY values(2,3,3,to_date('15-Mar-2019','dd-Mon-yyyy'),to_date('15-May-2019','dd-Mon-yyyy'),1);
insert into AW_DISPLAY values(3,3,3,to_date('31-May-2019','dd-Mon-yyyy'),to_date('31-jul-2019','dd-Mon-yyyy'),2);

insert into AW_DISPLAY values(4,5,5,to_date('20-May-2019','dd-Mon-yyyy'),to_date('2-Jul-2019','dd-Mon-yyyy'),2);
insert into AW_DISPLAY values(5,4,12,to_date('21-May-2020','dd-Mon-yyyy'),to_date('21-Jul-2020','dd-Mon-yyyy'),2);
insert into AW_DISPLAY values(6,8,13,to_date('1-May-2020','dd-Mon-yyyy'),to_date('1-Jun-2020','dd-Mon-yyyy'),3);
insert into AW_DISPLAY values(7,9,14,to_date('26-Feb-2020','dd-Mon-yyyy'),to_date('26-Apr-2020','dd-Mon-yyyy'),4);
insert into AW_DISPLAY values(8,9,15,to_date('30-May-2020','dd-Mon-yyyy'),to_date('30-Jul-2020','dd-Mon-yyyy'),4);
insert into AW_DISPLAY values(9,9,9,to_date('21-Feb-2019','dd-Mon-yyyy'),to_date('21-Mar-2020','dd-Mon-yyyy'),5);
insert into AW_DISPLAY values(10,11,11,to_date('21-Feb-2020','dd-Mon-yyyy'),to_date('21-Apr-2020','dd-Mon-yyyy'),5);


--insert into SALE values(1,to_date(),price=minmum+20%+1's rate,1,1);
insert into SALE values(1,to_date('10-Apr-2019','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=1 and artwork_no=1)/(1-0.2-0.056)) ,1,1);
insert into SALE values(2,to_date('2-Jul-2019','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=5 and artwork_no=5)/(1-0.2-0.103)) ,5,4);
insert into SALE values(3,to_date('21-Jul-2020','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=4 and artwork_no=12)/(1-0.2-0.103)) ,7,5);
insert into SALE values(4,to_date('1-Jun-2020','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=8 and artwork_no=13)/(1-0.2-0.075)) ,3,6);



rollback;





