CREATE DATABASE SupermarketDB;
USE SupermarketDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT DEFAULT 0
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(200)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Quantity INT NOT NULL,
    SaleDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Products
(ProductName, Category, Price, StockQuantity) VALUES
('Milk', 'Dairy', 60.00, 100),
('Bread', 'Bakery', 40.00, 80),
('Basmati Rice', 'Grocery', 120.00, 50),
('Apple 1 kg', 'Fruits', 180.00, 60),
('Shampoo', 'Personal', 250.00, 40),
('Soap', 'Personal', 35.00, 90);

INSERT INTO Customers
(CustomerName, Phone, Address) VALUES
('Rahul Sharma', '9876500001', 'Delhi'),
('Priya Singh', '9876500002', 'Mumbai'),
('Amit Verma', '9876500003', 'Pune'),
('Neha Gupta', '9876500004', 'Jaipur'),
('Karan Mehta', '9876500005', 'Chennai'),
('Sneha Reddy', '9876500006', 'Hyderabad');

INSERT INTO Sales
(ProductID, CustomerID, Quantity, SaleDate, Status) VALUES
(1, 1, 2, '2026-09-01', 'Pending'),
(2, 2, 1, '2026-09-02', 'Completed'),
(3, 3, 5, '2026-09-03', 'Completed'),
(4, 4, 3, '2026-09-04', 'Pending'),
(5, 5, 2, '2026-09-05', 'Completed');

SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Sales;

SELECT S.SaleID, P.ProductName, P.Price, C.CustomerName,
       C.Phone, S.Quantity, S.SaleDate, S.Status
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID;

SELECT P.ProductName, C.CustomerName, S.SaleDate
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID;

UPDATE Products
SET StockQuantity = StockQuantity - 2
WHERE ProductID = 1;

UPDATE Sales
SET Status = 'Completed'
WHERE SaleID = 1;

UPDATE Products
SET Price = Price * 1.10
WHERE ProductID = 1;

DELETE FROM Sales WHERE CustomerID = 6;
DELETE FROM Customers WHERE CustomerID = 6;

ALTER TABLE Products ADD ExpiryDate DATE;

UPDATE Products
SET ExpiryDate = '2026-12-21'
WHERE ProductID <= 5;

ALTER TABLE Customers DROP COLUMN Address;

RENAME TABLE Sales TO Transactions;

TRUNCATE TABLE Transactions;

ALTER TABLE Products
MODIFY ProductName VARCHAR(100) NOT NULL;

ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

SELECT C.CustomerName, P.ProductName, T.Quantity
FROM Customers C
INNER JOIN Transactions T ON C.CustomerID = T.CustomerID
INNER JOIN Products P ON T.ProductID = P.ProductID;

SELECT C.CustomerName, P.ProductName, T.Quantity
FROM Customers C
LEFT JOIN Transactions T ON C.CustomerID = T.CustomerID
LEFT JOIN Products P ON T.ProductID = P.ProductID;

SELECT COUNT(*) AS TotalProducts FROM Products;

SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Products;

SELECT COUNT(*) AS CompletedSales
FROM Transactions
WHERE Status = 'Completed';

CREATE VIEW CompletedSalesView AS
SELECT P.ProductName, C.CustomerName, T.SaleDate
FROM Transactions T
JOIN Products P ON T.ProductID = P.ProductID
JOIN Customers C ON T.CustomerID = C.CustomerID
WHERE T.Status = 'Completed';

SELECT * FROM CompletedSalesView;

DELIMITER //

CREATE PROCEDURE GetCompletedSales()
BEGIN
    SELECT P.ProductName, C.CustomerName,
           T.SaleDate, T.Quantity
    FROM Transactions T
    JOIN Products P ON T.ProductID = P.ProductID
    JOIN Customers C ON T.CustomerID = C.CustomerID
    WHERE T.Status = 'Completed';
END //

DELIMITER ;

CALL GetCompletedSales();