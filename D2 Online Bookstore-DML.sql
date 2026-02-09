
/*
Question 1: CREATE TABLE with PRIMARY & FOREIGN KEY

Scenario:
You are creating a database for an online bookstore.

Task:
•	Create a table Books with columns:
o	BookID → INTEGER, PRIMARY KEY
o	Title → VARCHAR(100), NOT NULL
o	Author → VARCHAR(50), NOT NULL
o	ISBN → VARCHAR(20), UNIQUE
o	Price → DECIMAL(8,2), CHECK(Price > 0)
•	Create a table Orders with columns:
o	OrderID → INTEGER, PRIMARY KEY
o	BookID → INTEGER, FOREIGN KEY REFERENCES Books(BookID)
o	OrderDate → DATE, NOT NULL
o	Quantity → INTEGER, CHECK(Quantity > 0)

Expected Output:
Tables are created successfully with all constraints applied.
*/

drop database if exists bookstore;

create database if not exists bookstore;

use bookstore;

create table Books (
	BookID int primary key,
    Title varchar(100) not null,
    Author varchar(50) not null,
    ISBN varchar(20) unique,
    Price decimal(8,2) check(price>0)
);

create table Orders (
	OrderID int primary key,
    BookID int,
    OrderDate date not null,
    Quantity int check(quantity>0),
    foreign key (BookID) references Books(BookID)
);

/*
Question 2: ALTER TABLE – Add Default Constraint

Scenario:
The bookstore wants to make sure ISBN is Default for every book.

Task:
•	Alter the Books table to add a Default constraint to the ISBN column.

Expected Output:
The ISBN column enforces uniqueness.
*/

alter table books
modify ISBN varchar(20) unique default 'ISBN';

/*
Question 3: INSERT, RETRIEVE & UPDATE with Constraints

Scenario:
You want to add sample book data and update certain records.

Task:
•	Insert at least 5 records into the Books table, respecting all constraints.
•	Retrieve all records to verify entries.
•	Update the Price or Quantity for a specific record while maintaining the CHECK constraints.

Expected Output:
All entries and updates comply with constraints and are displayed correctly.
*/

insert into books value
	(1,'mr','stalin','A1234',200.34),
    (2,'mrs','shudha','B5678',400.56),
    (3,'mr','abi','C9101',100.67),
    (4,'mrs','dharani','D1213',700.89),
    (5,'mr','puhal','E1415',1500.72);
    
insert into orders value
	(1,1,curdate(),4),
    (2,2,current_date()+1,12),
    (3,3,current_date()+2,8),
    (4,4,current_date()+3,2),
    (5,5,current_date()+4,78);    
    
/*
Question 4: DELETE vs TRUNCATE

Scenario:
The bookstore wants to manage orders by removing some rows or clearing all data.

Task:
•	Use DELETE with a WHERE clause to remove specific rows from Orders table.
•	Use TRUNCATE to remove all rows while keeping table structure intact.

Expected Output:
•	DELETE removes selected rows.
•	TRUNCATE clears all rows quickly but keeps the table structure.
*/

select * from books;
select * from orders;

delete from orders where orderid =3;

truncate orders;
truncate books;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Books;