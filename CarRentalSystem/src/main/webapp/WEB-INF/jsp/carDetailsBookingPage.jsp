<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Car Report</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h1, h2, h3 {
            color: #FFD700; /* Gold color for headings */
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #333; /* Dark background for the table */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #666; /* Light grey border for table cells */
        }

        th {
            background-color: #444; /* Slightly darker background for headers */
            color: #FFD700; /* Gold color for headers */
        }

        td {
            background-color: #222; /* Darker background for table rows */
            color: white;
        }

        a {
            color: #1E90FF; /* Bright blue color for links */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        h3 a {
            color: #FFD700; /* Gold color for the return link */
            text-decoration: none;
        }

        h3 a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div align="center">
        <h1><u>Car Report</u></h1>
        <br/>
        <table border="2">
            <tr>
                <th>Car Number</th>
                <th>Car Name</th>
                <th>Car Color</th>
                <th>Manufacturer</th>
                <th>MFG Year</th>
                <th>Variant Details</th>
                <th>Rent/Hour</th>
                <th>Available</th>
            </tr>
            <c:forEach items="${carList}" var="car">
                <tr>
                    <td>${car.carNumber}</td>
                    <td>${car.carName}</td>
                    <td>${car.carColor}</td>
                    <td>${car.manufacturer}</td>
                    <td>${car.yearOfMfg}</td>
                    <td>
                        <table border="1" style="margin: 10px auto;">
                            <c:forEach items="${variantMap}" var="cmp">
                                <c:if test="${car.variantId == cmp.key}">
                                    <tr>
                                        <td>Variant Name:</td>
                                        <td>${cmp.value.variantName}</td>
                                    </tr>
                                    <tr>
                                        <td>Number of Seats:</td>
                                        <td>${cmp.value.numberOfSeat}</td>
                                    </tr>
                                    <tr>
                                        <td>Fuel:</td>
                                        <td>${cmp.value.fuel}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </td>
                    <td>${car.rentRate}</td>
                    <td>${car.available}</td>
                    <td><a href="carBooking/${car.carNumber}">Car Booking</a></td>
                </tr>
            </c:forEach>
        </table>
        <h3><a href="/index">Return</a></h3>
    </div>
</body>
</html>
