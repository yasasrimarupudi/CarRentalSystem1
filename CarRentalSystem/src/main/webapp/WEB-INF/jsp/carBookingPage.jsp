<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Booking</title>
    <style>
        /* Global Body Styles */
        body {
            background-image: url('https://img.freepik.com/premium-vector/illustration-night-road-with-realistic-steering-wheel-view-from-car-city-lights-background_212889-5098.jpg?w=996'); /* Replace with your actual image path */
            background-size: cover; /* Ensures the image covers the full page */
            background-position: center; /* Center the background image */
            color: white;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Header Styles */
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            color: gold;
        }

        .navbar {
            display: flex;
            align-items: center;
            gap: 15px;
            justify-content: center;
            width: 100%;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: gold;
            text-align: center;
            flex-grow: 1;
        }

        .btn, .logout-btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: gold;
            color: black;
            border-radius: 5px;
            border: 2px solid black;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn:hover, .logout-btn:hover {
            background-color: black;
            color: gold;
            border: 2px solid gold;
        }

        /* Logout button specifically in red */
        .logout-btn {
            background-color: red;
            border: 2px solid black;
        }

        .logout-btn:hover {
            background-color: black;
            color: red;
            border: 2px solid red;
        }

        /* Form Container Styles */
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            border: 2px solid gold;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(255, 215, 0, 0.5);
            font-family: Arial, sans-serif;
            color: gold;
        }

        .form-heading {
            text-align: center;
            font-size: 26px;
            margin-bottom: 20px;
            color: gold; /* Heading in gold */
        }

        .label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
        }

        .input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            border: 1px solid gold;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: black;
            color: gold;
        }

        .input:focus {
            border-color: gold;
            outline: none;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.8);
        }

        .submit-button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: gold;
            color: black;
            border: 2px solid black;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .submit-button:hover {
            background-color: black;
            color: gold;
            border: 2px solid gold;
        }

        /* Return Link Styling */
        .return-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: gold;
            font-size: 18px;
        }

        .return-link:hover {
            color: #f1c40f;
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

    <div class="form-container">
        <h2 class="form-heading">New Booking</h2>

        <form:form action="/createBooking" method="post" modelAttribute="carBooking">
            <label class="label" for="bookingId">Booking ID:</label>
            <form:input path="bookingId" id="bookingId" class="input" placeholder="Booking ID" />

            <label class="label" for="carNumber">Car Number:</label>
            <form:input path="carNumber" id="carNumber" class="input" placeholder="Car Number" />

            <label class="label" for="username">Username:</label>
            <form:input path="username" id="username" class="input" placeholder="Username" />

            <label class="label" for="rentRate">Rent Rate (per day):</label>
            <input type="text" id="rentRate" value="${rentRate}" disabled="true" class="input" />

            <label class="label" for="fromDate">Enter From Date:</label>
            <form:input path="fromDate" id="fromDate" class="input" type="date" />

            <label class="label" for="toDate">Enter To Date:</label>
            <form:input path="toDate" id="toDate" class="input" type="date" />

            <button class="submit-button btn" type="submit">Proceed to Payment</button>
        </form:form>
    </div>
    <a href="/index" class="return-link">Return</a>
</body>
</html>
