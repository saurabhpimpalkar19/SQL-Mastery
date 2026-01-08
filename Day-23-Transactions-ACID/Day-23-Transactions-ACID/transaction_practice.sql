
---

# 🟢 STEP 3: SQL FILE (COPY–PASTE FULL CONTENT)

📄 **File name:** `transaction_practice.sql`

```sql
-- Day 23: Transactions & ACID Practice
-- Database: MySQL

--------------------------------------
-- Create Database
--------------------------------------
CREATE DATABASE IF NOT EXISTS transaction_practice;
USE transaction_practice;

--------------------------------------
-- Create Accounts Table
--------------------------------------
CREATE TABLE accounts (
    acc_id INT PRIMARY KEY,
    acc_name VARCHAR(50),
    balance INT
);

--------------------------------------
-- Insert Sample Data
--------------------------------------
INSERT INTO accounts VALUES
(1, 'Saurabh', 50000),
(2, 'Amit', 30000),
(3, 'Neha', 20000);

--------------------------------------
-- Example 1: Atomic Transaction
--------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000
WHERE acc_id = 1;

UPDATE accounts
SET balance = balance + 5000
WHERE acc_id = 2;

COMMIT;

--------------------------------------
-- Example 2: Rollback Example
--------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE acc_id = 1;

ROLLBACK;

--------------------------------------
-- Example 3: SAVEPOINT
--------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 3000
WHERE acc_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 3000
WHERE acc_id = 3;

ROLLBACK TO sp1;

COMMIT;

--------------------------------------
-- Consistency Check
--------------------------------------
ALTER TABLE accounts
ADD CONSTRAINT chk_balance CHECK (balance >= 0);
