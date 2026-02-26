create database MihhailenkoPood;
use MihhailenkoPood;

CREATE TABLE Category(
category_id int PRIMARY KEY identity(1,1),
category_name varchar(25) not null
);

SELECT * FROM Category;

CREATE TABLE Product(
product_id int PRIMARY KEY identity(1,1),
product_name varchar(25) not null,
category_id	int,
price int
);

SELECT * FROM Product;


ALTER TABLE Product
ADD CONSTRAINT fk_category_id FOREIGN KEY(category_id)
REFERENCES Category(category_id);


CREATE TABLE Sale(
sale_id int PRIMARY KEY identity(1,1),
product_id int,
customer_id int,
amount int,
date_of_sale date
);

ALTER TABLE Sale
ADD CONSTRAINT fk_sale_product_id FOREIGN KEY(product_id)
REFERENCES Product(product_id);

-- lisame väli Ünits
ALTER TABLE Sale ADD unit char(5);


CREATE TABLE Customer(
customer_id int PRIMARY KEY identity(1,1),
customer_name varchar(25) not null,
contact char(11) unique
);

SELECT * FROM Customer;

ALTER TABLE Sale
ADD CONSTRAINT fk_sale_customer_id FOREIGN KEY(customer_id)
REFERENCES Customer(customer_id);
