# cab-booking-system
SQL project simulating a cab booking system with schema, sample data, and analytical queries.
# Cab Booking System - SQL Project

This repository contains a simulated **Cab Booking System** database built using SQL. It includes schema creation, sample data, and example queries for analytics and management. The project demonstrates database design, SQL queries, and data analysis in a transportation context.

---

## 📂 Project Structure

| File Name       | Description                                         |
|-----------------|-----------------------------------------------------|
| `schema.sql`    | SQL script to create all tables (Customers, Drivers, Rides, etc.) |
| `data.sql`      | Sample data inserts for testing and demonstration  |
| `queries.sql`   | Example SQL queries for analytics and reporting    |
| `README.md`     | Project overview and instructions                  |

---

## 🗄 Database Schema

### Customers
- `CustomerID` INT PRIMARY KEY
- `Name` VARCHAR(100)
- `Phone` VARCHAR(15)
- `Email` VARCHAR(100) UNIQUE
- `JoinDate` DATE

### Drivers
- `DriverID` INT PRIMARY KEY
- `Name` VARCHAR(100)
- `Phone` VARCHAR(15)
- `LicenseNumber` VARCHAR(20)
- `Rating` DECIMAL(2,1)
- `JoinDate` DATE

### Rides
- `RideID` INT PRIMARY KEY
- `CustomerID` INT (FK → Customers)
- `DriverID` INT (FK → Drivers)
- `StartTime` DATETIME
- `EndTime` DATETIME
- `PickupLocation` VARCHAR(255)
- `DropLocation` VARCHAR(255)
- `Fare` DECIMAL(10,2)

*(Additional tables like Payments or Reviews can be added similarly)*

---

## 📊 Example Queries

1. **Total rides per driver**
```sql
SELECT DriverID, COUNT(*) AS TotalRides
FROM Rides
GROUP BY DriverID;
