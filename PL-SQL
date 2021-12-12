-- tables
-- Table: Author
CREATE TABLE Author (
    idAuthor int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Surname varchar(100)  NOT NULL,
    CONSTRAINT Author_pk PRIMARY KEY (idAuthor)
);

-- Table: Book
CREATE TABLE Book (
    idBook int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Published_Year date  NOT NULL,
    Isbn varchar(100)  NOT NULL,
    Publisher_idPubliher int  NOT NULL,
    Category_idCategory int  NOT NULL,
    CONSTRAINT Book_ak_1 UNIQUE (Isbn) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Book_pk PRIMARY KEY (idBook)
);

-- Table: Category
CREATE TABLE Category (
    idCategory int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Description varchar(100)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (idCategory)
);

-- Table: Customer
CREATE TABLE Customer (
    idCustomer int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Surname varchar(100)  NOT NULL,
    Contact_Number int  NOT NULL,
    Date_Of_Birth date  NOT NULL,
    Email varchar(100)  NOT NULL,
    Credit int  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (idCustomer)
);

-- Table: Details_Of_Book_And_Author
CREATE TABLE Details_Of_Book_And_Author (
    idDetails_Of_Book_And_Author int  NOT NULL,
    Author_idAuthor int  NOT NULL,
    Book_idBook int  NOT NULL,
    CONSTRAINT Details_Of_Book_And_Author_pk PRIMARY KEY (idDetails_Of_Book_And_Author)
);

-- Table: Order
CREATE TABLE "Order" (
    idOrder int  NOT NULL,
    Take_Date date  NOT NULL,
    Give_Date date  NOT NULL,
    Expiry_Date date NOT NULL,
    Customer_idCustomer int  NOT NULL,
    Book_idBook int  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (idOrder)
);

-- Table: Publisher
CREATE TABLE Publisher (
    idPubliher int  NOT NULL,
    Name varchar(100)  NOT NULL,
    CONSTRAINT Publisher_pk PRIMARY KEY (idPubliher)
);

-- foreign keys
-- Reference: Book_Category (table: Book)
ALTER TABLE Book ADD CONSTRAINT Book_Category
    FOREIGN KEY (Category_idCategory)
    REFERENCES Category (idCategory)  
;

-- Reference: Book_Publisher (table: Book)
ALTER TABLE Book ADD CONSTRAINT Book_Publisher
    FOREIGN KEY (Publisher_idPubliher)
    REFERENCES Publisher (idPubliher)  
;

-- Reference: Details_Of_Book_And_Author_Author (table: Details_Of_Book_And_Author)
ALTER TABLE Details_Of_Book_And_Author ADD CONSTRAINT Details_Of_Book_And_Author_Author
    FOREIGN KEY (Author_idAuthor)
    REFERENCES Author (idAuthor)  
;

-- Reference: Details_Of_Book_And_Author_Book (table: Details_Of_Book_And_Author)
ALTER TABLE Details_Of_Book_And_Author ADD CONSTRAINT Details_Of_Book_And_Author_Book
    FOREIGN KEY (Book_idBook)
    REFERENCES Book (idBook)  
;

-- Reference: Order_Book (table: Order)
ALTER TABLE "Order" ADD CONSTRAINT Order_Book
    FOREIGN KEY (Book_idBook)
    REFERENCES Book (idBook)  
;

-- Reference: Order_Customer (table: Order)
ALTER TABLE "Order" ADD CONSTRAINT Order_Customer
    FOREIGN KEY (Customer_idCustomer)
    REFERENCES Customer (idCustomer)  
;

INSERT INTO Publisher VALUES(1,'A');
INSERT INTO Publisher VALUES(2,'B');
INSERT INTO Publisher VALUES(3,'C');
INSERT INTO Publisher VALUES(4,'D');
INSERT INTO Publisher VALUES(5,'E');

INSERT INTO Author VALUES(1,'Fyodor', 'Dostoevsky');
INSERT INTO Author VALUES(2,'George','Orwell');
INSERT INTO Author VALUES(3,'Victor','Hugo');
INSERT INTO Author VALUES(4,'Franz','Kafka');
INSERT INTO Author VALUES(5,'Albert','Camus');

INSERT INTO Category VALUES(1,'Philosophical','It  is a family tragedy centered around a father and his sons.');
INSERT INTO Category VALUES(2,'Allegorical','It is about a group of animals who take control of the farm they live on');
INSERT INTO Category VALUES(3,' Historical',' It tells of Valjeans release from prison and reformation');
INSERT INTO Category VALUES(4,'Classics','It  follows the life of Winston Smith, a low ranking member of "the Party"');
INSERT INTO Category VALUES(5,'Action and Adventure','It begins with Meursault receiving a telegram informing him of his mothers death');

INSERT INTO Book VALUES(1,'The Karamazov Brothers',TO_DATE('05-NOVEMBER-1990','DD-MON-YYYY'), '123-4-56-78910-1',1,1);
INSERT INTO Book VALUES(2,'Animal Farm',TO_DATE('08-JANUARY-1997','DD-MON-YYYY'), '234-5-67-89101-2',2,2);
INSERT INTO Book VALUES(3,'Les Miserables' ,TO_DATE('22-MARCH-2000','DD-MON-YYYY'), '345-6-78-91012-3',3,3);
INSERT INTO Book VALUES(4,'The Trial',TO_DATE('14-NOVEMBER-2006','DD-MON-YYYY'), '456-7-89-10123-4',4,4);
INSERT INTO Book VALUES(5,'1984',TO_DATE('29-AUGUST-2001','DD-MON-YYYY'), '567-8-90-12345-6',5,5);

INSERT INTO Customer VALUES(1,' Michal',' Smith',537568234,TO_DATE('08-NOVEMBER-1973','DD-MON-YYYY'), 'smithmichal@gmail.com',1);
INSERT INTO Customer VALUES(2,'Annie','Camus',507890266,TO_DATE('04-JULY-1982','DD-MON-YYYY'), 'annie@gmail.com',1);
INSERT INTO Customer VALUES(3,'Emma', 'Taylor ',534908561,TO_DATE('23-NOVEMBER-2000','DD-MON-YYYY'), 'emmat@gmail.com',1);
INSERT INTO Customer VALUES(4,' Peter', 'Wilson ',537560081,TO_DATE('17-JUNE-1997','DD-MON-YYYY'), 'w.peter@gmail.com',1);
INSERT INTO Customer VALUES(5,'Susan','Brown',505508247,TO_DATE('19-MAY-1991','DD-MON-YYYY'), 'susan.brown@gmail.com',3);


INSERT INTO "Order" VALUES(2456,TO_DATE('25-NOVEMBER-2000','DD-MON-YYYY'),TO_DATE('28-NOVEMBER-2000','DD-MON-YYYY'),TO_DATE('25-DECEMBER-2000','DD-MON-YYYY'),1,1);
INSERT INTO "Order" VALUES(9875,TO_DATE('13-MARCH-2000','DD-MON-YYYY'),TO_DATE('30-MARCH-2000','DD-MON-YYYY'),TO_DATE('13-APRIL-2000','DD-MON-YYYY'),2,2);
INSERT INTO "Order" VALUES(1004,TO_DATE('17-JANUARY-2000','DD-MON-YYYY'),TO_DATE('01-FEBRUARY-2000','DD-MON-YYYY'),TO_DATE('17-FEBRUARY-2000','DD-MON-YYYY'),3,3);
INSERT INTO "Order" VALUES(2127,TO_DATE('22-MAY-2000','DD-MON-YYYY'),TO_DATE('29-MAY-2000','DD-MON-YYYY'),TO_DATE('22-JUNE-2000','DD-MON-YYYY'),4,4);
INSERT INTO "Order" VALUES(9056,TO_DATE('03-JUNE-2000','DD-MON-YYYY'),TO_DATE('11-JUNE-2000','DD-MON-YYYY'),TO_DATE('03-JULY-2000','DD-MON-YYYY'),5,5);

INSERT INTO Details_Of_Book_And_Author VALUES(1,1,1);
INSERT INTO Details_Of_Book_And_Author VALUES(2,2,2);
INSERT INTO Details_Of_Book_And_Author VALUES(3,3,3);
INSERT INTO Details_Of_Book_And_Author VALUES(4,4,4);
INSERT INTO Details_Of_Book_And_Author VALUES(5,5,5);

--TRIGGER 1
--If customer is under 7 years, they can not borrow a book
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER CheckAge
BEFORE INSERT ON Customer
FOR EACH ROW
DECLARE
Age  INTEGER;
Birth date;
exc_notAllowed EXCEPTION;
CURSOR CustomerAge IS SELECT Date_Of_Birth FROM Customer;
 BEGIN
 OPEN CustomerAge;
  Birth := :NEW.Date_Of_Birth;
  Age := TRUNC(MONTHS_BETWEEN(SYSDATE, birth))/12;
  IF INSERTING THEN    
    IF Age < 7 THEN
      RAISE exc_notAllowed;
    ELSE
      dbms_output.put_line('YOU CAN BORROW A BOOK'); 
    END IF;
  END IF;
  CLOSE CustomerAge;
EXCEPTION
WHEN exc_notAllowed THEN
   Raise_application_error(-20100,'YOU CAN NOT BORROW ANY BOOK') ;
END;

--Check the trigger 1
INSERT INTO Customer VALUES(6,'Burhan', 'Calis',534238561,TO_DATE('04-FEBRUARY-2016','DD-MON-YYYY'), 'burhancalis@gmail.com',1);
INSERT INTO Customer VALUES(7,'Ummugul', 'Calis',5314508561,TO_DATE('28-JUNE-1982','DD-MON-YYYY'), 'ummugulcalis@gmail.com',1);

--TRIGGER 2
--If the publisher has a book, trigger gives a message
create or replace trigger DeletePublisher
    before delete
        on Publisher
    for each row    
    declare
        StopDeletePublisher exception;
        cursor BooksPublisher is
        select * from Book;
    begin
        for Book in BooksPublisher loop
            if Book.Publisher_idPubliher = :OLD.idPubliher
                then raise StopDeletePublisher;
            end if;
        end loop;
        exception when StopDeletePublisher then
        Raise_application_error(-20100,'Publisher has books') ;
end;
--Check the trigger 2
select *from Publisher;
delete from Publisher where Name = 'A';

--TRIGGER 3
--Extend expiry date for those who take book after the date 13.03.2020
CREATE OR REPLACE TRIGGER ExpiryDate
BEFORE INSERT 
ON "Order"
DECLARE
v_date date;
v_expiry date;
v_id INTEGER;
CURSOR cur IS SELECT  Customer_idCustomer,Take_Date,Expiry_Date FROM "Order";
BEGIN 
    OPEN cur;
        LOOP
            FETCH cur INTO v_id,v_date,v_expiry;
            EXIT WHEN cur%NOTFOUND;
            IF v_date > '13-MARCH-2000' THEN   
                UPDATE "Order" SET  Expiry_Date = Expiry_Date+5  WHERE Customer_idCustomer = v_id;
                SELECT Expiry_Date into v_expiry from "Order" WHERE Customer_idCustomer = v_id;
                dbms_output.put_line('student with number :' || v_id || ' can bring the borrowed book on date :' || v_expiry);     
           		--OPEN cur;
            ELSE
              dbms_output.put_line('student with number :' || v_id || 'didnt receive that chance.');  
            END IF;
        END LOOP;
    CLOSE cur;
EXCEPTION
   WHEN CURSOR_ALREADY_OPEN THEN
       CLOSE cur; 
       dbms_output.put_line('Error - cursor was already open!');    
END;

--Check the trigger 3
INSERT INTO "Order" VALUES(2466,TO_DATE('25-NOVEMBER-2020','DD-MON-YYYY'),TO_DATE('28-NOVEMBER-2020','DD-MON-YYYY'),TO_DATE('25-DECEMBER-2020','DD-MON-YYYY'),1,1);
SELECT * FROM "Order";


----------------------------------------------------------

--PROCEDURE 1
-- procedure that return value(s)
-- count how many books read by per customer and if that number extend the given limit ,increase those customer credit
-- last ,  return the number of students who have credits more than 2
CREATE OR REPLACE PROCEDURE ModifyCredits(limit INTEGER ,v_total OUT INTEGER)
IS
v_count INTEGER;
v_smt INTEGER;
v_name varchar (100); 
v_credit INTEGER;
v_id INTEGER;
exc_negative EXCEPTION;
CURSOR customerBookCredit IS SELECT idCustomer,Name,Credit FROM Customer;
BEGIN
IF limit>= 0 THEN
    OPEN customerBookCredit;
        LOOP
            FETCH customerBookCredit INTO v_id ,v_name ,v_credit;
            EXIT WHEN customerBookCredit%NOTFOUND;
		--OPEN customerBookCredit;
            SELECT COUNT(1) INTO v_count FROM "Order" o WHERE o.Customer_idCustomer =v_id;
             
             IF v_count >  limit  OR v_count = limit THEN
                UPDATE Customer SET Credit = Credit+1 WHERE idCustomer = v_id;
                v_smt := v_credit+1;
		--open customerBookCredit;
                    dbms_output.put_line('Customer with id number ' || v_id || ' has credit ' || v_smt);               
             ELSE
                    dbms_output.put_line('Customer with id number ' || v_id || 'has not credit');

             END IF;

        END LOOP;
    CLOSE customerBookCredit;
    SELECT COUNT(1) INTO v_total FROM Customer where Credit >2;
ELSE
RAISE exc_negative ;
END IF;
EXCEPTION
    WHEN CURSOR_ALREADY_OPEN THEN  
           CLOSE customerBookCredit; 
           dbms_output.put_line('Error - cursor was already open!'); 
    WHEN exc_negative THEN
         dbms_output.put_line('Error - you should enter positive number!'); 

END;

--Check the prodecure 1
DECLARE Creditt INTEGER:=0;
BEGIN    
    ModifyCredits(limit=>3, v_total => Creditt);    
    dbms_output.put_line('Total number of customer who have credits more than 2 : ' || Creditt) ;
END;

--PROCEDURE 2
--It gives the person who doesn't date of birth
CREATE OR REPLACE PROCEDURE DateOfBirth(dateC date)
AS
birthday EXCEPTION;
CURSOR Person is
SELECT idCustomer FROM Customer WHERE Date_Of_Birth > dateC;
Counter INTEGER;
CustomerId integer;
CustomerName varchar(50);
BEGIN
SELECT COUNT(*) INTO Counter FROM Customer WHERE Date_Of_Birth > dateC;
IF Counter = 0 THEN RAISE birthday;
END IF;
OPEN Person;
LOOP
FETCH Person into CustomerId;
EXIT WHEN Person %NOTFOUND;
SELECT Name INTO CustomerName FROM Customer where idCustomer= CustomerId;
DBMS_OUTPUT.PUT_LINE('Customers born later from given date: ' || CustomerName); 
end loop;
Close Person;
exception when birthday then 
DBMS_OUTPUT.PUT_LINE('No customer older than the given date');
END;

--Check the procedure 2
execute DateOfBirth(TO_DATE('01-JANUARY-1973','DD-MON-YYYY'));




--PROCEDURE 3
--If given publisher has a book, it gives the book's name
create or replace procedure publisherBooksinLibrary (publisherName varchar)
as
nobooks exception;
Counter integer;
title varchar(50);
cursor nameofBooks is
select b.Name from Book b ,Publisher p where b.Publisher_idPubliher = p.idPubliher and p.Name = publisherName;
begin
select count(b.Name) into Counter from Book b, Publisher p  where b.Publisher_idPubliher = p.idPubliher and p.Name = publisherName;
if Counter = 0 then raise nobooks;
else
open nameofBooks;
loop 
fetch nameofBooks into title;
exit when nameofBooks %NOTFOUND;
DBMS_OUTPUT.PUT_line(title);
end loop;
close nameofBooks;
end if;
exception when noBooks then
DBMS_OUTPUT.PUT_line('Nobody match with ' || publisherName);
end;

--Check the procedure 3
execute publisherBooksinLibrary('A');

