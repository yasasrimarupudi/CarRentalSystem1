<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make Payment</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #000; /* Black background */
            color: #fff; /* White text */
        }

        header {
            background-color: #000;
            color: gold;
            padding: 15px 30px;
            border-bottom: 2px solid gold;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            display: inline-block;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn {
            text-decoration: none;
            padding: 8px 15px;
            color: black;
            background-color: gold;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn:hover {
            background-color: #fff;
            color: gold;
        }

        .form-container {
            background-color: #000;
            border: 2px solid gold; /* Gold border */
            border-radius: 10px;
            padding: 40px;
            width: 50%;
            margin: 50px auto;
            box-shadow: 0 4px 12px rgba(255, 215, 0, 0.2); /* Soft gold shadow */
        }

        .form-heading {
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
            color: gold; /* Gold heading */
        }

        .detail-item {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .detail-value {
            font-weight: bold;
            color: gold;
        }

        .description {
            font-size: 16px;
            margin: 20px 0;
            color: #ddd; /* Light gray for subtle emphasis */
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
            color: gold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid gold; /* Gold border */
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 20px;
            background-color: #222; /* Dark gray input background */
            color: white; /* White input text */
        }

        input::placeholder {
            color: #bbb; /* Light gray placeholders */
        }

        input:disabled {
            background-color: #333; /* Darker gray for disabled fields */
            color: #777; /* Lighter gray text */
            cursor: not-allowed;
        }

        button {
            width: 48%;
            padding: 12px;
            font-size: 18px;
            border: 2px solid gold; /* Gold border */
            border-radius: 5px;
            background-color: gold; /* Gold background */
            color: black; /* Black text */
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .submit-button:hover, .reset-button:hover {
            background-color: black; /* Black background on hover */
            color: gold; /* Gold text on hover */
        }

        .reset-button {
            margin-left: 10px;
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="navbar">
            <span class="logo">RoadTripRental</span>
            <div>
                <a href="/index" class="btn">Home</a>
                <a href="/logout" class="btn logout-btn">Logout</a>
            </div>
        </div>
    </header>

    <div class="form-container">
        <h2 class="form-heading">Make Payment</h2>
        <form:form action="/makePayment" method="post" modelAttribute="transaction">
            <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${transaction.bookingId}</span></p>
            <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">${totalPayment}</span></p>
            <p class="detail-item"><strong>Pending Payment:</strong> <span class="detail-value">${pendingPayment}</span></p>
            <p class="description">Make a payment on <strong>RoadTripRental@upi</strong> using your preferred UPI app and fill out the form below:</p>

            <form:hidden path="bookingId"/>
            <form:hidden path="transactionId"/>

            <label for="transactionId">Transaction ID:</label>
            <form:input path="transactionId" id="transactionId" disabled="true"/>

            <label for="amount">Amount Paid:</label>
            <form:input path="amount" id="amount" placeholder="Enter payment amount"/>

            <label for="paymentRefNo">Payment Reference Number:</label>
            <form:input path="paymentRefNo" id="paymentRefNo" placeholder="Enter payment reference number"/>

            <div style="display: flex; justify-content: space-between;">
                <button type="submit" class="submit-button">Make Payment</button>
                <button type="reset" class="reset-button">Reset</button>
            </div>
        </form:form>
    </div>
</body>
</html>
