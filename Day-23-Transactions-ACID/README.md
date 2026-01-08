# Day 23 – Transactions & ACID Properties in SQL

## 📌 Objective
Understand how SQL transactions work and how ACID properties ensure data reliability using real MySQL examples.

---

## 🔹 What is a Transaction?
A transaction is a group of SQL operations executed as a **single unit of work**.

✔ All statements succeed → COMMIT  
❌ Any statement fails → ROLLBACK  

---

## 🔹 Real-Life Example (Bank Transfer)
1. Debit money from Account A  
2. Credit money to Account B  

If any step fails, the entire operation must be undone.

---

## 🔹 Transaction Control Commands (TCL)

| Command | Description |
|------|------------|
| START TRANSACTION | Begins a transaction |
| COMMIT | Saves changes permanently |
| ROLLBACK | Undoes changes |
| SAVEPOINT | Creates a rollback point |

---

# 🔥 ACID Properties Explained

## 🅰 Atomicity
All operations succeed or none do.

## 🅲 Consistency
Database always remains in a valid state.

## 🅸 Isolation
Transactions do not interfere with each other.

## 🅳 Durability
Committed data is permanent even after system failure.

---

## 🔹 Practice Environment
- Database: MySQL
- Tool: MySQL Workbench

---

## 🔹 Sample Table Used

```sql
accounts(acc_id, acc_name, balance)
