--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:

1.submission dates of artworks from different artists maybe are on the same date and insert order is against the date of submission.
2. submission date means the artwork has the status of "W" from that day.
3. the date of sale must between beginning and end of display.
4. sale price is bigger than artwork_minpayment after deducting MAU fees and gallery fees
5. assuming the MAU business time is from 9:00am to 5:00pm and also keep accepting submission in weekends. 
6. assuming gallery can accept and display artwork at any date as long as there are any empty place(display is on the next day), how long depends on the contract
and when artwork has arrived gallery, the status of artwork is "G"
7. transformation time is all about 3 hours (maybe little longer or shorter sometimes). if it cannot arrive before gallery close, send it tommorrow.
8.assuming we can get gallery id from status "S", which represent where it is sold in.
9.at the begining of display we can get start date and end date, so, I sort aw_display by start date.
*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE


--16 ARTWORKs
insert into ARTWORK values(0001,0001,'the blue dancers',2345.47,to_date('10-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0002,0001,'Saint George and the Dragon',2938.94,to_date('13-Jan-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0003,0001,'The Burning of the Houses of Parliament',20029.90,to_date('15-Feb-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0001,'night flight',10112.74,to_date('31-Mar-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0005,0001,'The Rules',60290.00,to_date('20-Apr-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0006,0001,'Homage to the Square',9456.94,to_date('1-May-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0007,0001,'Yellow Country',3418.40,to_date('11-Sep-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0001,'Meeting of Two Intensities',3587.90,to_date('16-Oct-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0001,'Blue Concentric',5187.40,to_date('21-Nov-2019','dd-Mon-yyyy'));
insert into ARTWORK values(00010,0001,'For an Anniversary',130000.00,to_date('21-Nov-2019','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0002,'Aventure Pictural',7899.00,to_date('21-Jan-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0004,0003,'Portrait of Henry VIII',8860.00,to_date('21-Feb-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0008,0002,'bacchus and ariadne',40200.94,to_date('1-Apr-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0002,'jupiter and io',50000.00,to_date('26-May-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0009,0003,'st john of patmos vision',78000.40,to_date('30-Jun-2020','dd-Mon-yyyy'));
insert into ARTWORK values(0007,0002,'a picture of the picture',3418.40,to_date('1-Jul-2020','dd-Mon-yyyy'));

--STATUS
insert into AW_STATUS values(1,1,1,to_date('9:10:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(2,1,1,to_date('10:00:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'T',1);
insert into AW_STATUS values(3,1,1,to_date('13:00:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'G',1);
insert into AW_STATUS values(4,2,1,to_date('17:00:00 13-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(5,2,1,to_date('9:00:00 14-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'T',1);
insert into AW_STATUS values(6,2,1,to_date('12:30:00 14-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'G',1);
insert into AW_STATUS values(7,1,1,to_date('14:00:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy')+1+6,'S',1);
insert into AW_STATUS values(8,2,1,to_date('14:00:00 14-Jan-2019','HH24:MI:SS dd-Mon-yyyy')+1+5,'S',1);
insert into AW_STATUS values(9,3,1,to_date('15:20:00 15-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(10,3,1,to_date('9:00:00 16-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(11,3,1,to_date('11:50:00 16-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(12,3,1,to_date('15:00:00 16-Feb-2019','HH24:MI:SS dd-Mon-yyyy')+1+4,'S',2);
insert into AW_STATUS values(13,4,1,to_date('12:00:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(14,4,1,to_date('13:00:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(15,4,1,to_date('16:20:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(16,4,1,to_date('11:00:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy')+1+7,'S',2);
insert into AW_STATUS values(17,5,1,to_date('9:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(18,5,1,to_date('10:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(19,5,1,to_date('13:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);
insert into AW_STATUS values(20,6,1,to_date('10:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(21,6,1,to_date('11:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'T',3);
insert into AW_STATUS values(22,6,1,to_date('14:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'G',3);

insert into aw_status values(23,6,1,to_date('11:00:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1,'T',3 );
insert into aw_status values(24,6,1,to_date('14:00:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1,'W',null);
insert into aw_status values(25,6,1,to_date('11:00:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1+4,'T',5 );--2019.5.14
insert into aw_status values(26,6,1,to_date('13:50:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1+4,'G',5 );--2019.5.14
insert into aw_status values(27,6,1,to_date('11:00:00 18-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1,'T',5 );--2019.5.31
insert into aw_status values(28,6,1,to_date('14:00:00 18-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1,'W',null);--2019.5.31

insert into aw_status values(29,6,1,to_date('11:00:00 18-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1+2,'T',5 );--2019.6.2
insert into aw_status values(30,6,1,to_date('13:50:00 18-May-2019','HH24:MI:SS dd-Mon-yyyy')+1+11+1+2,'G',5 );

insert into AW_STATUS values(31,7,1,to_date('14:40:00 11-Sep-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(32,8,1,to_date('15:00:00 16-Oct-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(33,9,1,to_date('16:10:00 21-Nov-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);--same day different time
insert into AW_STATUS values(34,10,1,to_date('16:20:00 21-Nov-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);--same day different time
insert into AW_STATUS values(35,7,1,to_date('14:20:00 11-Sep-2019','HH24:MI:SS dd-Mon-yyyy')+110,'R',null);------2019.12.30
insert into AW_STATUS values(36,8,1,to_date('14:20:00 16-Oct-2019','HH24:MI:SS dd-Mon-yyyy')+80,'R',null);------2020.1.4
insert into AW_STATUS values(37,4,2,to_date('13:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(38,4,2,to_date('14:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'T',4);
insert into AW_STATUS values(39,4,2,to_date('17:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'G',4);
insert into AW_STATUS values(40,4,3,to_date('15:15:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(41,4,3,to_date('16:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(42,4,3,to_date('18:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);
insert into AW_STATUS values(43,8,2,to_date('11:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(44,8,2,to_date('15:20:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(45,8,2,to_date('18:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);
insert into AW_STATUS values(46,9,2,to_date('11:10:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(47,9,2,to_date('15:20:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(48,9,2,to_date('18:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);
insert into AW_STATUS values(49,9,2,to_date('10:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+1+14+1,'T',5);--
insert into AW_STATUS values(50,9,2,to_date('13:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+1+14+1,'W',null);--2020.6.11
insert into AW_STATUS values(51,9,3,to_date('15:35:00 30-Jun-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(52,9,2,to_date('10:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+1+14+1+20,'R',null);
insert into AW_STATUS values(53,7,2,to_date('14:40:00 1-Jul-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(54,7,2,to_date('14:20:00 1-Jul-2020','HH24:MI:SS dd-Mon-yyyy')+10,'R',null);------2020.7.11
insert into AW_STATUS values(55,9,3,to_date('10:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1+106,'R',null);--2020.7.31





--10 AW_DISPLAYs
insert into AW_DISPLAY values(1,1,1,to_date('10-Jan-2019','dd-Mon-yyyy')+1,to_date('10-Jan-2019','dd-Mon-yyyy')+1+10,1);--sold
insert into AW_DISPLAY values(2,2,1,to_date('14-Jan-2019','dd-Mon-yyyy')+1,to_date('14-Jan-2019','dd-Mon-yyyy')+1+10,1);--sold
insert into AW_DISPLAY values(3,3,1,to_date('16-Feb-2019','dd-Mon-yyyy')+1,to_date('16-Feb-2019','dd-Mon-yyyy')+1+7,2);--sold
insert into AW_DISPLAY values(4,4,1,to_date('31-Mar-2019','dd-Mon-yyyy')+1,to_date('31-May-2019','dd-Mon-yyyy')+1+8,2);--sold
insert into AW_DISPLAY values(5,5,1,to_date('20-Apr-2019','dd-Mon-yyyy')+1,to_date('20-Apr-2019','dd-Mon-yyyy')+1+10,2);
insert into AW_DISPLAY values(6,6,1,to_date('1-May-2019','dd-Mon-yyyy')+1,to_date('1-May-2019','dd-Mon-yyyy')+1+11,3);
insert into AW_DISPLAY values(7,6,1,to_date('18-May-2019','dd-Mon-yyyy')+1,to_date('18-May-2019','dd-Mon-yyyy')+1+11,5);
insert into AW_DISPLAY values(8,6,1,to_date('2-Jun-2019','dd-Mon-yyyy')+1,to_date('2-Jun-2019','dd-Mon-yyyy')+1+6,5);
insert into AW_DISPLAY values(9,4,2,to_date('21-Jan-2020','dd-Mon-yyyy')+1,to_date('21-Jan-2020','dd-Mon-yyyy')+1+14,4);
insert into AW_DISPLAY values(10,4,3,to_date('21-Feb-2020','dd-Mon-yyyy')+1,to_date('21-Feb-2020','dd-Mon-yyyy')+1+13,5);
insert into AW_DISPLAY values(11,8,2,to_date('1-Apr-2020','dd-Mon-yyyy')+1,to_date('1-Apr-2020','dd-Mon-yyyy')+1+13,5);
insert into AW_DISPLAY values(12,9,2,to_date('26-May-2020','dd-Mon-yyyy')+1,to_date('26-May-2020','dd-Mon-yyyy')+1+13,5);




--4 SALEs
insert into SALE values (1,to_date('10-Jan-2019','dd-Mon-yyyy')+1+6, (2345.47+500)/(1-0.2-0.056),3,1);
insert into SALE values (2,to_date('14-Jan-2019','dd-Mon-yyyy')+1+5, (2938.94+400)/(1-0.2-0.056),7,2);
insert into SALE values (3,to_date('16-Feb-2019','dd-Mon-yyyy')+1+4, (20029.90+2000)/(1-0.2-0.103),5,3);
insert into SALE values (4,to_date('31-Mar-2019','dd-Mon-yyyy')+1+7, (10112.74+1000)/(1-0.2-0.103),6,4);

--


commit;
