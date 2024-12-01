<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Entry Page</title>
    <style>
        body {
            font-family: 'Cambria', serif;
            background-color: #000; /* Black background for entire page */
            background-image: url('car7.jpg'); /* Add your background image URL here */
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

        /* Side by side label and input */
        .form-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-row label {
            flex: 1;
            margin-right: 10px;
            text-align: right;
        }

        .form-row .input-box {
            flex: 2;
        }

        @media (max-width: 600px) {
            .container {
                width: 90%;
            }

            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-row label {
                margin-right: 0;
                margin-bottom: 5px;
            }

            .form-row .input-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Car Entry Page</h1>
        <form action="/carAdd" method="post">
            <div class="form-row">
                <label for="carNumber">Enter Car Registration Number:</label>
                <input type="text" id="carNumber" name="carNumber" placeholder="Enter Registration Number" class="input-box" />
            </div>

            <div class="form-row">
                <label for="carName">Enter Car Name:</label>
                <input type="text" id="carName" name="carName" placeholder="Enter Car Name" class="input-box" />
            </div>

            <div class="form-row">
                <label for="carColor">Enter Car Color:</label>
                <input type="text" id="carColor" name="carColor" placeholder="Enter Car Color" class="input-box" />
            </div>

            <div class="form-row">
                <label for="manufacturer">Enter Manufacturer Name:</label>
                <input type="text" id="manufacturer" name="manufacturer" placeholder="Enter Manufacturer Name" class="input-box" />
            </div>

            <div class="form-row">
                <label for="yearOfMfg">Enter Year of Manufacture:</label>
                <input type="number" id="yearOfMfg" name="yearOfMfg" placeholder="Enter Year" min="1886" max="2024" class="input-box" />
            </div>

            <div class="form-row">
                <label for="rentRate">Enter Rent Rate per Hour:</label>
                <input type="number" id="rentRate" name="rentRate" placeholder="Enter Rent Rate" step="0.01" min="0" class="input-box" />
            </div>

            <div class="form-row">
                <label for="variantId">Select Variant ID:</label>
                <select id="variantId" name="variantId" class="input-box">
                    <option value="" disabled selected>Select Variant ID</option>
                    <c:forEach items="${variantIdList}" var="vids">
                        <option value="${vids}">${vids}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form>
    </div>
</body>
</html>
