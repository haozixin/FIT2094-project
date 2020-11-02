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
SELECT
    artist_code       AS "Artist Code",
    artist_gname
    || ' '
    || artist_fname    AS "Artist Name"




/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE





