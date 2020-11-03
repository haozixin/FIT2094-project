--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-mau-mods.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:
assume that the current percentage commissions were the same when the artwork was sold.



*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
ALTER TABLE customer ADD customer_deal_number NUMERIC(4) DEFAULT 0;

COMMENT ON COLUMN customer.customer_deal_number IS
    'total number of times each customer has bought an artwork';

COMMIT;

UPDATE customer c
SET
    customer_deal_number = (
        SELECT
            COUNT(*)
        FROM
            sale s
        WHERE
            s.customer_id = c.customer_id
        GROUP BY
            customer_id
    );

COMMIT;


/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


ALTER TABLE sale ADD sale_mau_commission NUMERIC(7) ADD sale_g_commission NUMERIC(
7) ADD sale_art_commission NUMERIC(9);

COMMENT ON COLUMN sale.sale_mau_commission IS
    'the commission in dollars that should be paid to MAU';

COMMENT ON COLUMN sale.sale_g_commission IS
    'the commission in dollars that should be paid to gallery';

COMMENT ON COLUMN sale.sale_art_commission IS
    'the commission in dollars that should be paid to the artist';

UPDATE sale
SET
    sale_mau_commission = sale_price * 0.2;

UPDATE sale s2
SET
    sale_g_commission = sale_price * (
        SELECT
            g.gallery_sale_percent
        FROM
                 sale s
            JOIN aw_display  aw ON aw.aw_display_id = s.aw_display_id
            JOIN gallery     g ON g.gallery_id = aw.gallery_id
        WHERE
            s2.sale_id = s.sale_id
    ) / 100;

UPDATE sale
SET
    sale_art_commission = sale_price - sale_g_commission - sale_mau_commission;

ALTER TABLE sale MODIFY
    sale_mau_commission NOT NULL;

ALTER TABLE sale MODIFY
    sale_g_commission NOT NULL;

ALTER TABLE sale MODIFY
    sale_art_commission NOT NULL;

COMMIT;



/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
DROP TABLE exhibition CASCADE CONSTRAINTS;

CREATE TABLE exhibition (
    exhi_code            NUMERIC(4, 0) NOT NULL,
    exhi_name            VARCHAR2(100) NOT NULL,
    exhi_theme           CHAR(1) NOT NULL,
    exhi_artwork_number  NUMERIC(3) NOT NULL,
    artist_code          NUMERIC(4, 0) NOT NULL,
    gallery_id           NUMERIC(3, 0) NOT NULL,
    exhi_display_s       DATE NOT NULL,
    exhi_display_e       DATE
);

COMMENT ON COLUMN exhibition.exhi_code IS
    'the exhibition code(PK)';

COMMENT ON COLUMN exhibition.exhi_name IS
    'the exhibition name';

COMMENT ON COLUMN exhibition.exhi_artwork_number IS
    'the number of artworks in the exhibition';

COMMENT ON COLUMN exhibition.artist_code IS
    'the artist code (fk)';

COMMENT ON COLUMN exhibition.gallery_id IS
    'gallery ID (fk)';

COMMENT ON COLUMN exhibition.exhi_display_s IS
    'the date of starting the display';

COMMENT ON COLUMN exhibition.exhi_display_e IS
    'the date of ending the display';

ALTER TABLE exhibition ADD CONSTRAINT exhibition_pk PRIMARY KEY ( exhi_code );

ALTER TABLE exhibition
    ADD CONSTRAINT artist_exhibition FOREIGN KEY ( artist_code )
        REFERENCES artist ( artist_code );

ALTER TABLE exhibition
    ADD CONSTRAINT gallery_exhibition FOREIGN KEY ( gallery_id )
        REFERENCES gallery ( gallery_id );

ALTER TABLE exhibition
    ADD CONSTRAINT chk_exhibition CHECK ( exhi_theme IN ( 'A', 'M', 'O' ) );

COMMENT ON COLUMN exhibition.exhi_theme IS
    'exhibition theme
A - artist
M - media
O - other
';

COMMIT;

INSERT INTO exhibition VALUES (
    1,
    'the rules from Neda',
    'A',
    (
        SELECT
            COUNT(*)
        FROM
            artist
        WHERE
            artist_code = 5
        GROUP BY
            artist_code
    ),
    5,
    2,
    TO_DATE('20-Apr-2019', 'dd-Mon-yyyy') + 1,
    TO_DATE('20-Apr-2019', 'dd-Mon-yyyy') + 1 + 10
);

COMMIT;