<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #f9f9f9;
            background-color: black;
        }

        /* Header Styles */
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: black;
            border-bottom: 2px solid gold;
        }

        .navbar {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: gold;
        }

        .btn, .logout-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: gold;
            color: black;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn:hover, .logout-btn:hover {
            background-color: black;
            color: gold;
            border: 2px solid gold;
        }

        /* Booking Container */
        .booking-detail-container {
            padding: 20px 40px;
            color: #f9f9f9;
        }

        .booking-heading {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: gold;
            text-decoration: underline;
        }

        .booking-main-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        /* Section Styles */
        .section {
            flex: 1;
            min-width: 300px;
            background-color: #1e1e1e; /* Darker background for contrast */
            padding: 20px;
            border-radius: 8px;
            border: 2px solid gold;
            box-shadow: 0 4px 10px rgba(255, 215, 0, 0.4);
            margin-bottom: 20px;
        }

        .section-heading {
            font-size: 22px;
            margin-bottom: 15px;
            color: gold;
            text-decoration: underline;
        }

        .detail-item {
            margin: 10px 0;
            font-size: 16px;
            color: #f9f9f9;
        }

        .detail-value {
            color: white;
        }

        /* Action Links */
        .action-links {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .action-link {
            text-decoration: none;
            font-weight: bold;
            padding: 10px 20px;
            background-color: gold;
            color: black;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .action-link:hover {
            background-color: black;
            color: gold;
            border: 2px solid gold;
        }

        /* Logout Button Styling */
        .logout-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: red; /* Red color for Logout */
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: black;
            color: red;
            border: 2px solid red;
        }

        /* Centered Return Button at the bottom */
        .return-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            padding: 20px 0;
        }

        .return-btn {
            text-decoration: none;
            padding: 15px 25px;
            background-color: gold; /* Golden color for consistency */
            color: black;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .return-btn:hover {
            background-color: black;
            color: gold;
            border: 2px solid gold;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .action-links {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">RoadRentalTrip</h1>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="booking-detail-container">
        <h3 class="booking-heading">Booking Report</h3>
        <div class="booking-main-container">
            <!-- Booking Details Section -->
            <div class="section booking-details">
                <h2 class="section-heading">Booking Information:</h2>
                <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${booking.bookingId}</span></p>
                <p class="detail-item"><strong>Start Date:</strong> <span class="detail-value">${booking.fromDate}</span></p>
                <p class="detail-item"><strong>End Date:</strong> <span class="detail-value">${booking.toDate}</span></p>
                <p class="detail-item"><strong>Status:</strong>
                    <span class="detail-value">
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span style="color: green;">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span style="color: orange;">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span style="color: red;">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span style="color: blue;">Returned</span></c:when>
                            <c:otherwise>Unknown Status</c:otherwise>
                        </c:choose>
                    </span>
                </p>
            </div>

            <!-- Car Details Section -->
            <div class="section car-details">
                <h2 class="section-heading">Car Details:</h2>
                <p class="detail-item"><strong>Car Number:</strong> <span class="detail-value">${car.carNumber}</span></p>
                <p class="detail-item"><strong>Car Name:</strong> <span class="detail-value">${car.carName}</span></p>
                <p class="detail-item"><strong>Car Color:</strong> <span class="detail-value">${car.carColor}</span></p>
                <p class="detail-item"><strong>Manufacturer:</strong> <span class="detail-value">${car.manufacturer}</span></p>
                <p class="detail-item"><strong>Rent Rate (per day):</strong> <span class="detail-value">₹${car.rentRate}</span></p>
                <p class="detail-item"><strong>Variant Name:</strong> <span class="detail-value">${variant.variantName}</span></p>
                <p class="detail-item"><strong>Number of Seats:</strong> <span class="detail-value">${variant.numberOfSeat}</span></p>
                <p class="detail-item"><strong>Fuel Type:</strong> <span class="detail-value">${variant.fuel}</span></p>
            </div>

            <!-- Payment Information Section -->
            <div class="section payment-info">
                <h2 class="section-heading">Payment Information:</h2>
                <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">₹${booking.totalPayment}</span></p>
                <p class="detail-item"><strong>Advance Payments:</strong> <span class="detail-value">₹${booking.advancePayment}</span></p>
                <p class="detail-item"><strong>Pending Payments:</strong> <span class="detail-value">₹${booking.pendingPayment}</span></p>
            </div>
        </div>

        <div class="section action">
            <div class="action-links">
                <c:if test="${booking.pendingPayment > 0 && booking.status != 'C' && booking.status != 'R'}">
                    <a href="/makePayment/${booking.bookingId}" class="action-link">Pay dues</a>
                </c:if>
                <c:if test="${booking.status == 'CNF'}">
                    <a href="/cancelBooking/${booking.bookingId}" class="action-link">Cancel Booking</a>
                </c:if>
                <a href="/customerCarReport" class="action-link">Back to Bookings</a>
            </div>
        </div>

        <div class="return-container">
            <a href="/index" class="return-btn">Return</a>
        </div>
    </div>
</body>
</html>