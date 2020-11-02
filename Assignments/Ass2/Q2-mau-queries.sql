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





/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





