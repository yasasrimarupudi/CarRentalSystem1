<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Car</title>
    <style>
        body {
            font-family: 'Cambria', serif;
            background-color: #000;
            background-image: url('car7.jpg'); /* Add your background image URL */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff; /* White text for contrast */
        }

        .container {
            width: 600px;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.7); /* Transparent black background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            text-align: left;
            border: 2px solid #FFD700; /* Gold border for the form */
        }

        h1 {
            color: #FFD700; /* Gold color for heading */
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
        }

        label {
            color: #FFD700;
            font-weight: bold;
            font-size: 14px;
            display: block;
            margin-bottom: 10px;
        }

        .input-box, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 2px solid #FFD700; /* Gold border for input fields and select */
            background-color: #333; /* Dark background for input fields */
            color: #fff; /* White text inside inputs */
            font-size: 14px;
            box-sizing: border-box;
        }

        .input-box:focus, select:focus {
            border-color: #4285f4;
            outline: none;
        }

        button {
            padding: 10px 20px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            margin-top: 10px;
            transition: background-color 0.3s ease;
            border: 2px solid #FFD700; /* Gold border for buttons */
        }

        button[type="submit"] {
            background-color: #28a745; /* Green for submit */
        }

        button[type="reset"] {
            background-color: #dc3545; /* Red for reset */
        }

        button:hover {
            opacity: 0.9;
        }

        button[type="reset"]:hover {
            background-color: #c82333;
        }

        .button-container {
            margin-top: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        @media (max-width: 600px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Car</h1>
        <form:form action="/carAdd" method="post" modelAttribute="carRecord">
            <form:hidden path="available" />

            <label for="carNumber">Car Registration Number:</label>
            <form:input path="carNumber" id="carNumber" class="input-box" placeholder="Enter Registration Number" />

            <label for="carName">Car Name:</label>
            <form:input path="carName" id="carName" class="input-box" placeholder="Enter Car Name" />

            <label for="carColor">Car Color:</label>
            <form:input path="carColor" id="carColor" class="input-box" placeholder="Enter Car Color" />

            <label for="manufacturer">Car Manufacturer Name:</label>
            <form:input path="manufacturer" id="manufacturer" class="input-box" placeholder="Enter Manufacturer Name" />

            <label for="yearOfMfg">Year of Manufacturing:</label>
            <form:input path="yearOfMfg" id="yearOfMfg" class="input-box" placeholder="Enter Year of Manufacturing" />

            <label for="rentRate">Rent Rate per Day:</label>
            <form:input path="rentRate" id="rentRate" class="input-box" placeholder="Enter Rent Rate per Day" />

            <label for="variantId">Select Variant:</label>
            <form:select path="variantId" id="variantId" class="input-box">
                <form:option value="" label="Select Variant ID" disabled="true" />
                <c:forEach items="${variantIdList}" var="vids">
                    <form:option value="${vids}">${vids}</form:option>
                </c:forEach>
            </form:select>

            <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form:form>
    </div>
</body>
</html>
