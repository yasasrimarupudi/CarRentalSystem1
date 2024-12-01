<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Variant Entry Page</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-image: url('car1.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            width: 90%;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3);
            text-align: center;
        }

        h1 {
            font-size: 2rem;
            color: #FFD700; /* Gold color for heading */
            margin-bottom: 15px;
            border-bottom: 2px solid #FFD700; /* Gold border for heading */
            padding-bottom: 5px;
        }

        label {
            font-size: 1rem;
            color: #FFD700; /* Gold for labels */
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #FFD700;
            background-color: #333;
            color: #f4f4f4;
            font-size: 1rem;
        }

        .form-button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: background-color 0.3s ease;
            margin: 5px;
        }

        .form-button[type="reset"] {
            background-color: #f44336;
        }

        .form-button:hover {
            opacity: 0.9;
        }

        .return {
            display: inline-block;
            margin-top: 20px;
            background-color: #FFD700;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .return:hover {
            background-color: #FFC107;
        }

        /* Table styling */
        /* Table styling */
table {
    width: 80%;  /* Reduced table width */
    margin-top: 20px;
    border-collapse: collapse;
    background-color: rgba(255, 255, 255, 0.1);
    border: 2px solid #FFD700; /* Gold border for table */
    color: #f4f4f4;
    margin: 0 auto; /* Center-align the table */
}

th, td {
    padding: 4px;  /* Reduced padding to decrease height */
    text-align: left;
    border: 1px solid #FFD700;
    height: 20px; 
}

th {
    background-color: #FFD700; /* Gold background for headers */
    color: #333; /* Dark text for header contrast */
}

tr:hover {
    background-color: rgba(255, 255, 255, 0.2);
}
        

        .form-group {
            margin-bottom: 20px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Car Variant Entry Page</h1>
        <form:form action="/variantAdd" method="post" modelAttribute="variantRecord">
            <form:hidden path="variantId"/>
            
            <div class="form-group">
                <label for="variantId">Variant Id:</label>
                <form:input path="variantId" disabled="true" class="form-input"/>
            </div>
            
            <div class="form-group">
                <label for="variantName">Enter Variant Name:</label>
                <form:input path="variantName" class="form-input"/>
            </div>
            
            <div class="form-group">
                <label for="numberOfSeat">Enter Number of Seats:</label>
                <form:input path="numberOfSeat" class="form-input"/>
            </div>
            
            <div class="form-group">
                <label for="fuel">Enter Type of Fuel:</label>
                <form:input path="fuel" class="form-input"/>
            </div>
            
            <div>
                <button type="submit" class="form-button">Submit</button>
                <button type="reset" class="form-button">Reset</button>
            </div>
        </form:form>
        <a href="/index" class="return">Return</a>
    </div>
</body>
</html>
