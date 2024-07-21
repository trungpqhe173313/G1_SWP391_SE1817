<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            text-align: center;
            color: #007bff;
        }
        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .form-group {
            width: 48%;
            margin-bottom: 20px;
        }
        .form-group.full-width {
            width: 100%;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
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
        .gender-group {
            display: flex;
            align-items: center;
        }
        .gender-group label {
            margin: 0 10px 0 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thêm Tài Khoản và Nhân Viên Mới</h1>
        <form action="addemployee" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
            <div class="form-group">
                <label for="phone">Số Điện Thoại:</label>
                <input type="text" id="phone" name="phone" maxlength="10" required>
            </div>
            <div class="form-group">
                <label for="pass">Mật Khẩu:</label>
                <input type="password" id="pass" name="pass" required>
            </div>
            <div class="form-group">
                <label for="fullName">Họ và Tên:</label>
                <input type="text" id="fullName" name="fullName" maxlength="50" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group full-width">
                <label for="avatar">Avatar:</label>
                <input type="file" class="form-control-file" id="avatar" name="avatar">
            </div>
            <div class="form-group full-width gender-group">
                <label>Giới Tính:</label>
                <input type="radio" id="male" name="gender" value="male" required>
                <label for="male">Nam</label>
                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Nữ</label>
            </div>
            <div class="form-group full-width">
                <input type="submit" value="Gửi">
            </div>
        </form>
    </div>

    <script>
        
        function validateForm() {
            var phoneNumber = document.getElementById("phone").value;
            if (!/^\d{10}$/.test(phoneNumber)) {
                alert("Số điện thoại phải là 10 chữ số.");
                return false;
            }

            var fullName = document.getElementById("fullName").value;
            if (!/^[\p{L}\s]+$/u.test(fullName)) {
                alert("Họ và Tên chỉ được chứa các chữ cái và khoảng trắng.");
                return false;
            }

            return true;
        }

        document.getElementById('phone').addEventListener('input', function (e) {
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        document.getElementById('fullName').addEventListener('input', function (e) {
            this.value = this.value.replace(/[^\p{L}\s]/gu, '');
        });
    </script>
</body>
</html>
