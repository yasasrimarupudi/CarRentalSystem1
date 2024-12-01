<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Entry Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('car2.jpg'); /* Adjust path as per your project */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center calc(-300px); /* Moves the image upwards */
            color: white;
        }

        h1 {
            color: #FFD700; /* Gold for the title */
        }

        table {
            width: 60%;
            margin: 20px auto;
            background-color: transparent; /* Transparent background for the table */
            border-collapse: collapse; /* Ensures table cells are adjacent without extra space */
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #FFD700; /* Gold border for table cells */
            background-color: rgba(0, 0, 0, 0.5); /* Light black transparent background */
        }

        th {
            color: #FFD700; /* Gold text for header */
        }

        tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.5); /* Light black transparent background for even rows */
        }

        tr:hover {
            background-color: rgba(0, 0, 0, 0.6); /* Slightly darker on hover */
        }

        form {
            padding: 20px;
            border: 2px solid #FFD700; /* Gold border */
            border-radius: 8px;
            display: block;
            text-align: left;
        }

        form label {
            margin-bottom: 5px;
            display: inline-block;
        }

        form input {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #FFD700; /* Gold border for inputs */
            background-color: rgba(0, 0, 0, 0.7); /* Dark gray for inputs */
            color: white;
            width: 100%; /* Full width for inputs */
        }

        button {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #FFD700; /* Gold border */
            background-color: rgba(0, 0, 0, 0.7); /* Dark gray for button */
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #FFD700; /* Gold on hover */
            color: black; /* Black text on hover */
        }

        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
<div align="center">
    <h1><u>Customer Entry Page</u></h1>
    <form:form action="/customerAdd" method="post" modelAttribute="customerRecord">
        <form:hidden path="username" />
        <form:hidden path="email" />

        <table>
            <tr>
                <th><label for="username">User Name:</label></th>
                <td><form:input id="username" path="username" disabled="true" /></td>
            </tr>
            <tr>
                <th><label for="email">Email:</label></th>
                <td><form:input id="email" path="email" disabled="true" /></td>
            </tr>
            <tr>
                <th><label for="firstName">Enter First Name:</label></th>
                <td><form:input id="firstName" path="firstName" /></td>
            </tr>
            <tr>
                <th><label for="lastName">Enter Last Name:</label></th>
                <td><form:input id="lastName" path="lastName" /></td>
            </tr>
            <tr>
                <th><label for="address">Enter Address:</label></th>
                <td><form:input id="address" path="address" /></td>
            </tr>
            <tr>
                <th><label for="mobile">Enter Mobile Number:</label></th>
                <td><form:input id="mobile" path="mobile" /></td>
            </tr>
            <tr>
                <th><label for="license">Enter License Number:</label></th>
                <td><form:input id="license" path="license" /></td>
            </tr>
            <tr>
                <th><label for="expiryDate">Enter License Expiry Date:</label></th>
                <td><form:input id="expiryDate" type="date" placeholder="dd-mm-yy" path="expiryDate" /></td>
            </tr>
            <tr>
                <th><label for="status">Status:</label></th>
                <td><form:input id="status" path="status" placeholder="Active/Inactive" /></td>
            </tr>
        </table>

        <div class="button-container">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form:form>
</div>
</body>
</html>
