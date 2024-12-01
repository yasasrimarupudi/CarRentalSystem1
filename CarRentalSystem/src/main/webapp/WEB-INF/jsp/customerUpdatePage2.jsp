<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Update Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
            margin: 0;
            padding: 0;
        }
        .container {
            text-align: center;
            padding: 20px;
        }
        h1 {
            color: #FFD700; /* Gold color */
        }
        form {
            display: inline-block;
            background-color: #1a1a1a; /* Slightly lighter black */
            border: 2px solid #FFD700; /* Gold border */
            border-radius: 10px;
            padding: 20px;
            width: 50%;
            box-shadow: 0 0 10px #FFD700;
        }
        label, input, button {
            font-size: 16px;
            margin: 10px 0;
        }
        input {
            padding: 8px;
            border: 1px solid #FFD700;
            border-radius: 5px;
            background-color: #333;
            color: white;
            width: 90%;
        }
        input:disabled {
            background-color: #555;
            color: #888;
        }
        .button-container {
            margin-top: 20px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            color: black;
            background-color: #FFD700;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #e6c300;
        }
        .return-link {
            display: block;
            text-decoration: none;
            color: #FFD700; /* Gold color */
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
        }

        .return-link:hover {
            color: #e6c300;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><u>Customer Update Page</u></h1>
        <form:form action="/customerUpdate" method="post" modelAttribute="customerRecord">
            <form:hidden path="username" />
            <form:hidden path="email" />
            <form:hidden path="firstName" />
            <form:hidden path="mobile" />
            <form:hidden path="license" />

            <label for="username">User Name:</label>
            <form:input path="username" id="username" disabled="true" />
            <br />

            <label for="email">Email:</label>
            <form:input path="email" id="email" disabled="true" />
            <br />

            <label for="firstName">First Name:</label>
            <form:input path="firstName" id="firstName" disabled="true" />
            <br />

            <label for="lastName">Update Last Name:</label>
            <form:input path="lastName" id="lastName" />
            <br />

            <label for="address">Update Address:</label>
            <form:input path="address" id="address" />
            <br />

            <label for="mobile">Mobile Number:</label>
            <form:input path="mobile" id="mobile" disabled="true" />
            <br />

            <label for="license">License Number:</label>
            <form:input path="license" id="license" disabled="true" />
            <br />

            <label for="expiryDate">Update License Expiry Date:</label>
            <form:input type="date" id="expiryDate" path="expiryDate" placeholder="dd-mm-yy" />
            <br />

            <label for="status">Status:</label>
            <form:input path="status" id="status" />
            <br />

            <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form:form>
    </div>
    <a class="return-link" href="/index">Return</a>
</body>
</html>
