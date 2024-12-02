<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Rental Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #000; /* Black background */
            background-image: url('https://t4.ftcdn.net/jpg/09/85/79/75/360_F_985797592_HmUJVDbiiqJYjp2pd84EcUWy5Vb5YUrv.jpg'); /* Background image */
            background-size: cover; /* Ensure the image covers the whole body */
            background-position: center; /* Center the image */
            margin: 0;
            padding: 0;
            color: #fff; /* White text for better contrast */
        }

        h1 {
            font-family: 'ALGERIAN', sans-serif;
            color: #ffcc00; /* Gold color for the heading */
            margin-top: 30px;
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

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #444; /* Slightly lighter gray for hover */
            color: #fff; /* Change text color to white on hover */
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
        .chat-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background-color: #007bff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            z-index: 1000;
        }

        .chat-icon i {
            color: white;
            font-size: 24px;
        }

        .chat-container {
            position: fixed;
            bottom: 100px;
            right: 20px;
            width: 350px;
            height: 500px;
         background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            display: none;
            flex-direction: column;
            z-index: 1000;
        }

        .chat-container.active {
            display: flex;
        }

        .chat-header {
            padding: 15px;
            background-color: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .chat-header h3 {
            margin: 0;
        }
         .close-btn {
            background: none;
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
        }

        .chat-messages {
            flex-grow: 1;
            padding: 15px;
            overflow-y: auto;
        }

        .message {
            margin: 10px 0;
            padding: 10px 15px;
            border-radius: 15px;
            max-width: 80%;
            word-wrap: break-word;
        }

        .message.user {
            background-color: #007bff;
            color: white;
            margin-left: auto;
        }

        .message.bot {
        background-color: #f0f0f0;
            color: black;
            margin-right: auto;
        }

        .chat-input {
            padding: 15px;
            border-top: 1px solid #ddd;
            display: flex;
            gap: 10px;
        }

        .chat-input input {
            flex-grow: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }

        .chat-input button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
         }

        .chat-input button:hover {
            background-color: #0056b3;
        }
        
    </style>
</head>

<body>
    <div align="center">
        <h1>Welcome To Car Rental Page</h1>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn">Customer</button>
                <div class="dropdown-content">
                    <a href="/customerAdd">Customer Addition</a>
                    <a href="/singleCustomerReport">Customer Reports</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Booking</button>
                <div class="dropdown-content">
                    <a href="/customerCarReport">New Booking</a>
                    <a href="/bookingReport">Booking Report</a>
                </div>
            </div>
            <a href="/logout" class="logout">Logout</a>
        </div>
    </div>
    <div class="chat-icon" onclick="toggleChat()">
        <i class="fa fa-comments"></i>
    </div>

    <div class="chat-container" id="chatContainer">
        <div class="chat-header">
            <h3>Customer Support</h3>
            <button class="close-btn" onclick="toggleChat()">×</button>
        </div>
        <div class="chat-messages" id="chatMessages">
            <div class="message bot">
                Hello! How can I help you today? Type 'help' to see available options.
            </div>
        </div>
        <div class="chat-input">
            <input type="text" id="userInput" placeholder="Type your message..." onkeypress="handleKeyPress(event)">
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
    <script>
        function toggleChat() {
            const chatContainer = document.getElementById('chatContainer');
            chatContainer.classList.toggle('active');
        }

        function handleKeyPress(event) {
            if (event.keyCode === 13) { // Enter key
                sendMessage();
            }
        }

        function appendMessage(message, isUser) {
            const chatMessages = document.getElementById('chatMessages');
            const messageDiv = document.createElement('div');
            messageDiv.className = message ${isUser ? 'user' : 'bot'};
            messageDiv.textContent = message;
            chatMessages.appendChild(messageDiv);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        function sendMessage() {
            const input = document.getElementById('userInput');
            const message = input.value.trim();
            if (message === '') return;

            // Display user message
            appendMessage(message, true);
            input.value = '';

            // Send to backend and get response
            fetch('http://localhost:9898/api/chatbot/query', {
                method: 'POST', // Make sure to use POST, not GET
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ message: 'Hello, bot!' }) // Replace with actual user input
            })
            .then(response => response.json()) // Assuming response is JSON
            .then(data => {
                console.log('Bot response:', data);
            })
            .catch(error => {
                console.error('Error:', error);
            });

        }
        </script>
</body>
</html>
