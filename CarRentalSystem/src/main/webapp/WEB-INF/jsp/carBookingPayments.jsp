<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Payments</title>
</head>
<body style="background-color: black; color: white; background-image: url('car7.jpg'); background-size: cover; background-position: center;">
    <header>
        <style>
            .header-content {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 30px;
                background-color: rgba(0, 0, 0, 0.5); /* Slightly transparent navbar */
                border-bottom: 3px solid gold;
                color: gold;
            }

            .navbar {
                display: flex;
                align-items: center;
                gap: 15px;
                background-color: rgba(0, 0, 0, 0.5); /* Slightly transparent navbar */
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
                color: gold;
            }

            .btn, .logout-btn {
                text-decoration: none;
                padding: 10px 15px;
                background-color: red;
                color: white;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn:hover, .logout-btn:hover {
                background-color: darkred;
            }
        </style>
        <div class="header-content">
            <div class="navbar">
                <h1 class="logo">RoadTripRental</h1>
            </div>
            <div class="navbar navbar-right">
                <a href="/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="main-container" id="bookingPaymentsMainContainer">
        <style>
            .main-container {
                padding: 20px 40px;
                font-family: Arial, sans-serif;
            }

            .primary-heading {
                font-size: 28px;
                color: gold; /* Heading in gold */
                text-align: center;
                margin-bottom: 20px;
            }

            .table-container {
                overflow-x: auto;
                margin: 20px auto;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(255, 215, 0, 0.5);
                max-width: 90%;
                border: 2px solid gold;
                background-color: rgba(0, 0, 0, 0.5); /* Slightly transparent table background */
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                background-color: transparent; /* Made table rows transparent */
                color: white; /* Table content in white */
            }

            .table th, .table td {
                padding: 12px;
                text-align: center;
                border: 1px solid gold;
            }

            .table-header {
                background-color: rgba(255, 215, 0, 0.8); /* Slightly transparent gold */
                color: black;
                font-weight: bold;
            }

            .table-row:nth-child(even) {
                background-color: rgba(255, 215, 0, 0.2); /* Slightly transparent */
            }

            .table-row:hover {
                background-color: rgba(255, 215, 0, 0.3); /* Slightly transparent hover effect */
            }

            .action-cell {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .action-btn {
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 5px;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .approve-btn {
                background-color: gold;
                color: black;
            }

            .approve-btn:hover {
                background-color: #b8860b;
            }

            .reject-btn {
                background-color: #8b0000;
                color: white;
            }

            .reject-btn:hover {
                background-color: #a52a2a;
            }

            .return-link {
                text-decoration: none;
                color: gold;
                font-size: 18px;
                display: inline-block;
                text-align: center;
                margin-top: 20px;
            }

            .return-link:hover {
                color: #b8860b;
            }
        </style>

        <h1 class="primary-heading">Booking Payments</h1>
        <br />
        <div class="table-container">
            <table class="table">
                <tr class="table-header">
                    <th>Transaction ID</th>
                    <th>Payment Reference No.</th>
                    <th>Booking ID</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                <c:forEach items="${transactions}" var="transaction">
                    <tr class="table-row">
                        <td>${transaction.transactionId}</td>
                        <td>${transaction.paymentRefNo}</td>
                        <td>${transaction.bookingId}</td>
                        <td>₹${transaction.amount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${transaction.approved == null}">Pending</c:when>
                                <c:when test="${transaction.approved == false}">Rejected</c:when>
                                <c:when test="${transaction.approved == true}">Approved</c:when>
                            </c:choose>
                        </td>
                        <td class="action-cell">
                            <c:choose>
                                <c:when test="${transaction.approved == null}">
                                    <a href="/updatePaymentStatus/${transaction.transactionId}/approve" class="action-btn approve-btn">Approve</a>
                                    <a href="/updatePaymentStatus/${transaction.transactionId}/reject" class="action-btn reject-btn">Reject</a>
                                </c:when>
                                <c:otherwise>
                                    N/A
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <br />
        <h3 style="text-align: center;"><a class="return-link" href="/index">Return</a></h3>
    </div>
</body>
</html>
