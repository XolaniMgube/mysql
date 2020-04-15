-- Creating the Customer Table
create table Customers(
  customerID serial primary key,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Gender varchar(10) not null,
  Address varchar(200) not null,
  Phone varchar(15) not null,
  Email varchar(100) not null,
  City varchar(20) not null,
  Country varchar(50) not null
);

-- Creating the Employees Table
create table Employees(
  EmployeeID serial primary key,
  FirstName varchar(50) not null,
  LastName varchar(50) not null,
  Email varchar(100) not null,
  JobTitle varchar(20)
);

-- Creating the Payments Table
create table Payments(
  customerID int references customers(customerID),
  PaymentID serial primary key,
  PaymentDate date not null,
  Amount decimal not null
);

-- Creating the Products Table
create table products(
  ProductID serial primary key,
  ProductName varchar(100) not null,
  Description varchar(300) not null,
  BuyPrice decimal not null
);

-- Creating the Orders Table
create table Orders(
  OrderId serial primary key,
  ProductID int references Products(ProductID),
  PaymentID int references Payments(PaymentID),
  unique(PaymentID),
  FulfilledByEmployeeID int references Employees(EmployeeID),
  DateRequired date not null,
  DateShipped date,
  Status varchar(20) not null
);

-- Inserting rows into customers
insert into Customers(
  FirstName,
  LastName,
  Gender,
  Address,
  Phone,
  Email,
  City,
  Country
)
values
  ('John', 'Hibert', 'Male', '284 Chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa'),
  ('Thando', 'Sithole', 'Female', '204 Sec 1', '079444558', 'thando@gmail.com', 'Capetown', 'South Africa'),
  ('Leon', 'Glen', 'Male', '81 Everton Rd, Gillits', '082083283', 'leon@gmail.com', 'Durban', 'South Africa'),
  ('Charl', 'Muller', 'Male', '290A Dorset Ecke', '+44856872553', 'charl.mullar@yahoo.com', 'Berlin', 'Germin'),
  ('Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'js234@yahoo.com', 'Frankfurt', 'Germany');


-- Inserting rows into employees
insert into Employees(
    FirstName,
    LastName,
    Email,
    JobTitle)
values
    ('Kani', 'Mattew', 'mat@gmail.com', 'Manager'),
    ('Lessly', 'Cronje', 'lesc@gmail.com', 'Clerk'),
    ('Gideon', 'Maduku', 'm@gmail.com', 'Accountant');



-- Inserting rows into products
insert into Products(
    ProductName,
    Description,
    BuyPrice
)
values
    ('Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75),
    ('Classic Car', 'Turnable front wheels, steering function', 550.75),
    ('Sports Car', 'Turnable front wheels, steering function', 700.60);


-- Inserting rows into payments
insert into Payments(
    PaymentDate,
    Amount
)
values
    ('01/09/2018', 150.75),
    ('03/09/2018', 150.75),
    ('03/09/2018', 700.60);


-- Inserting rows into orders
insert into Orders(
    DateRequired,
    DateShipped, 
    Status
)
values
    ('05/09/2018', NULL, 'Not Shipped'),
    ('04/09/2018', '03/09/2018', 'Shipped'),
    ('06/09/2018', NULL, 'Not Shipped');


-- Updating the Payments table
update payments set customerid = 1 where paymentid = 1;
update payments set customerid = 5 where paymentid = 2;
update payments set customerid = 4 where paymentid = 3;


-- Updating the orders table
update orders set productid = 1 where orderid = 1;
update orders set productid = 1 where orderid = 2;
update orders set productid = 3 where orderid = 3;

update orders set paymentid = 1 where orderid = 1;
update orders set paymentid = 2 where orderid = 2;
update orders set paymentid = 3 where orderid = 3;

update orders set fulfilledbyemployeeid = 2 where paymentid = 1;
update orders set fulfilledbyemployeeid = 2 where orderid = 2;
update orders set fulfilledbyemployeeid = 3 where orderid = 3;