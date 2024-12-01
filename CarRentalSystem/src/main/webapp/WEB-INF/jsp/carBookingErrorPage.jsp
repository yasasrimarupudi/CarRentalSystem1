<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <!--<title>Error Page</title>-->
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: white;
            background: black url('https://blog.remove-bg.ai/wp-content/uploads/2024/03/city-background-for-car-photo.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        h1 {
            font-size: 2.5em; /* Decreased the font size */
            color: #ff0000;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
        }

        h3 a {
            color: #00bfff;
            text-decoration: none;
            font-size: 1em; /* Adjusted the font size of the link */
        }

        h3 a:hover {
            color: #ffffff;
            text-decoration: underline;
        }

        div {
            margin-top: 5%; /* Reduced margin-top to move the content upwards */
        }
    </style>
</head>
<body>
    <div align="center">
        <h1>
            ${errorMessage} <!-- Correct JSTL expression for variable substitution -->
        </h1>
        <br/>
        <h3><a href="/index">Return</a></h3>
    </div>
</body>
</html>
