<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Report</title>
    <style>
    /* Global Styling */
    body {
        background: url('car3.jpg') no-repeat center center fixed;
        background-size: cover;
        color: #f1f1f1; /* Light text color */
        font-family: Arial, sans-serif;
    }

    /* Main container styling */
    .main-container {
        padding: 20px 40px;
        background-color: rgba(0, 0, 0, 0.3); /* Semi-transparent black */
        border: 2px solid #FFD700; /* Gold border around the main container */
        border-radius: 10px;
        margin: 20px auto;
        max-width: 90%;
        position: relative; /* Required for placing the logout button */
    }

    /* Logout button styling */
    .logout-btn {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: #FF4C4C; /* Red color for logout */
        color: white;
        border: none;
        padding: 10px 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
        background-color: #D12E2E; /* Darker red on hover */
    }

    /* Primary Heading */
    .primary-heading {
        font-size: 28px;
        color: #FFD700; /* Gold color for the title */
        text-align: center;
        margin-bottom: 20px;
    }

    /* Table container styling */
    .table-container {
        overflow-x: auto;
        margin: 20px auto;
        border-radius: 8px;
        background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent black */
        padding: 10px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th {
        padding: 12px;
        text-align: center;
        background-color: rgba(255, 215, 0, 0.7); /* Semi-transparent gold */
        color: #000000; /* Black text in heading */
        font-weight: bold;
        border: 1px solid #FFD700; /* Gold border for table cells */
    }

    .table td {
        padding: 12px;
        text-align: center;
        background-color: rgba(51, 51, 51, 0.7); /* Semi-transparent dark background for rows */
        color: white; /* White text for table data */
        border: 1px solid #FFD700; /* Gold border for table cells */
    }

    .table-row:nth-child(even) {
        background-color: rgba(85, 85, 85, 0.5); /* Slightly darker transparent rows for contrast */
    }

    .table-row:hover {
        background-color: rgba(68, 68, 68, 0.5); /* Darker hover effect for rows */
    }

    /* Action button styling */
    .action-cell {
        display: flex;
        justify-content: center;
    }

    .action-btn {
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        background-color: rgba(40, 167, 69, 0.8); /* Semi-transparent green */
        transition: background-color 0.3s ease;
        border: 1px solid #FFD700; /* Gold border for action buttons */
    }

    .action-btn:hover {
        background-color: #FFD700; /* Gold color for action button on hover */
        color: #000000; /* Black color for text on hover */
    }

    /* Return link styling */
    .return-link {
        text-decoration: none;
        color: #FFD700; /* Gold color for return link */
        font-size: 18px;
        margin-top: 20px;
        display: block;
        text-align: center;
    }

    .return-link:hover {
        color: #ffffff; /* White color for return link on hover */
    }

    /* Combined Header and Table Style */
    .header-content {
        text-align: center;
        padding: 15px;
        color: #FFD700; /* Gold for logo text */
        font-size: 24px;
        font-weight: bold;
    }
</style>
    
</head>
<body>
    <header>
        <div class="header-content">
            <div class="navbar">
            <h1></h1>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>
<br/>
<br/>
<br/>
<br/>
    <div class="main-container" id="bookingReportMainContainer">
        <h1 class="primary-heading">Booking Report</h1>
        <br />
        <div class="table-container">
            <table class="table">
                <tr>
                    <th>Booking ID</th>
                    <th>Car Number</th>
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
    <h3><a class="return-link" href="/index">Return</a></h3>
</body>
</html>
