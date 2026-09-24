use practice;

SELECT employee_id 
FROM employee_expertise 
GROUP BY employee_id 
HAVING (SUM(years_of_experience) >= 8 AND COUNT(DISTINCT domain) = 1) 
   OR (SUM(years_of_experience) >= 12 AND COUNT(DISTINCT domain) = 2);
   
use practice;   
CREATE TABLE reviews (
review_id INT,
user_id INT,
submit_date DATETIME,
product_id INT,
stars INT CHECK (stars BETWEEN 1 AND 5)
);

INSERT INTO reviews 
(review_id, user_id, submit_date, product_id, stars) 
VALUES
(6171, 123, '2022-06-08 00:00:00', 50001, 4),
(7802, 265, '2022-06-10 00:00:00', 69852, 4),
(5293, 362, '2022-06-18 00:00:00', 50001, 3),
(6352, 192, '2022-07-26 00:00:00', 69852, 3),
(4517, 981, '2022-07-05 00:00:00', 69852, 2);

select 

extract(month from submit_date) as month,
product_id as product, 
round(cast(avg(stars) as decimal(10,2)),2 ) as avg_stars
from reviews
group by 
extract(month from submit_date),
product_id
order by 
month,
product;


CREATE TABLE user_transactions (
    transaction_id INT,
    product_id INT,
    user_id INT,
    spend DECIMAL(10, 2)
);

INSERT INTO user_transactions 
(transaction_id, product_id, user_id, spend) 
VALUES
(131432, 1324, 128, 699.78),
(131433, 1313, 128, 501.00),
(153853, 2134, 102, 1001.20),
(247826, 8476, 133, 1051.00),
(247265, 3255, 133, 1474.00),
(136495, 3677, 133, 247.56);

select 
user_id,
count(product_id) as products
from user_transactions
group by 
user_id
having sum(spend)>=1000
order by
products   desc,
sum(spend) desc
limit 3;






