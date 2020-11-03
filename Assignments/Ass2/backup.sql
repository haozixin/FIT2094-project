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
*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

--15 ARTWORKs
--1
insert into ARTWORK values(0001,0001,'the blue dancers',2345.47,to_date('10-Jan-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(1,1,1,to_date('9:10:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(16,1,1,to_date('10:00:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'T',1);
insert into AW_STATUS values(31,1,1,to_date('13:00:00 10-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'G',1);

insert into AW_DISPLAY values(1,1,1,to_date('10-Jan-2019','dd-Mon-yyyy')+1,to_date('10-Jan-2019','dd-Mon-yyyy')+1+10,1);--sold

insert into SALE values (1,to_date('10-Jan-2019','dd-Mon-yyyy')+1+6, (2345.47+500)/(1-0.2-0.056),3,1);
insert into AW_STATUS values(41,1,1,to_date('10-Jan-2019','dd-Mon-yyyy')+1+6,'S',1);





--2
insert into ARTWORK values(0002,0001,'Saint George and the Dragon',2938.94,to_date('13-Jan-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(2,2,1,to_date('17:00:00 13-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(17,2,1,to_date('9:00:00 14-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'T',1);
insert into AW_STATUS values(32,2,1,to_date('12:30:00 14-Jan-2019','HH24:MI:SS dd-Mon-yyyy'),'G',1);

insert into AW_DISPLAY values(2,2,1,to_date('14-Jan-2019','dd-Mon-yyyy')+1,to_date('14-Jan-2019','dd-Mon-yyyy')+1+10,1);--sold

insert into SALE values (2,to_date('14-Jan-2019','dd-Mon-yyyy')+1+5, (2938.94+400)/(1-0.2-0.056),7,2);
insert into AW_STATUS values(42,2,1,to_date('14-Jan-2019','dd-Mon-yyyy')+1+5,'S',1);


--3
insert into ARTWORK values(0003,0001,'The Burning of the Houses of Parliament',20029.90,to_date('15-Feb-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(3,3,1,to_date('15:20:00 15-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(18,3,1,to_date('9:00:00 16-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(33,3,1,to_date('11:50:00 16-Feb-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);

insert into AW_DISPLAY values(3,3,1,to_date('16-Feb-2019','dd-Mon-yyyy')+1,to_date('16-Feb-2019','dd-Mon-yyyy')+1+7,2);--sold

insert into SALE values (3,to_date('16-Feb-2019','dd-Mon-yyyy')+1+4, (20029.90+2000)/(1-0.2-0.103),5,3);
insert into AW_STATUS values(43,3,1,to_date('16-Feb-2019','dd-Mon-yyyy')+1+4,'S',2);



--4
insert into ARTWORK values(0004,0001,'night flight',10112.74,to_date('31-Mar-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(4,4,1,to_date('12:00:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(19,4,1,to_date('13:00:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(34,4,1,to_date('16:20:00 31-Mar-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);

insert into AW_DISPLAY values(4,4,1,to_date('31-Mar-2019','dd-Mon-yyyy')+1,to_date('31-May-2019','dd-Mon-yyyy')+1+8,2);--sold

insert into SALE values (4,to_date('31-Mar-2019','dd-Mon-yyyy')+1+7, (10112.74+1000)/(1-0.2-0.103),6,4);
insert into AW_STATUS values(44,4,1,to_date('31-Mar-2019','dd-Mon-yyyy')+1+7,'S',2);

--5
insert into ARTWORK values(0005,0001,'The Rules',60290.00,to_date('20-Apr-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(5,5,1,to_date('9:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(20,5,1,to_date('10:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'T',2);
insert into AW_STATUS values(35,5,1,to_date('13:30:00 20-Apr-2019','HH24:MI:SS dd-Mon-yyyy'),'G',2);

insert into AW_DISPLAY values(5,5,1,to_date('20-Apr-2019','dd-Mon-yyyy')+1,to_date('20-Apr-2019','dd-Mon-yyyy')+11,2);



--6
insert into ARTWORK values(0006,0001,'Homage to the Square',9456.94,to_date('1-May-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(6,6,1,to_date('10:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(21,6,1,to_date('11:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'T',3);
insert into AW_STATUS values(36,6,1,to_date('14:20:00 1-May-2019','HH24:MI:SS dd-Mon-yyyy'),'G',3);

insert into AW_DISPLAY values(6,6,1,to_date('1-May-2019','dd-Mon-yyyy')+1,to_date('1-May-2019','dd-Mon-yyyy')+12,3);


--7
insert into ARTWORK values(0007,0001,'Yellow Country',3418.40,to_date('11-Sep-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(7,7,1,to_date('14:40:00 11-Sep-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(36,7,1,to_date('14:20:00 11-Sep-2019','HH24:MI:SS dd-Mon-yyyy')+110,'R',null);------2019.12.30return

select to_date('14:20:00 16-Oct-2019','HH24:MI:SS dd-Mon-yyyy')+80 from dual;
--8
insert into ARTWORK values(0008,0001,'Meeting of Two Intensities',3587.90,to_date('16-Oct-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(8,8,1,to_date('15:00:00 16-Oct-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(36,8,1,to_date('14:20:00 16-Oct-2019','HH24:MI:SS dd-Mon-yyyy')+80,'R',null);------2020.1.4-return


--9
insert into ARTWORK values(0009,0001,'Blue Concentric',5187.40,to_date('21-Nov-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(9,9,1,to_date('16:10:00 21-Nov-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);--same day different time



--10
insert into ARTWORK values(00010,0001,'For an Anniversary',130000.00,to_date('21-Nov-2019','dd-Mon-yyyy'));
insert into AW_STATUS values(10,10,1,to_date('16:20:00 21-Nov-2019','HH24:MI:SS dd-Mon-yyyy'),'W',null);--same day different time

--11
insert into ARTWORK values(0004,0002,'Aventure Pictural',7899.00,to_date('21-Jan-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(11,4,2,to_date('13:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);

insert into AW_STATUS values(22,4,2,to_date('14:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'T',4);
insert into AW_STATUS values(37,4,2,to_date('17:45:00 21-Jan-2020','HH24:MI:SS dd-Mon-yyyy'),'G',4);

insert into AW_DISPLAY values(7,4,2,to_date('21-Jan-2020','dd-Mon-yyyy')+1,to_date('21-Jan-2020','dd-Mon-yyyy')+1+14,4);


--12
insert into ARTWORK values(0004,0003,'Portrait of Henry VIII',8860.00,to_date('21-Feb-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(12,4,3,to_date('15:15:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);

insert into AW_STATUS values(22,4,3,to_date('16:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(37,4,3,to_date('18:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);

insert into AW_DISPLAY values(8,4,3,to_date('21-Feb-2020','dd-Mon-yyyy')+1,to_date('21-Feb-2020','dd-Mon-yyyy')+14,5);

insert into AW_STATUS values(37,9,2,to_date('11:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1,'T',5);--
insert into AW_STATUS values(37,9,2,to_date('13:40:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1,'W',null);--
insert into AW_STATUS values(37,9,2,to_date('10:00:00 21-Feb-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1+90,'S',null);--

--13
insert into ARTWORK values(0008,0002,'bacchus and ariadne',40200.94,to_date('1-Apr-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(13,8,2,to_date('11:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);


insert into AW_STATUS values(22,8,2,to_date('15:20:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(37,8,2,to_date('18:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);

insert into AW_DISPLAY values(9,8,2,to_date('1-Apr-2020','dd-Mon-yyyy')+1,to_date('1-Apr-2020','dd-Mon-yyyy')+1+13,5);


insert into AW_STATUS values(37,9,2,to_date('10:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1,'T',5);--
insert into AW_STATUS values(37,9,2,to_date('13:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1,'W',null);--
insert into AW_STATUS values(37,9,2,to_date('10:00:00 1-Apr-2020','HH24:MI:SS dd-Mon-yyyy')+1+13+1+150,'S',null);--
--14
insert into ARTWORK values(0009,0002,'jupiter and io',50000.00,to_date('26-May-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(14,9,2,to_date('11:10:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);

insert into AW_STATUS values(22,9,2,to_date('15:20:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'T',5);
insert into AW_STATUS values(37,9,2,to_date('18:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy'),'G',5);

insert into AW_DISPLAY values(10,9,2,to_date('26-May-2020','dd-Mon-yyyy')+1,to_date('26-May-2020','dd-Mon-yyyy')+1+13,5);

insert into AW_STATUS values(37,9,2,to_date('10:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+15,'T',5);--
insert into AW_STATUS values(37,9,2,to_date('13:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+15,'W',null);--
insert into AW_STATUS values(37,9,2,to_date('15:00:00 26-May-2020','HH24:MI:SS dd-Mon-yyyy')+15+100,'R',null);--
--15
insert into ARTWORK values(0009,0003,'st john of patmos vision',78000.40,to_date('30-Jun-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(15,9,3,to_date('15:35:00 30-Jun-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);

--16
insert into ARTWORK values(0007,0002,'a picture of the picture',3418.40,to_date('1-Jul-2020','dd-Mon-yyyy'));
insert into AW_STATUS values(7,7,2,to_date('14:40:00 1-Jul-2020','HH24:MI:SS dd-Mon-yyyy'),'W',null);
insert into AW_STATUS values(36,7,2,to_date('14:20:00 1-Jul-2020','HH24:MI:SS dd-Mon-yyyy')+10,'R',null);------2020.7.11




 --****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:




*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    artist_code  AS "Artist Code",
    CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END          AS "Artist Name",
    CASE artist_state
        WHEN 'VIC'  THEN
            'Victoria'
        WHEN 'NSW'  THEN
            'New South Wales'
        WHEN 'WA'   THEN
            'Western Australia'
    END          AS "Artist State"
FROM
    artist
WHERE
    ( artist_fname IS NULL
      OR artist_gname IS NULL
      OR artist_phone IS NULL )
    AND artist_state IN ( 'VIC', 'NSW', 'WA' )
ORDER BY
    "Artist Code" ASC,
    "Artist Code" ASC;

/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select a.artist_code as "Artist Code", 
CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END          AS "Artist Name", s.artwork_no as "Artwork No.",artwork_title as "Artwork Title", lpad(to_char(artwork_minpayment,'$9999990.99'),25,' ') as "Artwork Min. payment",
   To_date(aws_date_time,'dd-Mon-yyyy')-to_date(artwork_submitdate,'dd-Mon-yyyy') as "Number of Days with MAU"
from aw_status s join artist a on s.artist_code=a.artist_code
join artwork w on w.artist_code = s.artist_code and w.artwork_no=s.artwork_no
where aws_action='R' and (s.artist_code, s.artwork_no) in (select artist_code, artwork_no from aw_status where aws_action = 'R'
minus
select artist_code, artwork_no from aw_status where aws_action = 'G') and (To_date(aws_date_time,'dd-Mon-yyyy')-to_date(artwork_submitdate,'dd-Mon-yyyy'))<120
order by a.artist_code asc,"Number of Days with MAU"desc;



/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select d.artist_code as "Artist Code",
d.artwork_no as "Artwork No.",
artwork_title as "Artwork Title",
g.gallery_id as "Gallery ID",
gallery_name as "Gallery Name",
to_char(d.aw_display_start_date,'Dy dd Month     yyyy') as "Display Start Date",
case  
when d.aw_display_end_date is null Then null
when d.aw_display_end_date is not null Then (d.aw_display_end_date - d.aw_display_start_date)
end as "Number of Days in Gallery"
from gallery g join aw_display d on g.gallery_id=d.gallery_id join artwork a on a.artist_code=d.artist_code and a.artwork_no=d.artwork_no 
where (d.aw_display_end_date - d.aw_display_start_date+1)<13 and d.aw_display_end_date is not null
order by a.artist_code asc, a.artwork_no asc, "Number of Days in Gallery" asc, "Gallery ID" asc, "Display Start Date" asc ; 




/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select a.artist_code as "Artist Code",
a.artwork_no as "Artwork No.",
artwork_title as "Artwork_title",
count(aws_action) as "Number of Movements"

from artwork a left OUTER join aw_status aw on a.artist_code=aw.artist_code and a.artwork_no=aw.artwork_no 
where aws_action='T' 
group by a.artist_code,a.artwork_no,artwork_title

having count(aws_action)<((select count(*)
from artwork a left OUTER join aw_status aw on a.artist_code=aw.artist_code and a.artwork_no=aw.artwork_no 
where aws_action='T'
)/(select count(distinct a.artwork_title)
from artwork a left OUTER join aw_status aw on a.artist_code=aw.artist_code and a.artwork_no=aw.artwork_no 
where aws_action='T'))
order by  "Number of Movements" asc, "Artist Code" asc, "Artwork No." asc
;



/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select 
s.artist_code as ARTIST_CODE,
a.artwork_title AS ARTWORK_TITLE,
lpad(to_char(a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=1)/100),'$9999990.99'),25,' ') as "Min. Sale Price Est.(Gallery 1)",
lpad(to_char(a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=2)/100),'$9999990.99'),25,' ') as "Min. Sale Price Est.(Gallery 2)",
lpad(to_char(a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=3)/100),'$9999990.99'),25,' ') as "Min. Sale Price Est.(Gallery 3)",
lpad(to_char(a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=4)/100),'$9999990.99'),25,' ') as "Min. Sale Price Est.(Gallery 4)",
lpad(to_char(a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=5)/100),'$9999990.99'),25,' ') as "Min. Sale Price Est.(Gallery 5)"

from aw_status s join artwork a on a.artist_code=s.artist_code and a.artwork_no=s.artwork_no
where (s.artist_code, s.artwork_no) not in 
(select artist_code, artwork_no from aw_status where aws_action='S' or aws_action='R')
group by s.artist_code,s.artwork_no,a.artwork_title,a.artwork_minpayment
order by ARTIST_CODE asc, ARTWORK_TITLE asc
;


/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


(
select lpad(to_char(a.artist_code,'90'),10,' ') as "Artist Code",
CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END          AS "Artist Full Name",
artwork_title as "Artwork Title",
lpad(to_char(d.gallery_id,'90'),10,' ') as "Gallery ID",
to_char(s.sale_price,'$9999990.99') as "Sale price",
lpad(to_char(round(
(s.sale_price - 
a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=d.gallery_id)/100))
/ (a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=d.gallery_id)/100)) 
*100,1 )
||'%'),25,' ')as "% Sold Above Min. Sell price"

from aw_display d join sale s on d.aw_display_id=s.aw_display_id 
join artwork a on a.artist_code=d.artist_code and a.artwork_no=d.artwork_no join artist t on a.artist_code=t.artist_code 
)

union
select 
lpad(case when "Artist Code" is not null 
then '-' end,10,'-' )as "Artist Code",
lpad(case when "Artist Full Name" is not null 
then '-' end,30,'-' )as "Artist Full Name",
lpad(case when "Artwork Title" is not null 
then '-' end,30,'-' )as "Artwork Title",
lpad(case when "Gallery ID" is not null 
then '-' end,10,'-' )as "Gallery ID",
lpad(case when "Sale price" is not null 
then 'AVERAGE:' end,13,' ' )as "Sale price",

lpad(to_char (avg("% Sold Above Min. Sell price")||'%'),25,' ')as "% Sold Above Min. Sell price"
from
(
select a.artist_code as "Artist Code",
CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END          AS "Artist Full Name",
artwork_title as "Artwork Title",
d.gallery_id as "Gallery ID",
to_char(s.sale_price,'$9999990.99') as "Sale price",
lpad(round(
(s.sale_price - 
a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=d.gallery_id)/100))
/ (a.artwork_minpayment/(1-0.2-(select gallery_sale_percent from gallery where gallery_id=d.gallery_id)/100)) 
*100,1 ),25,' ')as "% Sold Above Min. Sell price"

from aw_display d join sale s on d.aw_display_id=s.aw_display_id 
join artwork a on a.artist_code=d.artist_code and a.artwork_no=d.artwork_no join artist t on a.artist_code=t.artist_code 
)
group by lpad(case when "Artist Code" is not null 
then '-' end,10,'-' ),
lpad(case when "Artist Full Name" is not null 
then '-' end,30,'-' ),
lpad(case when "Artwork Title" is not null 
then '-' end,30,'-' ),
lpad(case when "Gallery ID" is not null 
then '-' end,10,'-' ),
lpad(case when "Sale price" is not null 
then 'AVERAGE:' end,13,' ' )
;

