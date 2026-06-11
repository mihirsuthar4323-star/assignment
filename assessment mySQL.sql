
-- Section A: Concept Application



### 1. What is the functional difference between `SELECT *` and specifying column names, and when is each preferred?

* `SELECT *` table ke sabhi columns ko retrieve karta hai.
* Specific column names sirf required columns ko retrieve karte hain.
* `SELECT *` testing ya quick data viewing ke liye useful hai.
* Specific columns production environment me preferred hote hain kyunki performance better hoti hai aur unnecessary data load nahi hota.

---

### 2. Which keyword renames a column in the output, and does this alias change the actual table structure in the database?

* Column ko rename karne ke liye **AS** keyword use hota hai.
* Example:

```sql
SELECT CustomerName AS Customer
FROM Customers;
```

* Alias sirf query output me naam badalta hai.
* Yeh database ki actual table structure ko change nahi karta.

---

### 3. Why does wrapping a numeric value in quotes (e.g., '5000') in a WHERE clause create a data type conflict in SQL?

* Quotes value ko string (text) bana deti hain.
* Agar column numeric type ka ho aur usse string se compare karein to data type mismatch ya unnecessary conversion ho sakti hai.
* Example:

```sql
WHERE Salary > 5000      -- Correct
WHERE Salary > '5000'    -- May cause conversion issues
```

* Isliye numeric values ko generally quotes ke bina likhna chahiye.

---

### 4. Contrast the results of `ORDER BY Profit DESC` versus `ASC` when the goal is to identify the top 10 most profitable orders.

* `ORDER BY Profit DESC` profit ko highest se lowest order me sort karta hai.
* `ORDER BY Profit ASC` profit ko lowest se highest order me sort karta hai.
* Top 10 most profitable orders nikalne ke liye:

```sql
ORDER BY Profit DESC
LIMIT 10;
```

* `ASC` use karne par least profitable orders milenge.

---

### 5. What is the T-SQL equivalent of the `LIMIT` clause in MS SQL Server, and why does syntax vary across SQL engines?

* MS SQL Server me `LIMIT` ki jagah **TOP** use hota hai.
* Example:

```sql
SELECT TOP 10 *
FROM Orders;
```

* Syntax vary karti hai kyunki har database system (MySQL, PostgreSQL, SQL Server, Oracle) ka apna SQL implementation aur extensions hote hain.

---

### 6. Explain the logical execution order of a query containing `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT` clauses.

Logical execution order:

1. **FROM** – table select hoti hai.
2. **WHERE** – rows filter hoti hain.
3. **SELECT** – required columns choose hote hain.
4. **ORDER BY** – result sort hota hai.
5. **LIMIT** – specified number of rows return hoti hain.

Example:

```sql
SELECT Name, Salary
FROM Employees
WHERE Salary > 5000
ORDER BY Salary DESC
LIMIT 10;
```

Execution Order:

```text
FROM → WHERE → SELECT → ORDER BY → LIMIT
```

Section B ke SQL queries:

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

INSERT INTO Orders (Order_ID, Order_Date, Sales, Profit) VALUES
(101, '2025-01-05', 2500, 300),
(102, '2025-01-08', 6200, 1200),
(103, '2025-01-10', 4800, 750),
(104, '2025-01-12', 8900, 2100),
(105, '2025-01-15', 1500, 200),
(106, '2025-01-18', 7300, 1800),
(107, '2025-01-20', 5400, 950),
(108, '2025-01-22', 11200, 3200),
(109, '2025-01-25', 3900, 500),
(110, '2025-01-28', 6800, 1400),
(111, '2025-02-01', 5200, 1000),
(112, '2025-02-03', 9700, 2500),
(113, '2025-02-05', 4200, 600),
(114, '2025-02-08', 8100, 1900),
(115, '2025-02-10', 12500, 4000),
(116, '2025-02-12', 3500, 450),
(117, '2025-02-15', 5800, 1100),
(118, '2025-02-18', 7600, 1700),
(119, '2025-02-20', 9900, 2700),
(120, '2025-02-22', 4500, 700);

### 1. Retrieve the first 20 records from the Orders table

```sql
SELECT *
FROM Orders
LIMIT 20;
```

---

### 2. Select Order ID, Order Date, Sales, and Profit with Sales aliased as Total_Sales

```sql
SELECT Order_ID,
       Order_Date,
       Sales AS Total_Sales,
       Profit
FROM Orders;
```

---

### 3. Filter high-value transactions where Sales exceeds 5000

```sql
SELECT *
FROM Orders
WHERE Sales > 5000;
```

---

### 4. Generate a report of the top 10 most profitable orders

```sql
SELECT *
FROM Orders
ORDER BY Profit DESC
LIMIT 10;
```

-- Mini Project task:

# 1. Database Schema Creation


CREATE TABLE Superstore (
    Order_ID INT PRIMARY KEY,
    Region VARCHAR(50),
    Category VARCHAR(50),
    Sales DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

# 2. Sample Data

INSERT INTO Superstore VALUES
(101,'West','Furniture',5000,0.10,800),
(102,'East','Technology',12000,0.05,3500),
(103,'South','Office Supplies',3000,0.20,200),
(104,'West','Furniture',7000,0.30,-500),
(105,'North','Technology',15000,0.15,4000),
(106,'South','Furniture',4500,0.25,-300),
(107,'East','Office Supplies',2500,0.05,500),
(108,'North','Furniture',8000,0.35,-1000),
(109,'West','Technology',18000,0.10,6000),
(110,'South','Office Supplies',3500,0.40,-700);


# 3. Multi-Condition Filtering Query

-- High Discount + Loss Making Transactions


SELECT *
FROM Superstore
WHERE Discount >= 0.25
AND Profit < 0;


# 4. Aggregated Performance Report by Region

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Avg_Discount
FROM Superstore
GROUP BY Region;


# 5. Underperforming Categories

SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit ASC;


# 6. Loss-Making Transactions Report

SELECT
    Order_ID,
    Region,
    Category,
    Sales,
    Discount,
    Profit
FROM Superstore
WHERE Profit < 0;


# 7. Project Summary (For Submission)

**Title:** Retail Profitability & Market Segment Analysis

**Objective:** Analyze the relationship between discounts and profit margins to identify underperforming categories and regions.

**Findings:**

* High discounts (25% and above) are associated with several loss-making transactions.
* Furniture category shows lower profitability compared to Technology.
* West and South regions contain multiple loss-making orders.
* Technology category generates the highest profit despite moderate discounts.

**Conclusion:**
Reducing excessive discounts on Furniture products and focusing on 
high-performing Technology products can improve overall profitability. 
Monitoring regional discount strategies can help reduce losses and increase net profit margins.
