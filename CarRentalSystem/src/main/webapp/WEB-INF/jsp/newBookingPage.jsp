<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Booking</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: black; /* Black background */
            margin: 0;
            padding: 0;
            color: gold; /* Gold text */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Header Styling */
        header {
            width: 100%;
            padding: 20px;
            background-color: black;
            color: gold;
            text-align: center;
            border-bottom: 2px solid gold;
        }

        header nav a {
            color: gold;
            text-decoration: none;
            font-size: 18px;
            margin: 0 15px;
        }

        header nav a:hover {
            text-decoration: underline;
        }

        /* Table Styling */
        table {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: black;
            color: gold;
            border: 2px solid gold; /* Gold border */
            box-shadow: 0 4px 12px rgba(255, 215, 0, 0.3); /* Subtle gold shadow */
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid gold; /* Gold cell borders */
        }

        th {
            background-color: #333; /* Dark gray header background */
            color: gold;
            font-size: 16px;
        }

        td {
            font-size: 14px;
        }

        /* Button Styling */
        .btn-book {
            background-color: gold; /* Gold button */
            color: black;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-book:hover {
            background-color: black; /* Black on hover */
            color: gold; /* Gold text on hover */
            border: 1px solid gold;
        }

        /* Subtable Styling for Variant Details */
        .variant-table {
            width: 100%;
            margin-top: 10px;
            border-collapse: collapse;
            background-color: black;
            color: gold;
            border: 1px solid gold; /* Gold border */
        }

        .variant-table th, .variant-table td {
            padding: 8px;
            font-size: 12px;
            border: 1px solid gold;
        }

        .variant-table th {
            background-color: #444; /* Slightly lighter gray for subtables */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
                font-size: 12px;
            }

            th, td {
                padding: 10px;
            }

            .btn-book {
                font-size: 12px;
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>New Booking</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/index">Home</a>
        </nav>
    </header>

    <h2>Select a Car for Booking</h2>

    <table>
        <thead>
            <tr>
                <th>Car Number</th>
                <th>Car Name</th>
                <th>Color</th>
                <th>Manufacturer</th>
                <th>Year Of Mfg</th>
                <th>Rent Rate (₹/hour)</th>
                <th>Variant Details</th>
                <th>Availability</th>
                <th>Book Now</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${carList}" var="car">
                <tr>
                    <td>${car.carNumber}</td>
                    <td>${car.carName}</td>
                    <td>${car.carColor}</td>
                    <td>${car.manufacturer}</td>
                    <td>${car.yearOfMfg}</td>
                    <td>₹${car.rentRate}/hour</td>
                    <td>
                        <c:set var="carVariant" value="${variantMap[car.variantId]}" />
                        <c:if test="${carVariant != null}">
                            <table class="variant-table">
                                <tr>
                                    <th>Variant Id</th>
                                    <td>${carVariant.variantId}</td>
                                </tr>
                                <tr>
                                    <th>Variant Name</th>
                                    <td>${carVariant.variantName}</td>
                                </tr>
                                <tr>
                                    <th>No. of Seats</th>
                                    <td>${carVariant.numberOfSeat}</td>
                                </tr>
                                <tr>
                                    <th>Fuel</th>
                                    <td>${carVariant.fuel}</td>
                                </tr>
                            </table>
                        </c:if>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${car.available == true}">Available</c:when>
                            <c:otherwise>Not Available</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/carDetailsBooking" method="post">
                            <input type="hidden" name="carNumber" value="${car.carNumber}" />
                            <input type="hidden" name="variantId" value="${car.variantId}" />
                            <input type="hidden" name="username" value="${carUserService.userName}" />
                            <input type="hidden" name="carName" value="${car.carName}" />
                            <input type="hidden" name="carColor" value="${car.carColor}" />
                            <input type="hidden" name="manufacturer" value="${car.manufacturer}" />
                            <input type="hidden" name="rentRate" value="${car.rentRate}" />
                            <input type="hidden" name="variantName" value="${carVariant.variantName}" />
                            <input type="hidden" name="variantSeats" value="${carVariant.numberOfSeat}" />
                            <input type="hidden" name="fuel" value="${carVariant.fuel}" />
                            <input type="submit" value="Book Now" class="btn-book" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
