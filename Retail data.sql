create database RetailSalesData;

use RetailSalesData;

create table sales_data_transactions(
customer_id varchar(255),
trans_date varchar(255),
trans_amount int
);



create table sales_data_response(
customer_id varchar(255) primary key,
response int
);


-- -----Count the number of Customers according to the Response----
SELECT 
    COUNT(customer_id) AS Count_of_Customers, response
FROM
    RetailSalesData.sales_data_response
GROUP BY response;


-- -----join both the tables--
SELECT 
    *
FROM
    sales_data_transactions
        JOIN
    sales_data_response ON sales_data_transactions.customer_id = sales_data_response.customer_id;




-- -----Highest Count and sum of amount of Sales per customer id------
SELECT 
    customer_id,
    SUM(trans_amount) AS Sum_Amount,
    COUNT(trans_Amount) AS CountOfTransactions
FROM
    retailsalesdata.sales_data_transactions
GROUP BY customer_id
ORDER BY Sum_Amount DESC;


--  ----Top 5 customers based on their sum of trans_amount
SELECT 
    customer_id, SUM(trans_amount) AS Total_Amount
FROM
    retailsalesdata.sales_data_transactions
GROUP BY customer_id
ORDER BY Total_Amount DESC limit 5;













