use sql_test3;

CREATE INDEX index_customer_name 
ON Customers (CustomerName);

create  index index_orders_customer_date
on Customers (customerid,orderdate);

DROP INDEX idx_customer_name ON Customers;