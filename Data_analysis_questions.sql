USE steel_data;

-- 1. What are the details of all cars purchased in the year 2022?
SELECT c.car_id, c.make, c.type, c.style, c.cost_$, s.purchase_date
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
WHERE YEAR(s.purchase_date)=2022;

/*
Insight : From the result we can see that Honda Sedan, Toyota Hatchback, Ford SUV, BMW SUV, 
		  Mercedes Coupe, Nissan Sedan are the cars purchased in 2022.
*/
--------------------------------------------------------------------------------------------------

-- 2. What is the total number of cars sold by each salesperson?
SELECT sp.salesman_id, sp.name, COUNT(sale_id) AS Total_cars_sold
FROM sales s
INNER JOIN salespersons sp ON s.salesman_id= sp.salesman_id
GROUP BY salesman_id;

/*
Insight: Tom Lee has sold highest number of cars
*/
------------------------------------------------------------------------------------------------

-- 3. What is the total revenue generated by each salesperson?
SELECT sp.salesman_id, sp.name, SUM(cost_$) AS Total_Revenue
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
INNER JOIN salespersons sp ON s.salesman_id=sp.salesman_id
GROUP BY salesman_id;

/*
Insight: Here we can see that Tom Lee has generated highest revenue among all the other salesman
*/
----------------------------------------------------------------------------------------------------

-- 4. What are the details of the cars sold by each salesperson?
SELECT s.salesman_id, c.car_id, c.make, c.type, c.style, c.cost_$
FROM sales s
INNER JOIN cars c ON s.car_id=c.car_id
INNER JOIN salespersons sp ON s.salesman_id=sp.salesman_id
GROUP BY s.salesman_id, c.car_id;

-----------------------------------------------------------------------------------------------------

-- 5. What is the total revenue generated by each car type?
SELECT c.car_id, c.type AS Car_type, SUM(c.cost_$) AS Total_Revenue
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
GROUP BY c.car_id;

/*
insight: from the result we can observe that car BMW x5 has generated highest revenue i.e 220000
*/
----------------------------------------------------------------------------------------------------------

-- 6. What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?
SELECT sp.name, s.purchase_date, c.car_id, c.make, c.type, c.style, c.cost_$
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
INNER JOIN salespersons sp ON s.salesman_id=sp.salesman_id
WHERE YEAR(s.purchase_date)=2021 AND sp.name= "Emily Wong";

/*
Insight: we can see that Emily Wong has sold car Toyota corolla and Chevrolet camaro in the year 2021.
*/
----------------------------------------------------------------------------------------------------------

-- 7. What is the total revenue generated by the sales of hatchback cars?
SELECT c.car_id, c.style, SUM(c.cost_$) AS Total_Revenue 
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
GROUP BY car_id
HAVING c.style="Hatchback";

/*
Insight: Total revenue generated by Hatchback style car is 100000.
*/
------------------------------------------------------------------------------------------------------------

-- 8. What is the total revenue generated by the sales of SUV cars in the year 2022?
SELECT c.style, SUM(c.cost_$) AS Revenue
FROM cars c
INNER JOIN sales s ON c.car_id=s.car_id
WHERE YEAR(s.purchase_date) = 2022
GROUP BY c.style
HAVING c.style = "SUV";

/*
Insight: Total revenue generated by SUV car in the year 2022 is 150000.
*/
------------------------------------------------------------------------------------------------------------

-- 9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?
SELECT sp.name, sp.city, COUNT(s.car_id) AS max_car_sold 
FROM salespersons sp
INNER JOIN sales s ON sp.salesman_id=s.salesman_id
WHERE YEAR(s.purchase_date)=2023
GROUP BY s.salesman_id
ORDER BY max_car_sold DESC
LIMIT 1;

/*
Insight: Tom Lee who is from Seattle has sold maximum cars in the year 2023
*/
------------------------------------------------------------------------------------------------------------

-- 10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?
SELECT sp.name, sp.age, SUM(C.cost_$) AS max_Revenue 
FROM salespersons sp
INNER JOIN sales s ON sp.salesman_id=s.salesman_id
INNER JOIN cars c ON s.car_id = c.car_id
WHERE YEAR(s.purchase_date)=2022
GROUP BY s.salesman_id
ORDER BY max_Revenue DESC
LIMIT 1;

/*
Insight: Emily Wong has generated the highest revenue i.e 116000 in the year 2022
*/
------------------------------------------------------------------------------------------------------------







