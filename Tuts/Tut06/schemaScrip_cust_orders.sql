--student id: 30758017
--student name:ZIXIN HAO
--Capture run of script in file called schemaScrip_cust_orders.sql


set echo on
SPOOL custorders_schema_output.txt
-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-09-09 22:02:35 AEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE orderline CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE prod_category CASCADE CONSTRAINTS;

DROP TABLE product CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cust_no       NUMBER NOT NULL,
    cust_name     VARCHAR2(50 BYTE) NOT NULL,
    cust_address  VARCHAR2(50) NOT NULL,
    cust_phone    CHAR(10),
    cust_level    VARCHAR2(6 BYTE) NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT chk_custlevel CHECK ( cust_level BETWEEN '0' AND '3000'
                                         OR cust_level BETWEEN '3000' AND '5000'
                                         OR cust_level BETWEEN '5000' AND '6500'
                                         OR cust_level IN ( 'B', 'G', 'S' ) );

COMMENT ON COLUMN customer.cust_no IS
    'Customer Number';

COMMENT ON COLUMN customer.cust_name IS
    'Name of the customer';

COMMENT ON COLUMN customer.cust_address IS
    'Address of customer';

COMMENT ON COLUMN customer.cust_phone IS
    'customer phone number';

COMMENT ON COLUMN customer.cust_level IS
    'customer level';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_no );

CREATE TABLE orderline (
    order_no       NUMBER NOT NULL,
    prod_no        NUMBER NOT NULL,
    ol_qtyordered  VARCHAR2(3 BYTE) NOT NULL,
    ol_lineprice   NUMBER NOT NULL
);

COMMENT ON COLUMN orderline.order_no IS
    'order number';

COMMENT ON COLUMN orderline.prod_no IS
    'Product Number';

COMMENT ON COLUMN orderline.ol_qtyordered IS
    'Quantity of the product ordered';

COMMENT ON COLUMN orderline.ol_lineprice IS
    'the price of the order line';

ALTER TABLE orderline ADD CONSTRAINT orderline_pk PRIMARY KEY ( order_no,
                                                                prod_no );

CREATE TABLE orders (
    order_no    NUMBER NOT NULL,
    order_date  DATE NOT NULL,
    cust_no     NUMBER NOT NULL
);

COMMENT ON COLUMN orders.order_no IS
    'order number';

COMMENT ON COLUMN orders.order_date IS
    'order date';

COMMENT ON COLUMN orders.cust_no IS
    'Customer Number';

ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( order_no );

CREATE TABLE prod_category (
    pcat_id    NUMBER NOT NULL,
    pcat_name  VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN prod_category.pcat_id IS
    'product category';

COMMENT ON COLUMN prod_category.pcat_name IS
    'name of product category';

ALTER TABLE prod_category ADD CONSTRAINT prod_category_pk PRIMARY KEY ( pcat_id );

CREATE TABLE product (
    prod_no          NUMBER NOT NULL,
    prod_desc        VARCHAR2(50 BYTE) NOT NULL,
    prod_unit_price  VARCHAR2(50 BYTE) NOT NULL,
    prod_category    VARCHAR2(25 BYTE) NOT NULL,
    pcat_id          NUMBER NOT NULL
);

COMMENT ON COLUMN product.prod_no IS
    'Product Number';

COMMENT ON COLUMN product.prod_desc IS
    'Product description';

COMMENT ON COLUMN product.prod_unit_price IS
    'Product Unit Description';

COMMENT ON COLUMN product.prod_category IS
    'product category';

COMMENT ON COLUMN product.pcat_id IS
    'product category';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT customer_orders FOREIGN KEY ( cust_no )
        REFERENCES customer ( cust_no );

ALTER TABLE orderline
    ADD CONSTRAINT orders_orderline FOREIGN KEY ( order_no )
        REFERENCES orders ( order_no );

ALTER TABLE product
    ADD CONSTRAINT pro_category_product FOREIGN KEY ( pcat_id )
        REFERENCES prod_category ( pcat_id );

ALTER TABLE orderline
    ADD CONSTRAINT product_orderline FOREIGN KEY ( prod_no )
        REFERENCES product ( prod_no );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
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

SPOOL OFF
set echo off