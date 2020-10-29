--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:


2. the beginning of the display generally start with one month after submission. 
3. the date of sale must between beginning and end of display.
4. sale price is bigger than artwork_minpayment after deducting MAU fees and gallery fees
5. submission date is the start-date of ’w‘ status. 
*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

--15 ARTWORKs
insert into ARTWORK values(0001,0001,'the blue dancers',2345.47,to_date('21-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0002,0001,'Saint George and the Dragon',2938.94,to_date('10-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0003,0001,'The Burning of the Houses of Parliament',10029.90,to_date('15-Feb-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0001,'night flight',10112.74,to_date('31-Mar-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0005,0001,'The Rules',6029.00,to_date('20-Apr-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0006,0001,'Homage to the Square',9456.94,to_date('1-May-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0007,0001,'Yellow Country',3418.40,to_date('11-Sep-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0001,'Meeting of Two Intensities',3587.90,to_date('16-Oct-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0001,'Blue Concentric',5187.40,to_date('21-Dec-2019','dd-Mon-yyyy'));
insert into ARTWORK values(00010,0001,'For an Anniversary',13000.00,to_date('19-Nov-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0002,'Aventure Pictural',7899.00,to_date('21-Jan-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0003,'Portrait of Henry VIII',8860.00,to_date('21-Apr-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0002,'bacchus and ariadne',40200.94,to_date('1-Apr-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0002,'jupiter and io',50000.00,to_date('26-Jan-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0003,'st john of patmos vision',78000.40,to_date('30-May-2020','dd-Mon-yyyy'));

--10 AW_DISPLAYs

insert into AW_DISPLAY values(1,1,1,to_date('21-Feb-2019','dd-Mon-yyyy'),to_date('10-Apr-2019','dd-Mon-yyyy'),1);--sold

insert into AW_DISPLAY values(2,3,1,to_date('15-Mar-2019','dd-Mon-yyyy'),to_date('15-May-2019','dd-Mon-yyyy'),1);
insert into AW_DISPLAY values(3,3,1,to_date('30-Jun-2019','dd-Mon-yyyy'),to_date('31-jul-2019','dd-Mon-yyyy'),2);

insert into AW_DISPLAY values(4,5,1,to_date('20-May-2019','dd-Mon-yyyy'),to_date('2-Jul-2019','dd-Mon-yyyy'),2);--sold
insert into AW_DISPLAY values(5,4,3,to_date('21-May-2020','dd-Mon-yyyy'),to_date('21-Jul-2020','dd-Mon-yyyy'),2);--sold
insert into AW_DISPLAY values(6,8,2,to_date('1-May-2020','dd-Mon-yyyy'),to_date('1-Jun-2020','dd-Mon-yyyy'),3);--sold
insert into AW_DISPLAY values(7,9,2,to_date('26-Feb-2020','dd-Mon-yyyy'),to_date('26-Apr-2020','dd-Mon-yyyy'),4);
insert into AW_DISPLAY values(8,9,3,to_date('30-Jun-2020','dd-Mon-yyyy'),NULL,4);
insert into AW_DISPLAY values(9,9,1,to_date('21-Jan-2019','dd-Mon-yyyy'),to_date('21-Mar-2020','dd-Mon-yyyy'),5);
insert into AW_DISPLAY values(10,4,2,to_date('21-Feb-2020','dd-Mon-yyyy'),to_date('21-Apr-2020','dd-Mon-yyyy'),5);


--insert into SALE values(1,to_date(),price=minmum+20%+1's rate,1,1);
insert into SALE values(1,to_date('10-Apr-2019','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=1 and artwork_no=1)/(1-0.2-0.056))+1000 ,1,1);
insert into SALE values(2,to_date('2-Jul-2019','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=5 and artwork_no=1)/(1-0.2-0.103))+700 ,5,4);
insert into SALE values(3,to_date('21-Jul-2020','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=4 and artwork_no=3)/(1-0.2-0.103))+1100 ,7,5);
insert into SALE values(4,to_date('1-Jun-2020','dd-Mon-yyyy'),((select artwork_minpayment from artwork where artist_code=8 and artwork_no=2)/(1-0.2-0.075))+900 ,3,6);


--15 aw_status-W
insert into AW_STATUS values(1,1,1,to_date('21-Jan-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(2,2,1,to_date('10-Jan-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(3,3,1,to_date('15-Feb-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(4,4,1,to_date('31-Mar-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(5,5,1,to_date('20-Apr-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(6,6,1,to_date('1-May-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(7,7,1,to_date('11-Sep-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(8,8,1,to_date('16-Oct-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(9,9,1,to_date('21-Dec-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(10,10,1,to_date('19-Nov-2019','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(11,4,2,to_date('21-Jan-2020','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(12,4,3,to_date('21-Apr-2020','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(13,8,2,to_date('1-Apr-2020','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(14,9,2,to_date('26-Jan-2020','dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(15,9,3,to_date('30-May-2020','dd-Mon-yyyy'),'W',null);

--10 aw_status-T
insert into AW_STATUS values(16,1,1,to_date('21-Jan-2019','dd-Mon-yyyy')+10,'T',null);
insert into AW_STATUS values(17,2,1,to_date('10-Jan-2019','dd-Mon-yyyy')+8,'T',null);
insert into AW_STATUS values(18,3,1,to_date('15-Feb-2019','dd-Mon-yyyy')+9,'T',null);
insert into AW_STATUS values(19,4,1,to_date('31-Mar-2019','dd-Mon-yyyy')+11,'T',null);
insert into AW_STATUS values(20,5,1,to_date('20-Apr-2019','dd-Mon-yyyy')+12,'T',null);
insert into AW_STATUS values(21,6,1,to_date('1-May-2019','dd-Mon-yyyy')+7,'T',null);
insert into AW_STATUS values(22,7,1,to_date('11-Sep-2019','dd-Mon-yyyy')+8,'T',null);
insert into AW_STATUS values(23,8,1,to_date('16-Oct-2019','dd-Mon-yyyy')+9,'T',null);
insert into AW_STATUS values(24,9,1,to_date('21-Dec-2019','dd-Mon-yyyy')+10,'T',null);
insert into AW_STATUS values(25,10,1,to_date('19-Nov-2019','dd-Mon-yyyy')+11,'T',null);
insert into AW_STATUS values(26,4,2,to_date('21-Jan-2020','dd-Mon-yyyy')+12,'T',null);
insert into AW_STATUS values(27,4,3,to_date('21-Apr-2020','dd-Mon-yyyy')+10,'T',null);
insert into AW_STATUS values(28,8,2,to_date('1-Apr-2020','dd-Mon-yyyy')+10,'T',null);
insert into AW_STATUS values(29,9,2,to_date('26-Jan-2020','dd-Mon-yyyy')+10,'T',null);
insert into AW_STATUS values(30,9,3,to_date('30-May-2020','dd-Mon-yyyy')+10,'T',null);

--10 aw_status-G

insert into AW_STATUS values(31,1,1,to_date('21-Feb-2019','dd-Mon-yyyy'),'G',1);
insert into AW_STATUS values(32,3,1,to_date('15-Mar-2019','dd-Mon-yyyy'),'G',1);
insert into AW_STATUS values(33,3,1,to_date('30-Jun-2019','dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(34,5,1,to_date('20-May-2019','dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(35,4,3,to_date('21-May-2020','dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(36,8,2,to_date('1-May-2020','dd-Mon-yyyy'),'G',3);
insert into AW_STATUS values(37,9,2,to_date('26-Feb-2020','dd-Mon-yyyy'),'G',4);
insert into AW_STATUS values(38,9,3,to_date('30-Jun-2020','dd-Mon-yyyy'),'G',4);
insert into AW_STATUS values(39,9,1,to_date('21-Jan-2019','dd-Mon-yyyy'),'G',5);
insert into AW_STATUS values(40,4,2,to_date('21-Feb-2020','dd-Mon-yyyy'),'G',5);



--4 aw_status-S
insert into AW_STATUS values(41,1,1,to_date('10-Apr-2019','dd-Mon-yyyy'),'S',null);
insert into AW_STATUS values(42,5,1,to_date('2-Jul-2019','dd-Mon-yyyy'),'S',null);
insert into AW_STATUS values(43,4,3,to_date('21-Jul-2020','dd-Mon-yyyy'),'S',null);
insert into AW_STATUS values(44,8,2,to_date('1-Jun-2020','dd-Mon-yyyy'),'S',null);

--4 aw_status-T(return_artwork -->T )
insert into AW_STATUS values(45,3,1,to_date('15-May-2019','dd-Mon-yyyy'),'T',null);
insert into AW_STATUS values(46,3,1,to_date('31-jul-2019','dd-Mon-yyyy'),'T',null);
insert into AW_STATUS values(47,9,2,to_date('26-Apr-2020','dd-Mon-yyyy'),'T',null);
insert into AW_STATUS values(48,9,1,to_date('21-Mar-2020','dd-Mon-yyyy'),'T',null);
insert into AW_STATUS values(49,4,2,to_date('21-Apr-2020','dd-Mon-yyyy'),'T',null);

--4 aw_status-W (return_artwork--> W, after T)
insert into AW_STATUS values(50,3,1,to_date('15-May-2019','dd-Mon-yyyy')+20,'T',null);
insert into AW_STATUS values(51,3,1,to_date('31-jul-2019','dd-Mon-yyyy')+20,'T',null);
insert into AW_STATUS values(52,9,2,to_date('26-Apr-2020','dd-Mon-yyyy')+20,'T',null);
insert into AW_STATUS values(53,9,1,to_date('21-Mar-2020','dd-Mon-yyyy')+20,'T',null);
insert into AW_STATUS values(54,4,2,to_date('21-Apr-2020','dd-Mon-yyyy')+20,'T',null);

commit;