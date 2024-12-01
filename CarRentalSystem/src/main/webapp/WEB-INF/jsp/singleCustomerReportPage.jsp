<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            text-align: center;
            background-image: url('https://blog.remove-bg.ai/wp-content/uploads/2024/03/background-car-editing-photo.png'); /* Adjust path as per your project */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center calc(-300px); /* Moves the image upwards */
            color: white;
        }

        h1 {
            font-size: 2em;
            color: #FFD700; /* Gold color */
            text-decoration: underline;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.5); /* Light black transparent background */
            border: 2px solid #FFD700; /* Gold border for the table */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #FFD700; /* Gold border for table cells */
        }

        th {
            background-color: rgba(0, 0, 0, 0.7); /* Darker transparent background for headers */
            color: #FFD700; /* Gold color for headers */
        }

        td {
            background-color: rgba(0, 0, 0, 0.5); /* Darker transparent background for rows */
            color: white;
        }

        a {
            color: #1E90FF; /* Blue color for links */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        h2 {
            font-size: 1.2em;
            color: #FFD700;
        }
        .return-link {
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }

        .return-link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div>
        <h1>Customer Report</h1>
        <h2>
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
                    <th>Updation</th>
                </tr>
                <tr>
                    <td>${customer.username}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.address}</td>
                    <td>${customer.email}</td>
                    <td>${customer.license}</td>
                    <td>${customer.expiryDate}</td>
                    <td>${customer.mobile}</td>
                    <td><a href="customerUpdate/${customer.username}">Update</a></td>
                </tr>
            </table>
        </h2>
    </div>
    <h3><a class="return-link" href="/index">Return</a></h3>
</body>
</html>
