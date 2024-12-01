<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Report</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://img.freepik.com/free-vector/car-led-lights-realistic-composition-with-view-night-road-silhouettes-automobile-traffic-lights-illustration_1284-28531.jpg?t=st=1732984296~exp=1732987896~hmac=effc904f73effad769e5026097bfb169a01c032533472e7719d4c4256e14e3b9&w=900'); /* Add the path to your background image */
            background-size: cover;
            background-position: center;
            color: gold;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: rgba(0, 0, 0, 0.7); /* Added slight transparency */
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

        .logout-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: red; /* Red background for logout */
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #ff4d4d;
        }

        .main-container {
            padding: 20px 40px;
        }

        .primary-heading {
            font-size: 28px;
            color: gold;
            text-align: center;
            margin-bottom: 20px;
        }

        .table-container {
            overflow-x: auto;
            margin: 20px auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(255, 215, 0, 0.2);
            max-width: 90%;
            border: 2px solid gold;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 12px;
            text-align: center;
            border: 1px solid gold;
            color: white;
        }

        /* Set table header color to gold */
        .table-header {
            background-color: black;
            color: gold; /* Make the header text gold */
            font-weight: bold;
        }

        .table-row:nth-child(even) {
            background-color: #333;
        }

        .table-row:hover {
            background-color: #444;
        }

        .action-cell {
            display: flex;
            justify-content: center;
        }

        .action-btn {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 5px;
            color: black;
            font-size: 14px;
            background-color: gold;
            transition: background-color 0.3s ease;
        }

        .action-btn:hover {
            background-color: #d4af37;
        }

        .return-link {
            text-decoration: none;
            color: gold;
            font-size: 18px;
        }

        .return-link:hover {
            color: #d4af37;
        }

        /* Center the return link and place it at the bottom */
        .return-link-container {
            text-align: center;
            margin-top: 20px;
            position: fixed;
            bottom: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">RoadTripRental</h1>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="main-container" id="bookingReportMainContainer">
        <h1 class="primary-heading">Booking Report</h1>
        <br />
        <div class="table-container">
            <table class="table">
                <tr class="table-header">
                    <th>Booking ID</th>
                    <th>Car Number</th>
                    <th>Username</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Status</th>
                    <th>Pending Payment</th>
                    <th>Action</th>
                </tr>

                <c:forEach items="${bookings}" var="booking">
                    <tr class="table-row">
                        <td>${booking.bookingId}</td>
                        <td>${booking.carNumber}</td>
                        <td>${booking.username}</td>
                        <td>${booking.fromDate}</td>
                        <td>${booking.toDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${booking.status == 'CNF'}">Confirmed</c:when>
                                <c:when test="${booking.status == 'P'}">Pending</c:when>
                                <c:when test="${booking.status == 'C'}">Cancelled</c:when>
                                <c:when test="${booking.status == 'R'}">Returned</c:when>
                            </c:choose>
                        </td>
                        <td>₹${booking.pendingPayment}</td>
                        <td class="action-cell">
                            <a href="/bookingReport/${booking.bookingId}" class="action-btn details-btn">Details</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="return-link-container">
        <h3><a class="return-link" href="/index">Return</a></h3>
    </div>
</body>
</html>
