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
    Publisher_idPubliher int  NOT NULL,
    Category_idCategory int  NOT NULL,
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

INSERT INTO Book VALUES(1,'The Karamazov Brothers',CONVERT(datetime, '1990-11-05', 120),1,1);
INSERT INTO Book VALUES(2,'Animal Farm',CONVERT(datetime, '2010-08-27', 120),2,2);
INSERT INTO Book VALUES(3,'Les Miserables',CONVERT(datetime, '1992-03-22', 120),3,3);
INSERT INTO Book VALUES(4,'The Trial',CONVERT(datetime, '1999-11-14', 120),4,4);
INSERT INTO Book VALUES(5,'Nineteen',CONVERT(datetime, '1998-03-15', 120),5,5);

INSERT INTO Customer VALUES(1,' Michal',' Smith',537568234,CONVERT(datetime, '1973-11-08', 120), 'smithmichal@gmail.com',1);
INSERT INTO Customer VALUES(2,'Annie','Camus',507890266,CONVERT(datetime, '1982-07-04', 120), 'annie@gmail.com',1);
INSERT INTO Customer VALUES(3,'Emma', 'Taylor ',534908561,CONVERT(datetime, '1990-11-23', 120), 'emmat@gmail.com',1);
INSERT INTO Customer VALUES(4,' Peter', 'Wilson ',574245189,CONVERT(datetime, '1997-06-17', 120), 'w.peter@gmail.com',1);
INSERT INTO Customer VALUES(5,'Susan','Brown',505508247,CONVERT(datetime, '1991-05-19', 120), 'susan.brown@gmail.com',3);


INSERT INTO "Order" VALUES(2456,CONVERT(datetime, '2020-11-25', 120),CONVERT(datetime, '2020-11-28', 120),CONVERT(datetime, '2020-11-25', 120),1,1);
INSERT INTO "Order" VALUES(9875,CONVERT(datetime, '2020-04-13', 120),CONVERT(datetime, '2020-04-30', 120),CONVERT(datetime, '2020-05-13', 120),2,2);
INSERT INTO "Order" VALUES(1004,CONVERT(datetime, '2020-01-17', 120),CONVERT(datetime, '2020-02-01', 120),CONVERT(datetime, '2020-02-17', 120),3,3);
INSERT INTO "Order" VALUES(2127,CONVERT(datetime, '2020-05-22', 120),CONVERT(datetime, '2020-05-29', 120),CONVERT(datetime, '2020-06-22', 120),4,4);
INSERT INTO "Order" VALUES(9056,CONVERT(datetime, '2020-05-05', 120),CONVERT(datetime, '2020-05-11', 120),CONVERT(datetime, '2020-06-05', 120),5,5);

INSERT INTO Details_Of_Book_And_Author VALUES(1,1,1);
INSERT INTO Details_Of_Book_And_Author VALUES(2,2,2);
INSERT INTO Details_Of_Book_And_Author VALUES(3,3,3);
INSERT INTO Details_Of_Book_And_Author VALUES(4,4,4);
INSERT INTO Details_Of_Book_And_Author VALUES(5,5,5);



--TRIGGER 1
DROP TRIGGER ShowNewPublisherName;
-- Shows new publisher name 
CREATE TRIGGER ShowNewPublisherName ON Publisher
AFTER INSERT AS 
BEGIN 
DECLARE 
@new_id INTEGER,
@new_name VARCHAR(50);
DECLARE newP CURSOR LOCAL FOR 
SELECT idPubliher, Name FROM Publisher;
OPEN newP
FETCH NEXT FROM newP INTO @new_id, @new_name
WHILE @@FETCH_STATUS = 0
BEGIN
IF @new_id = (SELECT inserted.idPubliher FROM inserted)
PRINT 'Publisher ' + @new_name + ' added';
FETCH NEXT FROM newP INTO @new_id, @new_name
END;
CLOSE newP;
END;
--Check the trigger 1
INSERT INTO Publisher VALUES(7,'G');


--TRIGGER 2
drop trigger deletedCustomer;
--If the customer deleted, shows deleted customer name
CREATE TRIGGER deletedCustomer on Customer
instead of delete
as
begin
declare
@customerName varchar(100);
declare deletedCustomerName cursor local
for select Name from Customer;
open deletedCustomerName
fetch next from deletedCustomerName into @customerName
while @@FETCH_STATUS = 0
begin
if @customerName =(select deleted.Name from deleted)
print 'Customer ' + @customerName + ' deleted.'
fetch next from deletedCustomerName into @customerName
end;
close deletedCustomerName
end;
--Check the trigger 2
select * from Customer;
delete Customer where Name = 'Emma';


--TRIGGER 3
drop trigger CustomerNumber;
-- Show the Order expiry date
create trigger CustomerNumber on Customer
after insert as
begin 
declare Countcustomer cursor local for select Count(*)from Customer;
declare @count integer;
open Countcustomer
fetch next from Countcustomer into @count
begin 
print 'Total customer number: ' +cast(@count as varchar);
end;
end;
--Check the trigger 3
INSERT INTO Customer VALUES(7,' Michald',' Smithd',537568234,CONVERT(datetime, '1973-11-08', 120), 'smithmichal@gmail.com',1);
select * from Customer;

-----------------------------------------------

--PROCEDURE 1
DROP PROCEDURE ShowOrderDate;
--Show order date  - result set.
CREATE PROCEDURE ShowOrderDate
AS    
DECLARE 
@orderDate1 DATE;
DECLARE 
orderdate CURSOR FOR SELECT Take_Date FROM "Order"; 
 begin
   OPEN orderdate
   FETCH NEXT FROM orderdate INTO @orderDate1
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT O.Take_Date, C.Name FROM Customer C ,
			"Order" O WHERE O.Customer_idCustomer = C.idCustomer  and 
			O.Take_Date = @orderDate1;
			FETCH NEXT FROM orderdate into @orderDate1
		END;
	CLOSE orderdate;
	DEALLOCATE orderdate;
END;
--Check the procedure 1
EXECUTE ShowOrderDate

--PROCEDURE 2
drop procedure CustomerNameAndId;
-- Output the id number of given name. -output
Create Procedure CustomerNameAndId
@CustomerId int , @CustomerName varchar(50) output
As
DECLARE NameandId CURSOR FOR 
SELECT Name FROM Customer WHERE idCustomer = @CustomerId 
BEGIN
OPEN NameandId
FETCH NEXT FROM NameandId INTO @CustomerName
CLOSE NameandId
DEALLOCATE NameandId;
END;
--Check the procedure 2
Declare @CustomerName varchar(50)
EXECUTE CustomerNameAndId  1 , @CustomerName OUTPUT   
PRINT @CustomerName 
PRINT 'is the id name of the given id' ;


--PROCEDURE 3
DROP PROCEDURE categoryBook;
--This procedure gives category of books
CREATE PROCEDURE categoryBook  @category VARCHAR(50) = null 
AS
DECLARE @book VARCHAR(50);
DECLARE nameofBook CURSOR LOCAL FOR
SELECT b.Name FROM Book b, Category c WHERE b.Category_idCategory = c.idCategory and c.Name = @category
IF @category is null 
	BEGIN 
		PRINT 'Define a name for the category';
		RETURN(1)
	END;
BEGIN
	OPEN nameofBook 
	FETCH NEXT FROM nameofBook INTO @book
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		PRINT @book
		FETCH NEXT FROM nameofBook INTO @book
	END;
	CLOSE nameofBook;
END;
--Check the procedure 3
EXECUTE categoryBook
EXECUTE categoryBook 'Allegorical'

select * from Category;
