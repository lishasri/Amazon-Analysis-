create database foodorders;
select*from foododer.customers;
select*from foododer.order_details;
select*from foododer.orders;
select*from foododer.products;
select*from foododer.reviews;
select*from foododer.suppliers;
-- TASK 3
 select  name, city from customer.customers where city ="New James"**
 select productname,category from customer.products where Category =" Fruits"**
SELECT*from foododer.customers where state ="Texas";
select*from foododer.products where Category="fruits";
-- task4
alter table foododer.customers add constraint unique_name unique(name);
-- task5
- insert 3 new rows into the products table using INSERT statements**
insert into foododer.products(ProductID,ProductName,Category,SubCategory,PricePerUnit,StockQuantity,SupplierID) values ("0006853c-74cb-44a2-91ed-699aa31c5b5b","Particularly baker","Bakery","Sub-Bakery-1","205","365","833a86c4-88c3-42cb-a39d-8c71ce831563");
insert into foododer.products(ProductID,ProductName,Category,SubCategory,PricePerUnit,StockQuantity,SupplierID) values ("0006853c-74ca-44a2-91ed-699aa31c5b5b","Particularly baker","Bakery","Sub-Bakery-1","205","365","833a86c4-88c3-42cb-a39f-8c71ce831563");
insert into foododer.products(ProductID,ProductName,Category,SubCategory,PricePerUnit,StockQuantity,SupplierID) values ("0006853g-74ca-44a2-91ef-699aa31c5b5e","Particularly baker","Bakery","Sub-Bakery-1","205","365","833a86h4-88c3-42cb-a39g-8c71ce831563");
-- task6
-- update the stock quantity of a product where productID matches a specific ID.**
update foododer.products 
set StockQuantity=365
where ProductID="0006853b-74cb-44a2-91ed-699aa31c5b5b";
-- task7
-- delete a supplier from the suppliers table where their city matches a specific ID.**
select * from foododer.suppliers;
set sql_safe_updates=0;
delete from foododer.suppliers where City ="South Ana";
-- task8
Use SQL constraints to
 -- Add a CHECK constraints  to ensure that rating in the Reviews table are between 1 and 5.
 alter table foododer.reviews
 add constraint check (rating between 1 and 5);
  -- Add a DEFAULT constraint for the PrimeMember Column in the Customers table(default value:"NO").**
   alter table foododer.customers
 modify primemember varchar(10) default"no";
  
 -- TASK 9
 -- WHERE clause to find orders placed after 2024-01-01.
  select* from foododer.orders Where OrderDate >="2024-01-01";
--    HAVING clause to list products with average ratings greater than 4.
select*from foododer.products;
 select ProductID,avg (Rating) as avg_rating from foododer.reviews group by ProductID having avg_rating>4;
  -- group by and order by clauses to rank product by total sales.
 select ProductID,sum(Quantity * UnitPrice - Discount) as total_sales from foododer.order_details group by ProductID order by total_sales desc;
 -- Task 10
 --  Calculate each customer's total spending.
 select CustomerId,sum(OrderAmount+Deliveryfee-DiscountApplied) from foododer.orders group by CustomerID;
 -- Rank customers based on thier spending.
  -- Identify customers who have spent more than ₹5,000.
  Select customerid,sum(orderamount+DeliveryFee-DiscountApplied) as high_cos from foododer.orders group by CustomerID
 having sum(orderamount+DeliveryFee-DiscountApplied)>5000 order by high_cos desc;
  -- Task 11
 --  join the Orders and OrderDetails tables to calculate total  revenue per  order
 SELECT
    o.OrderID,
    SUM(od.Quantity * od.UnitPrice) AS total_revenue
FROM foododer.orders o
JOIN foododer.order_details od
    ON o.OrderID = od.OrderID
GROUP BY o.OrderID;	
 --  Identify customers who placed the most orders in a specific time period
 SELECT
    CustomerID,
    COUNT(OrderID) AS total_orders
FROM foododer.orders
WHERE OrderDate BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY CustomerID
ORDER BY total_orders DESC;
 -- find the supplier with the most products in stock
 select SupplierID,sum(StockQuantity) as total_stock from foododer.products
group by SupplierID
order by total_stock desc;
-- TASK 12
-- Separate product categories and subcategories into a new table.
create table foododer.categories(ProductID varchar(50),Category text,PricePerUnit int,StockQuantity int,Supplier_Id Varchar(50));
 INSERT INTO foododer.categories(ProductID,Category,PricePerUnit,StockQuantity,Supplier_Id )
 values("2aa28375-c563-41b5-aa33-8e2c2e0f4db9","Fruits","207","290","0658c953-98c4-4d00-bf29-4fbfe4aca4cd"),
 ("e9282403-e234-4e35-a711-50acb03bbecc","Snacks","905","259","cb890936-8142-4fa3-ac60-2ecba78f8aa8"),
 ("d79d1b95-ecdf-4810-aea0-45e9bd10627d","Fruits","111","26","455b7097-b656-49b8-9cf2-a98d71d3ba88"),
 ("05765892-c750-44cc-96e2-31fa53d42cb2","Vegetables","887","296","a2ed0ef5-a6c8-4b51-ac6f-6209edf45a02"),
 ("3bfb746e-f1e6-4946-a314-7d9119fd950d","Bakery","961","127","16c44a77-d01f-4154-a7b7-1f5b5dee4255"),
 ("11dc08ec-ef6f-43d0-abaa-414a9c336956","Vegetables","50","19","92bedb68-2b59-4cb3-9520-fec1256dfa04"),
 ("e5bdb329-60d3-4673-8782-1ab101f98187","Dairy","604","126","20e7f27c-8f08-46b3-950f-2c0bbf56722d"),
 ("9747fd32-5076-46c3-90b4-5f404b86b219","Fruits","6","306","eafcc3e7-83b3-4392-b278-1cc6efc9a2a2"),
 ("9d82e469-12e6-4fd6-9a41-837ac63c1d2b","Dairy","131","322","1d344858-3396-49cf-be1a-6fe391841b4b"),
 ("e4c3f640-fa46-4510-8f45-32df79fcaec4","Meat","169","451","1acc6cf8-0309-4b0c-88d2-8d58807168eb"),
 ("b8a16df8-38c0-462d-888d-9c5e42704267","Vegetables","766","265","36f49379-ba01-499f-be3c-ddfd8a6eda41"),
 ("37cc1e52-274c-4fd2-bc0e-d0506c57973b","Meat","302","326","561d6fbf-83fd-40b1-8310-4e546ae02e94");
-- TASK 13
-- Identify the top 3 products based on sales revenue.
select  ProductID, total_revenue FROM ( SELECT ProductID, SUM(Quantity * UnitPrice) AS total_revenue FROM foododer.order_details
 GROUP BY ProductID ) as product_sales ORDER BY total_revenue DESC LIMIT 3; 
-- Find customers who haven’t placed any orders yet. 
SELECT CustomerID, Name, City, State, Country
FROM foododer.Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM foododer.Orders);
    -- TASK 14
-- Which cities have the highest concentration of Prime members?
select Name,City,PrimeMember from foododer
SELECT City, COUNT(*) AS PrimeMembers
FROM foododer.Customers
WHERE PrimeMember = 'Yes'
GROUP BY City
ORDER BY PrimeMembers DESC;
-- What are the top 3 most frequently ordered categories?
SELECT p.Category,
       SUM(o.Quantity) AS Orders_Placed
FROM foododer.Products p
JOIN foododer.Order_Details o
ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY Orders_Placed DESC
LIMIT 3;

    




