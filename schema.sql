CREATE DATABASE CAB_DETAILS;
USE CAB_DETAILS;
-- 1. CREATE TABLES
-- ------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    LicenseNumber VARCHAR(20),
    Rating DECIMAL(2,1),
    JoinDate DATE
);

CREATE TABLE Cabs (
    CabID INT PRIMARY KEY,
    DriverID INT UNIQUE,
    VehicleType VARCHAR(20),
    RegistrationNumber VARCHAR(20),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    DriverID INT,
    CabID INT,
    BookingDate TIMESTAMP,
    TripStart TIMESTAMP,
    TripEnd TIMESTAMP,
    Status VARCHAR(20),
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    Fare DECIMAL(8,2),
    CancellationReason VARCHAR(255) DEFAULT NULL, -- ADDED THIS COLUMN
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

CREATE TABLE TripDetails (
    TripID INT PRIMARY KEY,
    BookingID INT UNIQUE,
    DistanceKM DECIMAL(5, 2),
    DurationMinutes INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    TripID INT UNIQUE,
    CustomerRating DECIMAL(2,1),
    DriverRating DECIMAL(2,1),
    Comments VARCHAR(255),
    FOREIGN KEY (TripID) REFERENCES TripDetails(TripID)
);
