
-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-09-26 19:06:39 AEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

--ZIXIN HAO
--30758017
set echo on 
spool  fdas_schema_output.txt




DROP TABLE assessment_damage CASCADE CONSTRAINTS;

DROP TABLE assessor CASCADE CONSTRAINTS;

DROP TABLE building CASCADE CONSTRAINTS;

DROP TABLE employment CASCADE CONSTRAINTS;

DROP TABLE fire_event CASCADE CONSTRAINTS;

DROP TABLE fire_lga CASCADE CONSTRAINTS;

DROP TABLE insurer CASCADE CONSTRAINTS;

DROP TABLE local_government_area CASCADE CONSTRAINTS;

DROP TABLE owner CASCADE CONSTRAINTS;

DROP TABLE property CASCADE CONSTRAINTS;

DROP TABLE property_type CASCADE CONSTRAINTS;

DROP TABLE visit CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE assessment_damage (
    asse_dam_no          NUMBER(7) NOT NULL,
    fire_event_id        CHAR(9 BYTE) NOT NULL,
    building_id          NUMBER(3) NOT NULL,
    pro_id               NUMBER(7) NOT NULL,
    asse_bdamage_cost    NUMBER(8, 2) NOT NULL,
    asse_building_value  NUMBER(5) NOT NULL,
    assessor_id          NUMBER(7)
);

COMMENT ON COLUMN assessment_damage.asse_dam_no IS
    ' number of the assessment damage (surrogate key)';

COMMENT ON COLUMN assessment_damage.fire_event_id IS
    'fire event ID
';

COMMENT ON COLUMN assessment_damage.building_id IS
    'building ID';

COMMENT ON COLUMN assessment_damage.pro_id IS
    'property ID';

COMMENT ON COLUMN assessment_damage.asse_bdamage_cost IS
    'the damage cost of the building in assessment';

COMMENT ON COLUMN assessment_damage.asse_building_value IS
    'building value(assigned by LGA) in assessment ';

COMMENT ON COLUMN assessment_damage.assessor_id IS
    'assessor ID';

ALTER TABLE assessment_damage ADD CONSTRAINT assessment_damage_pk PRIMARY KEY ( asse_dam_no );

ALTER TABLE assessment_damage
    ADD CONSTRAINT assessment_damage_nk UNIQUE ( fire_event_id,
                                                 building_id,
                                                 pro_id );

CREATE TABLE assessor (
    assessor_id             NUMBER(7) NOT NULL,
    assessor_gname          VARCHAR2(30 BYTE) NOT NULL,
    assessor_fname          VARCHAR2(30 BYTE) NOT NULL,
    assessor_contactnumber  CHAR(10 BYTE) NOT NULL,
    insur_code              NUMBER(7) NOT NULL
);

COMMENT ON COLUMN assessor.assessor_id IS
    'assessor ID';

COMMENT ON COLUMN assessor.assessor_gname IS
    'assessor_given name';

COMMENT ON COLUMN assessor.assessor_fname IS
    'assessor_family name';

COMMENT ON COLUMN assessor.assessor_contactnumber IS
    'assessor''s contact number';

COMMENT ON COLUMN assessor.insur_code IS
    'insurer code';

ALTER TABLE assessor ADD CONSTRAINT assessor_pk PRIMARY KEY ( assessor_id );

CREATE TABLE building (
    building_id             NUMBER(3) NOT NULL,
    pro_id                  NUMBER(7) NOT NULL,
    building_size           NUMBER(3) NOT NULL,
    building_date           DATE NOT NULL,
    building_class          CHAR(2 BYTE) NOT NULL,
    building_insur_cov      CHAR(1 BYTE) NOT NULL,
    builidng_totally_destr  CHAR(1 BYTE) NOT NULL,
    insur_code              NUMBER(7) NOT NULL
);

ALTER TABLE building
    ADD CHECK ( building_insur_cov IN ( 'N', 'Y' ) );

ALTER TABLE building
    ADD CHECK ( builidng_totally_destr IN ( 'N', 'Y' ) );

COMMENT ON COLUMN building.building_id IS
    'building ID';

COMMENT ON COLUMN building.pro_id IS
    'property ID';

COMMENT ON COLUMN building.building_size IS
    'building size (in square metres)';

COMMENT ON COLUMN building.building_date IS
    'building construction  date';

COMMENT ON COLUMN building.building_class IS
    'building class';

COMMENT ON COLUMN building.building_insur_cov IS
    'building_insurance_coverage';

COMMENT ON COLUMN building.builidng_totally_destr IS
    'check if building is totally destroyed';

COMMENT ON COLUMN building.insur_code IS
    'insurer code';

ALTER TABLE building ADD CONSTRAINT building_pk PRIMARY KEY ( building_id,
                                                              pro_id );

CREATE TABLE employment (
    assessor_id  NUMBER(7) NOT NULL,
    insur_code   NUMBER(7) NOT NULL,
    emp_sdate    DATE NOT NULL,
    emp_ldate    DATE NOT NULL
);

COMMENT ON COLUMN employment.assessor_id IS
    'assessor ID';

COMMENT ON COLUMN employment.insur_code IS
    'insurer code';

COMMENT ON COLUMN employment.emp_sdate IS
    'employment start date';

COMMENT ON COLUMN employment.emp_ldate IS
    'employment leave date';

ALTER TABLE employment ADD CONSTRAINT employment_pk PRIMARY KEY ( assessor_id,
                                                                  insur_code );

CREATE TABLE fire_event (
    fire_event_id          CHAR(9 BYTE) NOT NULL,
    fire_event_name        VARCHAR2(50 BYTE) NOT NULL,
    fire_event_sdate       DATE NOT NULL,
    fire_event_latitude    NUMBER(9, 6) NOT NULL,
    fire_event_longtitude  NUMBER(9, 6) NOT NULL,
    fire_event_burnarea    NUMBER(11, 2) DEFAULT 0 NOT NULL,
    fire_event_lilost      NUMBER(2) NOT NULL,
    fire_event_tdamage     NUMBER(9, 2) NOT NULL,
    fire_event_sparkid     CHAR(9 BYTE)
);

COMMENT ON COLUMN fire_event.fire_event_id IS
    'fire event ID
';

COMMENT ON COLUMN fire_event.fire_event_name IS
    'the name of the fire event';

COMMENT ON COLUMN fire_event.fire_event_sdate IS
    'the start-date of the fire event';

COMMENT ON COLUMN fire_event.fire_event_latitude IS
    'the latitude of the fire event';

COMMENT ON COLUMN fire_event.fire_event_longtitude IS
    ' longtitude of the event';

COMMENT ON COLUMN fire_event.fire_event_burnarea IS
    'fire_event_burned_area (in hectare)';

COMMENT ON COLUMN fire_event.fire_event_lilost IS
    'fire_event_lives_lost';

COMMENT ON COLUMN fire_event.fire_event_tdamage IS
    'total damage of the fire event';

COMMENT ON COLUMN fire_event.fire_event_sparkid IS
    'fire event ID
';

ALTER TABLE fire_event ADD CONSTRAINT fire_event_pk PRIMARY KEY ( fire_event_id );

CREATE TABLE fire_lga (
    fire_event_id  CHAR(9 BYTE) NOT NULL,
    lga_code       NUMBER(2) NOT NULL
);

COMMENT ON COLUMN fire_lga.fire_event_id IS
    'fire event ID
';

COMMENT ON COLUMN fire_lga.lga_code IS
    'local government area code';

ALTER TABLE fire_lga ADD CONSTRAINT fire_lga_pk PRIMARY KEY ( fire_event_id,
                                                              lga_code );

CREATE TABLE insurer (
    insur_code         NUMBER(7) NOT NULL,
    insur_lname        VARCHAR2(30 BYTE) NOT NULL,
    insur_fname        VARCHAR2(30 BYTE) NOT NULL,
    insur_phonenumber  CHAR(10) NOT NULL
);

COMMENT ON COLUMN insurer.insur_code IS
    'insurer code';

COMMENT ON COLUMN insurer.insur_lname IS
    'insurer last name';

COMMENT ON COLUMN insurer.insur_fname IS
    'insurer family name';

COMMENT ON COLUMN insurer.insur_phonenumber IS
    'insurer''s phone number';

ALTER TABLE insurer ADD CONSTRAINT insurer_pk PRIMARY KEY ( insur_code );

CREATE TABLE local_government_area (
    lga_code         NUMBER(2) NOT NULL,
    lga_name         VARCHAR2(25 BYTE) NOT NULL,
    lga_size         NUMBER(7) NOT NULL,
    lga_ceo_name     VARCHAR2(25 BYTE) NOT NULL,
    lga_phonenumber  CHAR(10) NOT NULL
);

COMMENT ON COLUMN local_government_area.lga_code IS
    'local government area code';

COMMENT ON COLUMN local_government_area.lga_name IS
    'the name of local government area';

COMMENT ON COLUMN local_government_area.lga_size IS
    'local government area (km^2)';

COMMENT ON COLUMN local_government_area.lga_ceo_name IS
    'name of CEO of local government area';

COMMENT ON COLUMN local_government_area.lga_phonenumber IS
    'phone number of local government area office';

ALTER TABLE local_government_area ADD CONSTRAINT local_government_area_pk PRIMARY
KEY ( lga_code );

CREATE TABLE owner (
    owner_id           NUMBER(7) NOT NULL,
    owner_name         VARCHAR2(30 BYTE) NOT NULL,
    owner_phonenumber  CHAR(10 BYTE) NOT NULL
);

COMMENT ON COLUMN owner.owner_id IS
    'owner_id';

COMMENT ON COLUMN owner.owner_name IS
    'owner''s name';

COMMENT ON COLUMN owner.owner_phonenumber IS
    'owner''s phone number';

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE property (
    pro_id           NUMBER(7) NOT NULL,
    pro_addstreet    VARCHAR2(30) NOT NULL,
    pro_addtown      VARCHAR2(30 BYTE) NOT NULL,
    pro_addpostcode  CHAR(4 BYTE) NOT NULL,
    pro_size         NUMBER(5) NOT NULL,
    pro_type         CHAR(1 BYTE) NOT NULL,
    lga_code         NUMBER(2) NOT NULL,
    owner_id         NUMBER(7) NOT NULL,
    pro_ty_id        NUMBER(2) NOT NULL
);

ALTER TABLE property
    ADD CHECK ( pro_type IN ( 'B', 'C', 'F', 'T' ) );

COMMENT ON COLUMN property.pro_id IS
    'property ID';

COMMENT ON COLUMN property.pro_addstreet IS
    'property  street address';

COMMENT ON COLUMN property.pro_addtown IS
    'property twon address';

COMMENT ON COLUMN property.pro_addpostcode IS
    'postcode of the property';

COMMENT ON COLUMN property.pro_size IS
    'property size(km^2)';

COMMENT ON COLUMN property.pro_type IS
    'property type';

COMMENT ON COLUMN property.lga_code IS
    'local government area code';

COMMENT ON COLUMN property.owner_id IS
    'owner_id';

COMMENT ON COLUMN property.pro_ty_id IS
    'property type ID';

ALTER TABLE property ADD CONSTRAINT property_pk PRIMARY KEY ( pro_id );

CREATE TABLE property_type (
    pro_ty_id    NUMBER(2) NOT NULL,
    pro_ty_name  VARCHAR2(40) NOT NULL
);

COMMENT ON COLUMN property_type.pro_ty_id IS
    'property type ID';

COMMENT ON COLUMN property_type.pro_ty_name IS
    'property type name';

ALTER TABLE property_type ADD CONSTRAINT property_type_pk PRIMARY KEY ( pro_ty_id );

CREATE TABLE visit (
    vi_no           NUMBER(7) NOT NULL,
    pro_id          NUMBER(7) NOT NULL,
    building_id     NUMBER(3) NOT NULL,
    vi_arr_date     DATE NOT NULL,
    vi_arr_time     DATE NOT NULL,
    vi_depart_date  DATE NOT NULL,
    vi_depart_time  DATE NOT NULL,
    asse_dam_no     NUMBER(7) NOT NULL
);

COMMENT ON COLUMN visit.vi_no IS
    'visit number(surrogate key)';

COMMENT ON COLUMN visit.pro_id IS
    'property ID';

COMMENT ON COLUMN visit.building_id IS
    'building ID';

COMMENT ON COLUMN visit.vi_arr_date IS
    'visit_arrived_date';

COMMENT ON COLUMN visit.vi_arr_time IS
    'visit_arrived_time';

COMMENT ON COLUMN visit.vi_depart_date IS
    'visit_depart_date';

COMMENT ON COLUMN visit.vi_depart_time IS
    'visit_depart_time';

COMMENT ON COLUMN visit.asse_dam_no IS
    ' number of the assessment damage (surrogate key)';

ALTER TABLE visit ADD CONSTRAINT visit_pk PRIMARY KEY ( vi_no );

ALTER TABLE visit
    ADD CONSTRAINT visit_nk UNIQUE ( vi_arr_date,
                                     vi_arr_time,
                                     building_id,
                                     pro_id );

ALTER TABLE visit
    ADD CONSTRAINT assessment_damage_visit FOREIGN KEY ( asse_dam_no )
        REFERENCES assessment_damage ( asse_dam_no );

ALTER TABLE employment
    ADD CONSTRAINT assessor_employment FOREIGN KEY ( assessor_id )
        REFERENCES assessor ( assessor_id );

ALTER TABLE assessment_damage
    ADD CONSTRAINT building_asse_damage FOREIGN KEY ( building_id,
                                                      pro_id )
        REFERENCES building ( building_id,
                              pro_id );

ALTER TABLE assessment_damage
    ADD CONSTRAINT fire_event_asse_damage FOREIGN KEY ( fire_event_id )
        REFERENCES fire_event ( fire_event_id );

ALTER TABLE fire_lga
    ADD CONSTRAINT fire_event_fire_lga FOREIGN KEY ( fire_event_id )
        REFERENCES fire_event ( fire_event_id );

ALTER TABLE employment
    ADD CONSTRAINT insurer FOREIGN KEY ( insur_code )
        REFERENCES insurer ( insur_code );

ALTER TABLE assessor
    ADD CONSTRAINT insurer_assessor FOREIGN KEY ( insur_code )
        REFERENCES insurer ( insur_code );

ALTER TABLE building
    ADD CONSTRAINT insurer_building FOREIGN KEY ( insur_code )
        REFERENCES insurer ( insur_code );

ALTER TABLE fire_lga
    ADD CONSTRAINT lga_fire_lga FOREIGN KEY ( lga_code )
        REFERENCES local_government_area ( lga_code );

ALTER TABLE property
    ADD CONSTRAINT lga_property FOREIGN KEY ( lga_code )
        REFERENCES local_government_area ( lga_code );

ALTER TABLE property
    ADD CONSTRAINT owner_property FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE building
    ADD CONSTRAINT property_building FOREIGN KEY ( pro_id )
        REFERENCES property ( pro_id );

ALTER TABLE property
    ADD CONSTRAINT property_type_property FOREIGN KEY ( pro_ty_id )
        REFERENCES property_type ( pro_ty_id );

ALTER TABLE fire_event
    ADD CONSTRAINT relation_18 FOREIGN KEY ( fire_event_sparkid )
        REFERENCES fire_event ( fire_event_id );

ALTER TABLE assessment_damage
    ADD CONSTRAINT relation_8 FOREIGN KEY ( assessor_id )
        REFERENCES assessor ( assessor_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

spool off
set echo off