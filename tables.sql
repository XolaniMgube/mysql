

/*Creating the Customer Table*/
create table Customers(
  customerID serial primary key
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Gender varchar(10) not null,
  Address varchar(200) not null,
  Phone varchar(15) not null,
  Email varchar(100) not null,
  City varchar(20) not null,
  Country varchar(50) not null
)




/*Creating the Employees Table*/
create table Employees(
  EmployeeID serial primary key,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Email varchar(100) not null,
  JobTitle varchar(20)
)



/*Creating the Orders Table*/
create table Orders(
  OrderId serial primary key,
  ProductID int references Products(ProductID),
  PaymentID int references Payments(PaymentID),
  unique(PaymentID),
  FulfilledByEmployeeID int references Employees(EmployeeID),
  DateRequired date not null,
  DateShipped date,
  Status varchar(20) not null
)



/*Creating the Payments Table*/
create table Payments(
  customerID int references customers(customerID),
  PaymentID serial primary key,
  PaymentDate date not null,
  "Amount(R)" decimal not null
)


/*Creating the Products Table*/
create table products(
  ProductID serial primary key,
  ProductName varchar(100) not null,
  Description varchar(300) not null,
  "BuyPrice (R)" decimal not null
)



/*Inserting rows into Customers*/
insert into customers (
  firstname,
  lastname,
  gender,
  address,
  phone,
  email,
  city,
  country
) values(
  'John',
  'Hibert',
  'Male',
  '284 chaucer st',
  '084789657',
  'john@gmail.com',
  'Johannesburg',
  'South Africa"'
)



/*Inserting rows into employees*/
insert into employees (
  firstname,
  lastname,
  email,
  jobtitle
) 
values(
  'Kani',
  'Matthew',
  'mat@gmail.com',
  'Manager'
)



/*inserting rows into the Orders Table*/
insert into payments(
paymentdate,
amount
)values(
'01-09-2018',
150.75
),
(
'03-09-2018',
150.75
),
(
'03-09-2018',
700.60
)



/*Inserting data into the Payments table*/
insert into payments(
paymentdate,
amount
)values(
'01-09-2018',
150.75
),
(
'03-09-2018',
150.75
),
(
'03-09-2018',
700.60
);



/*Inserting data into the Products table*/
insert into products(
productname,
description,
buyprice
)values(
'Classic Car',
'Turnable front wheels, steering function',	
550.75
),
(
'Sports car',
'Turnable front wheels, steering function',
700.60
);



/*Updating the Payments table*/
update payments set customerid = 1 where paymentid = 1
update payments set customerid = 5 where paymentid = 2
update payments set customerid = 4 where paymentid = 3


/*Updating the orders table*/
update orders set productid = 1 where orderid = 1
update orders set productid = 1 where orderid = 2
update orders set productid = 3 where orderid = 3

update orders set paymentid = 1 where orderid = 1
update orders set paymentid = 2 where orderid = 2
update orders set paymentid = 3 where orderid = 3

update orders set fulfilledbyemployeeid = 2 where paymentid = 1
update orders set fulfilledbyemployeeid = 2 where orderid = 2
update orders set fulfilledbyemployeeid = 3 where orderid = 3