<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental System Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: url('https://images.unsplash.com/photo-1535732820275-9ffd998cac22?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
        }

        /* Navigation Bar Styles */
        .navbar {
            background-color: rgba(0, 0, 0, 0.8); /* Black background */
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar img {
            width: 35px;
            height: auto;
            margin-right: 10px;
        }

        .navbar h1 {
            color: white; /* White text for navbar */
            font-size: 28px;
            display: flex;
            align-items: center;
            margin: 0;
        }

        .navbar a {
            color: #007BFF;
            font-size: 16px;
            text-decoration: none;
            font-weight: bold;
            margin-left: 10px;
        }

        .navbar a:hover {
            color: #0056b3;
        }

        /* Container Styles for Login Box */
        .container {
            max-width: 450px;
            margin: 100px auto;
            background-color: rgba(0, 0, 0, 0.7); /* Black background */
            padding: 30px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            text-align: center;
            margin-left: 55%; /* Move the login box 4 times to the right */
        }

        h1 {
            text-align: center;
            color: white; /* White text for title */
            font-size: 2em;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .register-link {
            margin-top: 20px;
        }

        .register-link a {
            color: #007BFF;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .checkbox-container {
            margin-bottom: 20px;
            text-align: left;
        }

        .checkbox-container label {
            color: #fff;
            font-size: 14px;
        }

        .checkbox-container input[type="checkbox"] {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div style="display: flex; align-items: center;">
            <img src="https://c7.alamy.com/comp/2G16250/car-logo-2G16250.jpg" alt="Car Logo">
            <h1>Car Rental System</h1>
        </div>
        <div class="register-link">
            <a href="/register">Register</a> <span>Here?</span>
        </div>
    </div>

    <!-- Login Form -->
    <div class="container">
        <h1>Login</h1>
        <form action="/login" method="post">
            <input type="text" id="username" name="username" placeholder="Enter User ID" required/>
            <input type="password" id="password" name="password" placeholder="Enter Password" required/>
            
            <div class="checkbox-container">
                <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()"/>
                <label for="showPassword">Show Password</label>
            </div>
            
            <input type="submit" value="Login"/>
        </form>
    </div>

    <script>
        function togglePasswordVisibility() {
            const passwordField = document.getElementById("password");
            const toggleButton = document.getElementById("showPassword");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleButton.textContent = "Hide Password";
            } else {
                passwordField.type = "password";
                toggleButton.textContent = "Show Password";
            }
        }
    </script>
</body>
</html>