# Day 19 – Window Frames in SQL

## 📌 Topics Covered
- Window Frames
- ROWS vs RANGE
- UNBOUNDED PRECEDING
- CURRENT ROW
- Running Totals
- Department-wise calculations

---

## 🔹 What is a Window Frame?

A window frame defines **which rows are included** in a window function calculation.

```sql
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
