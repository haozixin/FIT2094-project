--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-mau-dm.sql
--Student ID:30758017
--Student Name:ZIXIN HAO
--Tutorial No:05

/* Comments for your marker:

1 assume that no other artworks have been added by this artist (artist code 17)


*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
DROP SEQUENCE aw_status_seq;

DROP SEQUENCE aw_display_seq;

DROP SEQUENCE sale_seq;

CREATE SEQUENCE aw_status_seq INCREMENT BY 1 START WITH 300;

CREATE SEQUENCE aw_display_seq INCREMENT BY 1 START WITH 300;

CREATE SEQUENCE sale_seq INCREMENT BY 1 START WITH 300;

/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HE
INSERT INTO artwork VALUES (
    17,
    (select artist_noworks from artist where artist_code = 17)+1,
    'Saint Catherine of Siena',
    500000,
    TO_DATE('10:00:00 22-Oct-2020 ', 'hh24:mi:ss dd-Mon-yyyy')
);

update artist set artist_noworks=artist_noworks+1 where artist_code=17;

INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    (select artist_noworks from artist where artist_code = 17), --select the newst artwork number
    TO_DATE(' 10:00:00 22-Oct-2020', ' hh24:mi:ss dd-Mon-yyyy'),
    'W',
    NULL
);


commit;

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- (a)
insert into aw_status values(
    aw_status_seq.NEXTVAL,
    17,
    (select artist_noworks from artist where artist_code = 17),
    TO_DATE('11:00:00 22-Oct-2020', ' hh24:mi:ss dd-Mon-yyyy'),
    'T',
    (select gallery_id from gallery where gallery_phone='0413432569'))
;

commit;
    
-- (b)
insert into aw_status values(
    aw_status_seq.NEXTVAL,
    17,
    (select artist_noworks from artist where artist_code = 17),
    TO_DATE('14:15:00 22-Oct-2020', ' hh24:mi:ss dd-Mon-yyyy'),
    'G',
    (select gallery_id from gallery where gallery_phone='0413432569')
    );
    
commit;

-- (c)
insert into aw_display values(
    AW_DISPLAY_SEQ.nextval,
    17,
    (select artist_noworks from artist where artist_code = 17),
    To_date('23-Oct-2020', 'dd-Mon-yyyy'),
    TO_DATE('23-Oct-2020', 'dd-Mon-yyyy')+10,
    (select gallery_id from gallery where gallery_phone='0413432569'));
    
commit;


/*
1b(iv) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
insert into sale values(
    SALE_SEQ.nextval,
    TO_DATE('23-Oct-2020', 'dd-Mon-yyyy')+4,
    850000,
    1,
    AW_DISPLAY_SEQ.currval
);

insert into aw_status values(
    aw_status_seq.NEXTVAL,
    17,
    (select artist_noworks from artist where artist_code = 17),
    TO_DATE('14:30:00 27-Oct-2020', ' hh24:mi:ss dd-Mon-yyyy'),
    'S',
    (select gallery_id from gallery where gallery_phone='0413432569')
);

commit;