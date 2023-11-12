-- Homework 4

--1


CREATE TABLE location (
locationId number(7),
city varchar2(25),
postalCode number(25),
adress varchar2(50),
CONSTRAINT location_id_pk PRIMARY key(locationId);
)

CREATE TABLE room( 
roomId number(7),
name varchar2(25),
capacity number(7),
locationId NUMBER(7),
CONSTRAINT room_id_fk PRIMARY KEY(roomID),
CONSTRAINT location_id_fk FOREIGN key(locationID) REFERENCES location(locationID);
)

CREATE TABLE instructor(
instructorId number(7),
name varchar2(25),
phone number(20),
adress varchar2(50),
CONSTRAINT instructor_id_pk PRIMARY key(instructorId);
)

CREATE TABLE course(
courseId number(7),
name varchar2(25),
departmentId NUMBER(7),
instructorId NUMBER(7),
CONSTRAINT course_id_pk PRIMARY key(courseId),
CONSTRAINT instructor_id_fk FOREIGN key(instructorId) REFERENCES instructor(instructorId);
)

CREATE TABLE schedule(
shceduleId number(7),
examId number(7),
courseId number(7),
date_ DATE NOT NULL;
)

ALTER table schedule
ADD constraint shcedule_id_pk
PRIMARY key(shceduleId);

ALTER table schedule
ADD constraint course_id_fk
foreign key(courseId) REFERENCES course(courseId);

ALTER table schedule
ADD constraint exam_id_fk
foreign key(examId) REFERENCES exam(examID);


CREATE TABLE EXAM (
examID NUMBER(7),
name varchar2(25),
description varchar2(25),
prerequisites varchar2(25),
roomId number(7);
)

ALTER table exam
ADD constraint exam_id_pk
PRIMARY key(examID);

ALTER table exam
ADD constraint room_id_fk__
foreign key(roomId) REFERENCES room(roomId);


INSERT INTO LOCATION
VALUES 
  (5, 'Afyon', 3, 'Afyon merkez');
 
 
INSERT ALL
 INTO ROOM values (1, 'A', 10, 1)
 INTO ROOM values (2, 'B', 10, 2)
 INTO ROOM values (3, 'C', 10, 3)
 INTO ROOM values (4, 'D', 10, 4)
 INTO ROOM values (5, 'E', 10, 5)
SELECT 1 FROM DUAL;


INSERT ALL
 INTO EXAM values (1, 'AA', 'LOREM IPSUM', 'LOREM IPSUM',4)
 INTO EXAM values (2, 'BA', 'LOREM IPSUM', 'LOREM IPSUM',1)
 INTO EXAM values (3, 'CD', 'LOREM IPSUM', 'LOREM IPSUM',3)
 INTO EXAM values (4, 'DD', 'LOREM IPSUM', 'LOREM IPSUM',2)
 INTO EXAM values (5, 'EJ', 'LOREM IPSUM', 'LOREM IPSUM',3)
SELECT 1 FROM DUAL;


INSERT ALL
 INTO SCHEDULE values (1, 1, 3,SYSDATE)
 INTO SCHEDULE values (2, 2, 2,SYSDATE)
 INTO SCHEDULE values (3, 3, 1, SYSDATE)
 INTO SCHEDULE values (4, 4, 4, SYSDATE)
 INTO SCHEDULE values (5, 5, 2, SYSDATE)
SELECT 1 FROM DUAL;


INSERT ALL
 INTO COURSE values (1, 'LOREM', 3,3)
 INTO COURSE values (2, 'LORASD', 2,5)
 INTO COURSE values (3, 'LASDOREM', 1, 4)
 INTO COURSE values (4, 'LOREM', 4, 2)
 INTO COURSE values (5, 'LOREM', 2, 3)
SELECT 1 FROM DUAL;
	   

INSERT ALL
 INTO INSTRUCTOR values (1, 'LOREM', 333333,'ASDASD')
 INTO INSTRUCTOR values (2, 'LORASD', 22222,'ASDASD')
 INTO INSTRUCTOR values (3, 'LASDOREM', 1222, 'ASDASD')
 INTO INSTRUCTOR values (4, 'LOREM', 4333, 'ASDASD')
 INTO INSTRUCTOR values (5, 'LOREM', 2444, 'ASDASD')
SELECT 1 FROM DUAL;


--2


CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    phone_number VARCHAR2(20)
);


CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY,
    name VARCHAR2(100),
    price DECIMAL(10, 2),
    description VARCHAR2(300)
);


CREATE TABLE ORDERR (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2),
    payment_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES ORDERR(order_id)
);


CREATE TABLE SHIPPING (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    address_id INT,
    ship_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES ORDERR(order_id),
    FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)
);


CREATE TABLE MERCHANT (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR2(100),
    contact_email VARCHAR2(100) UNIQUE,
    phone_number VARCHAR2(20)
);


CREATE TABLE CAMPAIGN (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    start_date TIMESTAMP,
    end_date TIMESTAMP
);


CREATE TABLE COMMENTT (
    comment_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    comment_text VARCHAR(200),
    comment_date TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


CREATE TABLE ADDRESS (
    address_id INT PRIMARY KEY,
    customer_id INT,
    street_address VARCHAR2(255),
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(20),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


CREATE TABLE CREDITCARD (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_number VARCHAR(20),
    expiration_date DATE,
    cvv VARCHAR(4),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id)
);


