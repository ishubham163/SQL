drop database if exists Shopping_Management;
create database Shopping_Management;
use Shopping_Management;

create table customers(
	Customer_Id int auto_increment primary key,
    Customer_Name varchar(100) not null,
    Email varchar(250) unique not null,
    Phone_Number char(10) not null unique,
    Age int check (Age>0),
    Gender varchar(10) check (Gender in ('Male', 'Female', 'Other')),
    Country varchar(50) default 'India',
    City varchar(50) not null,
    Pincode char(6) default '201301',
    Registration_Date date default (current_date),
    Registration_Time time default (current_time),
    Created_At timestamp default (current_timestamp),
    Address varchar(250),
    Customer_Status varchar(10) default 'Active' check (Customer_Status in ('Active', 'Inactive', 'Blocked')),
    Customer_Notes varchar(1000)
);

select * from customers;

create table orders(
	Order_Id int auto_increment primary key,
    Customer_Id int,
    Order_Date date default (current_date),
    Order_Amount decimal(10,2) not null,
    Order_Status varchar(20) default 'Pending' check (Order_Status in ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    Payment_Method varchar(20) check (Payment_Method in ('Cash', 'Card', 'UPI', 'Net Banking')),
    Payment_Status varchar(15) default 'Pending' check (Payment_Status in ('Pending', 'Paid', 'Failed')),
    Shipping_Address varchar(250) not null,
    Delivery_Pincode char(6),
    Quantity int not null check (Quantity > 0),
    Discount_Amount decimal(10,2) default 0.00,
    Delivery_Date date null,
    Created_At timestamp default current_timestamp,
    Tracking_Number varchar(30) unique,
    Delivery_Status varchar(20) default 'Not Delivered' check (Delivery_Status in ('Not Delivered', 'In Transit', 'Delivered','Returned')),
    Order_Notes varchar(1000)
);

select * from orders;

alter table orders
add constraint orders_customer
foreign key (Customer_Id) references customers (Customer_Id)
on delete cascade
on update cascade;