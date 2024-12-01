<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://4kwallpapers.com/images/walls/thumbs_3t/14198.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }
        .container {
            text-align: center;
            padding: 20px;
        }
        h1 {
            color: #FFD700; /* Gold for the title */
            margin-bottom: 20px;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            border-radius: 8px; /* Rounded corners */
            overflow: hidden;
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.5); /* Subtle gold shadow */
            background-color: transparent; /* Transparent table */
        }
        th, td {
            border: 2px solid #FFD700; /* Gold borders */
            padding: 10px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black */
        }
        th {
            background-color: rgba(51, 51, 51, 0.8); /* Slightly darker */
            color: #FFD700; /* Gold text */
            text-transform: uppercase;
        }
        td {
            color: white;
        }
        tr:hover td {
            background-color: rgba(68, 68, 68, 0.8); /* Highlight on hover */
        }
        a {
            color: #FFD700; /* Gold links */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .status-true {
            color: #32CD32; /* Lime green for true */
            font-weight: bold;
        }
        .status-false {
            color: #FF4500; /* Orange-red for false */
            font-weight: bold;
        }
        .logout {
        position: absolute;
        top: 10px;
        right: 20px;
        color: #FF4500; /* Red text color */
        font-weight: bold;
        font-size: 16px;
        background-color: transparent; /* Transparent background */
        border: 2px solid #FF4500; /* Red border */
        padding: 8px 15px;
        border-radius: 5px; /* Rounded corners */
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .logout:hover {
        background-color: #FF4500; /* Red background on hover */
        color: white; /* White text on hover */
    }
        .return {
            margin-top: 30px;
            display: inline-block;
            background-color: #FFD700; /* Gold button */
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .return:hover {
            background-color: #FFC107; /* Darker gold */
        }
    </style>
</head>
<body>
    <button class="logout" onclick="window.location.href='logout';" title="Log out of your session">
    Logout
</button>
    
    <div class="container">
        <h1><u>Customer Report</u></h1>
        <table>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>License</th>
                <th>Expiry Date</th>
                <th>Mobile</th>
                <th>Status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.username}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.address}</td>
                    <td>${customer.email}</td>
                    <td>${customer.license}</td>
                    <td>${customer.expiryDate}</td>
                    <td>${customer.mobile}</td>
                    <td>
                        <c:choose>
                            <c:when test="${customer.status == true}">
                                <span class="status-true">True</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-false">False</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><a href="customerUpdate/${customer.username}" title="Update customer details">Update</a></td>
                    <td><a href="customerDelete/${customer.username}" title="Delete this customer">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="/index" class="return" title="Go back to the previous page">Return</a>
    </div>
</body>
</html>
