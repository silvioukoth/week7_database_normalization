

-- Week 7 Assignment: Database Design and Normalization
-- Student Name: Silvio Ukoth Ukoro
-- Date: 19 November 2026

-- ==========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==========================================

-- Create your normalized table(s) below

CREATE TABLE ProductDetail_1NF (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    PRIMARY KEY (OrderID, Product)
);


-- Insert your records below

INSERT INTO ProductDetail_1NF
(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Verify Question 1

SELECT * FROM ProductDetail_1NF;


-- ==========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==========================================

-- Partial Dependency:
-- OrderID -> CustomerName
-- (OrderID, Product) -> Quantity
--
-- CustomerName depends only on OrderID.
-- Therefore, we separate order information
-- from product and quantity information.


-- Create your Orders table below

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);


-- Create your OrderItems table below

CREATE TABLE OrderItems (
    OrderID INT NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),
    CHECK (Quantity > 0)
);


-- Insert your records below

-- Insert records into Orders table

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


-- Insert records into OrderItems table

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


-- ==========================================
-- VERIFY QUESTION 2
-- ==========================================

-- Display Orders table

SELECT * FROM Orders;


-- Display OrderItems table

SELECT * FROM OrderItems;


-- Display complete order information using JOIN

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
INNER JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID
ORDER BY Orders.OrderID, OrderItems.Product;


-- ==========================================
-- END OF ASSIGNMENT
-- ==========================================
