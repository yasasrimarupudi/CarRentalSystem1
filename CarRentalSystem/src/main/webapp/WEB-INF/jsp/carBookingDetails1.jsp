<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <style>
        /* General Reset */
        body, h1, h2, h3, p, a {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            text-decoration: none;
            box-sizing: border-box;
        }

        /* Body Background */
        body {
            background-image: url('https://img.freepik.com/free-vector/car-lights-realistic-fog-composition-abstract-concept-with-silver-car-night-illustration_1284-31445.jpg?t=st=1732985693~exp=1732989293~hmac=b1d3268b990d352efae1d787d0b629eb2b40eb91a223651bfd55d009a3a50223&w=740');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            line-height: 1.6;
        }

        /* Header */
        header {
            background-color: rgba(0, 0, 0, 0.7);
            border-bottom: 2px solid #f1c40f;
            padding: 10px 20px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #f1c40f; 
            margin-right: auto;
        }

        .navbar {
            display: flex;
            gap: 15px;
        }

        .btn, .logout-btn {
            color: #fff;
            background-color: #e74c3c; 
            border: 2px solid #e74c3c;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn:hover, .logout-btn:hover {
            color: #e74c3c;
            background-color: #fff;
        }

        /* Booking Container */
        .booking-detail-container {
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.4);
            border-radius: 10px;
            max-width: 1200px;
            margin: 40px auto;
        }

        .booking-heading {
            text-align: center;
            font-size: 28px;
            color: #f1c40f; 
            margin-bottom: 20px;
        }

        /* Main container holding the sections side by side */
        .booking-main-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            background-color: #222;
            border-radius: 10px;
            border: 2px solid #f1c40f;
            padding: 20px;
        }

        /* Section Style */
        /* Section Style */
.section {
    width: 32%; /* Adjust width to fit three sections side by side */
    background-color: transparent; /* Set background to transparent */
    padding: 20px;
    border-radius: 10px;
    border: 1px solid #f1c40f; /* Keep the border to distinguish sections */
    box-shadow: 0px 4px 10px rgba(241, 196, 15, 0.5); /* Add shadow for visual clarity */
}
        

        /* Section Heading */
.section-heading {
    font-size: 22px;
    color: #f1c40f; /* Gold color for headings */
    margin-bottom: 10px;
}

/* Detail Item Text */
.detail-item {
    font-size: 16px;
    color: #fff; /* White color for the text */
    margin-bottom: 8px;
}
       

        .detail-value {
            color: #f1c40f;
            font-weight: bold;
        }

        /* Status Colors */
        #confirmed {
            color: #2ecc71;
            font-weight: bold;
        }

        #pending {
            color: #f39c12;
            font-weight: bold;
        }

        #cancelled {
            color: #e74c3c;
            font-weight: bold;
        }

        #returned {
            color: #3498db;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
            }

            .booking-main-container {
                flex-direction: column;
                gap: 20px;
            }

            .section {
                width: 100%;
            }

            table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1 class="logo"></h1>
            <div class="navbar">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="booking-detail-container">
        <h3 class="booking-heading">Booking Report</h3>
        <div class="booking-main-container">
            <div class="section booking-details">
                <h2 class="section-heading">Booking Information:</h2>
                <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${booking.bookingId}</span></p>
                <p class="detail-item"><strong>Start Date:</strong> <span class="detail-value">${booking.fromDate}</span></p>
                <p class="detail-item"><strong>End Date:</strong> <span class="detail-value">${booking.toDate}</span></p>
                <p class="detail-item"><strong>Status:</strong>
                    <span class="detail-value">
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span id="confirmed">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span id="pending">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span id="cancelled">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span id="returned">Returned</span></c:when>
                            <c:otherwise>Unknown Status</c:otherwise>
                        </c:choose>
                    </span>
                </p>
            </div>

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

            <div class="section payment-info">
                <h2 class="section-heading">Payment Information:</h2>
                <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">₹${booking.totalPayment}</span></p>
                <p class="detail-item"><strong>Advance Payments:</strong> <span class="detail-value">₹${booking.advancePayment}</span></p>
                <p class="detail-item"><strong>Pending Payments:</strong> <span class="detail-value">₹${booking.pendingPayment}</span></p>
            </div>
        </div>
    </div>
</body>
</html>
