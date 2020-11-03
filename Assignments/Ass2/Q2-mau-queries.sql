--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:

for Query 3, consider sold artwork during a display as uncompleting the display.


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
    a.artist_code                                                                               AS "Artist Code",
    CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END                                                                                         AS "Artist Name",
    s.artwork_no                                                                                AS "Artwork No.",
    artwork_title                                                                               AS "Artwork Title",
    lpad(to_char(artwork_minpayment, '$9999990.99'), 25, ' ')                                      AS "Artwork Min. payment",
    to_date(aws_date_time, 'dd-Mon-yyyy') - to_date(artwork_submitdate, 'dd-Mon-yyyy')              AS
    "Number of Days with MAU"
FROM
         aw_status s
    JOIN artist   a ON s.artist_code = a.artist_code
    JOIN artwork  w ON w.artist_code = s.artist_code
                      AND w.artwork_no = s.artwork_no
WHERE
        aws_action = 'R'
    AND ( s.artist_code, s.artwork_no ) IN (
        SELECT
            artist_code, artwork_no
        FROM
            aw_status
        WHERE
            aws_action = 'R'
        MINUS
        SELECT
            artist_code,
            artwork_no
        FROM
            aw_status
        WHERE
            aws_action = 'G'
    )
    AND ( to_date(aws_date_time, 'dd-Mon-yyyy') - to_date(artwork_submitdate, 'dd-Mon-yyyy') ) <
    120
ORDER BY
    a.artist_code ASC,
    "Number of Days with MAU" DESC;



/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT
    d.artist_code                                                   AS "Artist Code",
    d.artwork_no                                                    AS "Artwork No.",
    artwork_title                                                   AS "Artwork Title",
    g.gallery_id                                                    AS "Gallery ID",
    gallery_name                                                    AS "Gallery Name",
    to_char(d.aw_display_start_date, 'Dy dd Month     yyyy')         AS "Display Start Date",
    CASE
        WHEN d.aw_display_end_date IS NULL THEN
            NULL
        WHEN d.aw_display_end_date IS NOT NULL THEN
            ( d.aw_display_end_date - d.aw_display_start_date )
    END                                                             AS "Number of Days in Gallery"
FROM
         gallery g
    JOIN aw_display  d ON g.gallery_id = d.gallery_id
    JOIN artwork     a ON a.artist_code = d.artist_code
                      AND a.artwork_no = d.artwork_no
WHERE
        ( d.aw_display_end_date - d.aw_display_start_date + 1 ) < 13
    AND d.aw_display_end_date IS NOT NULL AND (a.artist_code,a.artwork_no) not in (select artist_code, artwork_no from aw_status where aws_action='S')
ORDER BY
    a.artist_code ASC,
    a.artwork_no ASC,
    "Number of Days in Gallery" ASC,
    "Gallery ID" ASC,
    "Display Start Date" ASC; 




/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
SELECT
    a.artist_code         AS "Artist Code",
    a.artwork_no          AS "Artwork No.",
    artwork_title         AS "Artwork_title",
    COUNT(aws_action)     AS "Number of Movements"
FROM
    artwork    a
    LEFT OUTER JOIN aw_status  aw ON a.artist_code = aw.artist_code
                                    AND a.artwork_no = aw.artwork_no
WHERE
    aws_action = 'T'
GROUP BY
    a.artist_code,
    a.artwork_no,
    artwork_title
HAVING
    COUNT(aws_action) < ( (
        SELECT
            COUNT(*)
        FROM
            artwork    a
            LEFT OUTER JOIN aw_status  aw ON a.artist_code = aw.artist_code
                                            AND a.artwork_no = aw.artwork_no
        WHERE
            aws_action = 'T'
    ) / (
        SELECT
            COUNT(DISTINCT a.artwork_title)
        FROM
            artwork    a
            LEFT OUTER JOIN aw_status  aw ON a.artist_code = aw.artist_code
                                            AND a.artwork_no = aw.artwork_no
        WHERE
            aws_action = 'T'
    ) )
ORDER BY
    "Number of Movements" ASC,
    "Artist Code" ASC,
    "Artwork No." ASC;



/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

SELECT
    s.artist_code      AS artist_code,
    a.artwork_title    AS artwork_title,
    lpad(to_char(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 1
    ) / 100),
                 '$9999990.99'),
         25,
         ' ')          AS "Min. Sale Price Est.(Gallery 1)",
    lpad(to_char(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 2
    ) / 100),
                 '$9999990.99'),
         25,
         ' ')          AS "Min. Sale Price Est.(Gallery 2)",
    lpad(to_char(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 3
    ) / 100),
                 '$9999990.99'),
         25,
         ' ')          AS "Min. Sale Price Est.(Gallery 3)",
    lpad(to_char(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 4
    ) / 100),
                 '$9999990.99'),
         25,
         ' ')          AS "Min. Sale Price Est.(Gallery 4)",
    lpad(to_char(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 5
    ) / 100),
                 '$9999990.99'),
         25,
         ' ')          AS "Min. Sale Price Est.(Gallery 5)"
FROM
         aw_status s
    JOIN artwork a ON a.artist_code = s.artist_code
                      AND a.artwork_no = s.artwork_no
WHERE
    ( s.artist_code, s.artwork_no ) NOT IN (
        SELECT
            artist_code, artwork_no
        FROM
            aw_status
        WHERE
            aws_action = 'S'
            OR aws_action = 'R'
    )
GROUP BY
    s.artist_code,
    s.artwork_no,
    a.artwork_title,
    a.artwork_minpayment
ORDER BY
    artist_code ASC,
    artwork_title ASC;


/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


( SELECT
    lpad(to_char(a.artist_code, '90'), 10, ' ')                AS "Artist Code",
    CASE
        WHEN artist_gname IS NULL THEN
            artist_gname
            || ''
            || artist_fname
        WHEN artist_gname IS NOT NULL THEN
            artist_gname
            || ' '
            || artist_fname
    END                                                     AS "Artist Full Name",
    artwork_title                                           AS "Artwork Title",
    lpad(to_char(d.gallery_id, '90'), 10, ' ')                 AS "Gallery ID",
    to_char(s.sale_price, '$9999990.99')                     AS "Sale price",
    lpad(to_char(round((s.sale_price - a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = d.gallery_id
    ) / 100)) /(a.artwork_minpayment /(1 - 0.2 -(
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = d.gallery_id
    ) / 100)) * 100,
                       1)
                 || '%'),
         25,
         ' ')                                               AS "% Sold Above Min. Sell price"
FROM
         aw_display d
    JOIN sale     s ON d.aw_display_id = s.aw_display_id
    JOIN artwork  a ON a.artist_code = d.artist_code
                      AND a.artwork_no = d.artwork_no
    JOIN artist   t ON a.artist_code = t.artist_code
)
UNION
SELECT
    lpad(
        CASE
            WHEN "Artist Code" IS NOT NULL THEN
                '-'
        END, 10, '-')               AS "Artist Code",
    lpad(
        CASE
            WHEN "Artist Full Name" IS NOT NULL THEN
                '-'
        END, 30, '-')               AS "Artist Full Name",
    lpad(
        CASE
            WHEN "Artwork Title" IS NOT NULL THEN
                '-'
        END, 30, '-')               AS "Artwork Title",
    lpad(
        CASE
            WHEN "Gallery ID" IS NOT NULL THEN
                '-'
        END, 10, '-')               AS "Gallery ID",
    lpad(
        CASE
            WHEN "Sale price" IS NOT NULL THEN
                'AVERAGE:'
        END, 13, ' ')               AS "Sale price",
    lpad(to_char(AVG("% Sold Above Min. Sell price")
                 || '%'), 25, ' ')          AS "% Sold Above Min. Sell price"
FROM
    (
        SELECT
            a.artist_code                               AS "Artist Code",
            CASE
                WHEN artist_gname IS NULL THEN
                    artist_gname
                    || ''
                    || artist_fname
                WHEN artist_gname IS NOT NULL THEN
                    artist_gname
                    || ' '
                    || artist_fname
            END                                         AS "Artist Full Name",
            artwork_title                               AS "Artwork Title",
            d.gallery_id                                AS "Gallery ID",
            to_char(s.sale_price, '$9999990.99')         AS "Sale price",
            lpad(round((s.sale_price - a.artwork_minpayment /(1 - 0.2 -(
                SELECT
                    gallery_sale_percent
                FROM
                    gallery
                WHERE
                    gallery_id = d.gallery_id
            ) / 100)) /(a.artwork_minpayment /(1 - 0.2 -(
                SELECT
                    gallery_sale_percent
                FROM
                    gallery
                WHERE
                    gallery_id = d.gallery_id
            ) / 100)) * 100,
                       1),
                 25,
                 ' ')                                   AS "% Sold Above Min. Sell price"
        FROM
                 aw_display d
            JOIN sale     s ON d.aw_display_id = s.aw_display_id
            JOIN artwork  a ON a.artist_code = d.artist_code
                              AND a.artwork_no = d.artwork_no
            JOIN artist   t ON a.artist_code = t.artist_code
    )
GROUP BY
    lpad(
        CASE
            WHEN "Artist Code" IS NOT NULL THEN
                '-'
        END, 10, '-'),
    lpad(
        CASE
            WHEN "Artist Full Name" IS NOT NULL THEN
                '-'
        END, 30, '-'),
    lpad(
        CASE
            WHEN "Artwork Title" IS NOT NULL THEN
                '-'
        END, 30, '-'),
    lpad(
        CASE
            WHEN "Gallery ID" IS NOT NULL THEN
                '-'
        END, 10, '-'),
    lpad(
        CASE
            WHEN "Sale price" IS NOT NULL THEN
                'AVERAGE:'
        END, 13, ' ');