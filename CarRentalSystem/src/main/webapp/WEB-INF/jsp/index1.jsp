<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Rental Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #000; /* Black background */
            background-image: url('https://t4.ftcdn.net/jpg/09/85/79/75/360_F_985797592_HmUJVDbiiqJYjp2pd84EcUWy5Vb5YUrv.jpg'); /* Background image */
            background-size: cover; /* Ensure the image covers the whole body */
            background-position: center; /* Center the image */
            margin: 0;
            padding: 0;
            color: #fff; /* White text for better contrast */
        }

        h1 {
            font-family: 'ALGERIAN', sans-serif;
            color: #ffcc00; /* Gold color for the heading */
            margin-top: 30px;
        }

        .navbar {
            overflow: hidden;
            background-color: #333; /* Dark gray for navbar */
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(255, 255, 255, 0.2); /* Soft white shadow */
            margin: 20px auto;
            width: 90%;
        }

        .navbar a {
            float: left;
            font-size: 16px;
            color: #ffcc00; /* Gold color for links */
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: #ffcc00; /* Gold for dropdown button */
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #444; /* Slightly lighter gray for hover */
            color: #fff; /* Change text color to white on hover */
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #222; /* Very dark gray for dropdown */
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(255, 255, 255, 0.2); /* Soft white shadow */
            z-index: 1;
            border-radius: 8px;
            padding-top: 8px;
        }

        .dropdown-content a {
            float: none;
            color: #ffcc00; /* Gold for dropdown links */
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .dropdown-content a:hover {
            background-color: #555; /* Darker gray for hover */
            color: #fff; /* White text on hover */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar a.logout {
            float: right;
            background-color: #ff4d4d; /* Bright red for logout */
            border-radius: 5px;
            font-weight: bold;
            color: white;
        }

        .navbar a.logout:hover {
            background-color: #cc0000; /* Darker red on hover */
        }
    </style>
</head>

<body>
    <div align="center">
        <h1>Welcome To Car Rental Page</h1>
        <div class="navbar">
            <!-- Customer Section -->
            <div class="dropdown">
                <button class="dropbtn">Customer</button>
                <div class="dropdown-content">
                    <!--  <a href="/customerAdd">Customer Addition</a>-->
                    <a href="/customerReport">Customer Reports</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Variant</button>
                <div class="dropdown-content">
                    <a href="/variantAdd">Add Variant</a>
                    <a href="/variantReport">Variant Report</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">Car</button>
                <div class="dropdown-content">
                    <a href="/carAdd">Add Car</a>
                    <a href="/carReport">Car Report</a>
                </div>
            </div>
            

            <!-- Booking Section -->
            <div class="dropdown">
                <button class="dropbtn">Booking</button>
                <div class="dropdown-content">
                    <a href="/bookingPayments">Booking Payment</a>
	                <a href="/bookingReport">Booking Report</a>
                    <!--  <a href="/">Cancellation</a>-->
                </div>
            </div>
            <a href="/logout" class="logout">Logout</a>
        </div>
    </div>
</body>
</html>
