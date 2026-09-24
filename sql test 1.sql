USE  sqltest_1;

CREATE  TABLE SuperMarketProducts(
PRODUCTID INT,
ProductName VARCHAR(100),
Category VARCHAR(50) ,
Price  DECIMAL(10,2) ,
QUantity INT);

INSERT INTO SuperMarketProducts
 (ProductID, ProductName, Category, Price, QUantity) 
VALUES 
(101, 'milk', 'Dairy', 50, 15),
(102, ' paneer', 'Dairy', 150, 100),
(103, 'tomato', 'veges', 25, 60),
(104, 'book', 'stationary', 23, 100),
(106, 'Printer', 'Office', 9000, 12),
(107, 'horlicks', 'drink', 500, 15),
(108, ' exo', 'cleaning', 250, 100),
(109, 'pen', 'stationary', 15, 60)
;

update SuperMarketProducts
set price = price + 20
where category = 'Dairy';

delete from SuperMarketProducts
where QUantity = 0;

select ProductName,
Price
from SuperMarketProducts
order by Price 	desc;

select ProductName,
category
from SuperMarketProducts
order by category,ProductName;

alter table SuperMarketProducts
add supplier VARCHAR(50)  ;

alter table SuperMarketProducts
drop  supplier;

drop table SuperMarketProducts;

