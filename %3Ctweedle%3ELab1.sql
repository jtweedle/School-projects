
DROP TABLE if exists Employee, Department;
--create two tables of employees and departments

CREATE TABLE Employee (
            EID int NOT Null auto_increment primary key,
            ename varchar(50),
            age int,
            salary double,
            deptID int
) Engine=InnoDB;

CREATE TABLE Department (
          deptID int,
          dname varchar(50),
          budget double
) Engine=InnoDB;

--populate the tables

insert into Employee values (1, 'James Tweedle', 27, 100000, 6);
insert into Employee values (2, 'Autumn Nance', 19, 95000, 7);
insert into Employee values (3, 'Alex Madesclaire', 23, 80000, 8);
insert into Employee values (4, 'Alex Hutton', 24, 49000, 9);
insert into Employee values (5, 'Aubrey Wilson', 21, 49000, 10);
insert into Department values (6, 'CEO', 100000);
insert into Department values (7, 'President', 95000);
insert into Department values (8, 'IT', 90000);
insert into Department values (9, 'Sales', 49000);
insert into Department values (10, 'Human Resources', 49000);
