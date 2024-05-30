<%-- 
    Document   : addemployees
    Created on : May 30, 2024, 3:42:43 AM
    Author     : ducth
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Account and Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 500px;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 5px;
        }
        .gender-group label {
            display: inline-block;
            margin-right: 20px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Account and Employee</h2>
        <form action="addemployees" method="post">
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="avatar">Avatar:</label>
            <input type="text" id="avatar" name="avatar">
            
            <div class="gender-group">
                <label for="isMale">Gender:</label>
                <input type="radio" id="male" name="isMale" value="true" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="isMale" value="false">
                <label for="female">Female</label>
            </div>
            
            <label for="roleId">Role:</label>
            <select id="roleId" name="roleId" required>
                <option value="3">Thu ngân</option>
                <option value="4">Thợ cắt tóc</option>
            </select>
            
            <label for="isActive">Active:</label>
            <input type="checkbox" id="isActive" name="isActive" value="true" checked>
            
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
