<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Rental System - Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://images.unsplash.com/photo-1502014335594-c026800f24ee?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        .navbar img {
            width: 30px;
            height: auto;
            margin-right: 10px;
        }

        .login-link {
            font-size: 16px;
            margin-right: 4px;
            white-space: nowrap;
            padding-right: 20px;
        }

        .login-link a {
            color: blue;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 400px;
            margin: 120px auto;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 18px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        input[type="text"], input[type="password"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }

        input::placeholder {
            font-size: 14px;
            color: #888;
        }

        .form-group {
            position: relative;
        }
    </style>
    <script type="text/javascript">
        function passwordCheck() {
            var pass1 = (document.getElementById("pass1").value).toString();
            var pass2 = (document.getElementById("pass2").value).toString();
            if(pass1.length < 5 || pass1.length > 10){
            	alert("Password must be between 5 to 10 character long");
            	return;
            }
            if (pass1 === pass2)
                document.getElementById("registrationForm").submit();
            else
                alert("Passwords do not match");
        }
    </script>
</head>
<body>

<div class="navbar">
    <div>
        <img src="https://c7.alamy.com/comp/2G16250/car-logo-2G16250.jpg" alt="Car Logo">
        Car Rental System
    </div>
    <div class="login-link">
        Already Registered? <a href="/login">Login</a>
    </div>
</div>

<div class="container">
    <h1 style="text-align:center;">Register</h1>

    <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord">
        <div class="form-group">
            <form:input path="username" placeholder="Enter New User Id" />
        </div>
        <div class="form-group">
            <form:input type="password" id="pass1" path="password" placeholder="Enter New Password" />
        </div>
        <div class="form-group">
            <input type="password" id="pass2" placeholder="Re-type New Password" />
        </div>
        <div class="form-group">
            <form:input path="email" placeholder="Enter email" />
        </div>
        <div class="form-group">
            <select name="role" id="role" path="role">
                <option value="" disabled selected>Select User Role</option>
                <option value="Customer">Customer</option>
                <option value="Admin">Admin</option>
            </select>
        </div>

        <button type="button" onclick="passwordCheck();">Submit</button>
        <button type="reset">Reset</button>
    </form:form>
</div>

</body>
</html>
