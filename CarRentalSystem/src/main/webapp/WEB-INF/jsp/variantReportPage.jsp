<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Variant Report</title>
    <style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background-color: #000; /* Black background */
        background-image: url('https://t4.ftcdn.net/jpg/09/85/79/75/360_F_985797592_HmUJVDbiiqJYjp2pd84EcUWy5Vb5YUrv.jpg'); /* Background image */
        background-size: cover; /* Ensure the image covers the whole body */
        background-position: center; /* Center the image */
        margin: 0;
        padding: 0;
        color: #fff;
        display: flex;
    justify-content: center; /* Centers the container horizontally */
    align-items: center; /* Centers the container vertically */
    height: 100vh; /* Full viewport height */
    color: #f4f4f4; /* White text for better contrast */
    }

    h1 {
        font-family: 'ALGERIAN', sans-serif;
        color: #ffcc00; /* Gold color for the heading */
        margin-top: 30px;
        text-align: center; /* Center align the heading */
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

    .navbar a:hover {
        background-color: #444; /* Slightly lighter gray for hover */
        color: #fff; /* Change text color to white on hover */
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

    .dropdown .dropbtn:hover {
        background-color: #444; /* Lighter gray for dropdown button hover */
        color: #fff;
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

    .container {
    text-align: center;
    margin: 20px;
    background-color: rgba(0, 0, 0, 0.5); /* Slightly transparent background for content */
    border-radius: 10px;
    padding: 30px 20px; /* Decrease horizontal padding (left and right) */
    box-shadow: 0px 4px 12px rgba(255, 255, 255, 0.2); /* Soft white shadow */
    width: 80%;  /* Reduce overall width */
    max-width: 800px;  /* Set a max width to keep it narrow */
}
    

    table {
        width: 100%; /* Reduced table width */
        margin-top: 20px;
        border-collapse: collapse;
        background-color: transparent;
        color: #fff;
        border: 2px solid #ffcc00; /* Gold border for the table */
        margin-left: auto;
        margin-right: auto; /* Center the table */
    }

    th, td {
        padding: 8px; /* Reduced padding */
        text-align: center;
        border: 1px solid #ffcc00; /* Gold border for table cells */
    }

    th {
        background-color: rgba(61, 61, 61, 0.8); /* Darker background for table header */
        color: #ffcc00; /* Gold color for header text */
    }

    tr:hover {
        background-color: rgba(51, 51, 51, 0.8); /* Slightly transparent row on hover */
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
    
</head>
<body>
<div class="container">
    <h1><u>Car Variant Report</u></h1>
    <h2>
        <table>
            <tr>
                <th>Variant Id</th>
                <th>Variant Name</th>
                <th>Number of Seats</th>
                <th>Fuel Usage</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${variantList}" var="variant">
                <tr>
                    <td>${variant.variantId}</td>
                    <td>${variant.variantName}</td>
                    <td>${variant.numberOfSeat}</td>
                    <td>${variant.fuel}</td>
                    <td>
                        <a href="/variantDeletion/${variant.variantId}" 
                           class="action-link"
                           onclick="return confirm('Are you sure you want to delete this variant?');">Variant Deletion</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </h2>
    <br/>
    <a href="/index" class="return-link">Return</a>
</div>
</body>
</html>
