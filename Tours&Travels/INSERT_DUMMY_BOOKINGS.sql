-- ============================================
-- Insert Dummy Booking Data for Crystal Reports Testing
-- ============================================

-- Clear existing test data (optional - comment out if you want to keep existing data)
-- DELETE FROM Bookings WHERE TravelerFirstName LIKE 'Test%';

-- Insert 15 sample bookings with various statuses and dates
INSERT INTO Bookings (
    UserId, 
    DestinationId, 
    TravelDate, 
    NumberOfAdults, 
    NumberOfChildren, 
    TotalAmount, 
    BookingStatus, 
    TravelerFirstName, 
    TravelerLastName, 
    TravelerEmail, 
    TravelerPhone, 
    DateOfBooking
)
VALUES
-- Confirmed Bookings
(1, 'DEST001', '2025-12-15', 2, 1, 2500.00, 'Confirmed', 'John', 'Smith', 'john.smith@email.com', '+1-555-0101', '2025-11-01'),
(1, 'DEST002', '2025-12-20', 2, 0, 3200.00, 'Confirmed', 'Sarah', 'Johnson', 'sarah.j@email.com', '+1-555-0102', '2025-11-02'),
(1, 'DEST003', '2026-01-10', 4, 2, 5800.00, 'Confirmed', 'Michael', 'Williams', 'michael.w@email.com', '+1-555-0103', '2025-11-03'),
(1, 'DEST001', '2026-01-15', 2, 0, 2200.00, 'Confirmed', 'Emily', 'Brown', 'emily.brown@email.com', '+1-555-0104', '2025-11-04'),
(1, 'DEST004', '2026-02-01', 3, 1, 4500.00, 'Confirmed', 'David', 'Davis', 'david.davis@email.com', '+1-555-0105', '2025-11-05'),

-- Pending Bookings
(1, 'DEST002', '2025-12-25', 2, 2, 3800.00, 'Pending', 'Jessica', 'Miller', 'jessica.m@email.com', '+1-555-0106', '2025-11-06'),
(1, 'DEST005', '2026-01-20', 2, 0, 2900.00, 'Pending', 'Robert', 'Wilson', 'robert.w@email.com', '+1-555-0107', '2025-11-07'),
(1, 'DEST003', '2026-02-05', 3, 0, 4100.00, 'Pending', 'Amanda', 'Moore', 'amanda.m@email.com', '+1-555-0108', '2025-11-08'),
(1, 'DEST001', '2026-02-10', 2, 1, 2700.00, 'Pending', 'James', 'Taylor', 'james.t@email.com', '+1-555-0109', '2025-11-09'),

-- Cancelled Bookings
(1, 'DEST002', '2025-12-18', 2, 0, 3000.00, 'Cancelled', 'Linda', 'Anderson', 'linda.a@email.com', '+1-555-0110', '2025-11-10'),
(1, 'DEST004', '2026-01-25', 4, 2, 5500.00, 'Cancelled', 'Christopher', 'Thomas', 'chris.t@email.com', '+1-555-0111', '2025-11-11'),

-- Completed Bookings (past dates)
(1, 'DEST001', '2025-11-05', 2, 0, 2300.00, 'Completed', 'Patricia', 'Jackson', 'patricia.j@email.com', '+1-555-0112', '2025-10-15'),
(1, 'DEST003', '2025-11-08', 3, 1, 4200.00, 'Completed', 'Daniel', 'White', 'daniel.w@email.com', '+1-555-0113', '2025-10-18'),
(1, 'DEST002', '2025-11-10', 2, 2, 3500.00, 'Completed', 'Nancy', 'Harris', 'nancy.h@email.com', '+1-555-0114', '2025-10-20'),
(1, 'DEST005', '2025-11-12', 2, 0, 2800.00, 'Completed', 'Matthew', 'Martin', 'matthew.m@email.com', '+1-555-0115', '2025-10-22');

-- Verify the data was inserted
SELECT 
    COUNT(*) AS TotalBookings,
    SUM(CASE WHEN BookingStatus = 'Confirmed' THEN 1 ELSE 0 END) AS Confirmed,
    SUM(CASE WHEN BookingStatus = 'Pending' THEN 1 ELSE 0 END) AS Pending,
    SUM(CASE WHEN BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled,
    SUM(CASE WHEN BookingStatus = 'Completed' THEN 1 ELSE 0 END) AS Completed,
    SUM(TotalAmount) AS TotalRevenue
FROM Bookings
WHERE TravelerFirstName IN ('John', 'Sarah', 'Michael', 'Emily', 'David', 'Jessica', 'Robert', 'Amanda', 'James', 'Linda', 'Christopher', 'Patricia', 'Daniel', 'Nancy', 'Matthew');

-- Show sample of the data
SELECT TOP 5
    BookingId,
    TravelerFirstName,
    TravelerLastName,
    DestinationId,
    TravelDate,
    BookingStatus,
    TotalAmount,
    DateOfBooking
FROM Bookings
ORDER BY DateOfBooking DESC;
