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
    1,
    'Saint Catherine of Siena',
    5000000,
    TO_DATE('22-Oct-2020 10:00:00', 'dd-Mon-yyyy hh24:mi:ss')
);

INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    1,
    TO_DATE('22-Oct-2020 10:00:00', 'dd-Mon-yyyy hh24:mi:ss'),
    'W',
    NULL
);


commit;

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- (a)
insert into aw_status values(aw_status_seq.NEXTVAL,
    17,
    1,
    TO_DATE('22-Oct-2020 11:00:00', 'dd-Mon-yyyy hh24:mi:ss'),
    'T',
    NULL)
;


    
-- (b)
insert into aw_status values(aw_status_seq.NEXTVAL,
    17,
    1,
    TO_DATE('22-Oct-2020 14:15:00', 'dd-Mon-yyyy hh24:mi:ss'),
    'G',
    NULL);
commit;

-- (c)
insert into aw_display values(AW_DISPLAY_SEQ.nextval,
    17,
    1,
    TO_DATE('22-Oct-2020 14:15:00', 'dd-Mon-yyyy hh24:mi:ss')+1,
    TO_DATE('22-Oct-2020 14:15:00', 'dd-Mon-yyyy hh24:mi:ss')+11,
    'G',
    NULL);
    
    commit;


/*
1b(iv) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE