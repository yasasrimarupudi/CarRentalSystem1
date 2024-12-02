<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Update Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://blog.remove-bg.ai/wp-content/uploads/2024/03/natural-background-for-car-photo.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7); /* Transparent black */
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            width: 500px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #FFD700; /* Gold color for heading */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #FFD700; /* Gold border */
            padding: 10px;
            text-align: left;
            color: #fff;
        }

        table th {
            background-color: rgba(0, 0, 0, 0.6); /* Dark background for table headers */
            color: #FFD700; /* Gold text for headers */
            font-size: 16px;
        }

        table td {
            background-color: rgba(0, 0, 0, 0.6); /* Slightly lighter background for table cells */
        }

        form input, form select {
            width: 100%;
            padding: 8px;
            margin: 0;
            border: 1px solid #FFD700;
            border-radius: 5px;
            font-size: 14px;
            background-color: #333;
            color: #fff;
        }

        form input[disabled] {
            background-color: #555;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%;
        }

        button[type="submit"] {
            background-color: #4CAF50;
        }

        button[type="reset"] {
            background-color: #f44336;
        }

        button:hover {
            opacity: 0.9;
        }
        .return-link {
                text-decoration: none;
                color: gold;
                font-size: 18px;
                display: inline-block;
                text-align: center;
                margin-top: 20px;
            }

            .return-link:hover {
                color: #b8860b;
            }
    </style>
</head>
<body>
    <div class="container">
        <h1><u>Car Update Page</u></h1>
        <form:form action="/carUpdate" method="post" modelAttribute="carRecord">
            <form:hidden path="carNumber"/>
            <form:hidden path="carName"/>
            <form:hidden path="carColor"/>
            <form:hidden path="manufacturer"/>
            <form:hidden path="variantId"/>
            <form:hidden path="yearOfMfg"/>

            <table>
                <tr>
                    <th>Car Registration Number:</th>
                    <td><form:input path="carNumber" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Car Name:</th>
                    <td><form:input path="carName" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Car Color:</th>
                    <td><form:input path="carColor" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Manufacturer Name:</th>
                    <td><form:input path="manufacturer" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Variant ID:</th>
                    <td><form:input path="variantId" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Year of Manufacture:</th>
                    <td><form:input path="yearOfMfg" disabled="true"/></td>
                </tr>
                <tr>
                    <th>Enter New Rent Rate per Hour:</th>
                    <td><form:input path="rentRate"/></td>
                </tr>
                <tr>
                    <th>Car Availability:</th>
                    <td>
                        <form:select path="available" id="available">
                            <option value="true" ${carRecord.available ? 'selected' : ''}>Available</option>
                            <option value="false" ${!carRecord.available ? 'selected' : ''}>Unavailable</option>
                        </form:select>
                    </td>
                </tr>
            </table>

            <div class="button-container">
                <button type="submit">Submit</button>
                <button type="reset">Reset</button>
            </div>
        </form:form>
        <h3 style="text-align: center;"><a class="return-link" href="/index">Return</a></h3>
    </div>
    
</body>
</html>