<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Account and Employee</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
        h1 {
            text-align: center;
            color: #007bff;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            width: 100%;
            margin-bottom: 20px;
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
    <div id="wrapper">
        <jsp:include page="sidebar.jsp"></jsp:include>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="container">
                    <h1>Thêm Tài Khoản và Nhân Viên Mới</h1>
                    <form action="addemployee" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="fullName">Họ và Tên:</label>
                            <input type="text" id="fullName" name="fullName" maxlength="50" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Số Điện Thoại:</label>
                            <input type="text" id="phone" name="phone" maxlength="10" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" maxlength="50" required>
                        </div>
                        <div class="form-group gender-group">
                            <label>Giới Tính:</label>
                            <input type="radio" id="male" name="gender" value="male" required>
                            <label for="male">Nam</label>
                            <input type="radio" id="female" name="gender" value="female">
                            <label for="female">Nữ</label>
                        </div>
                        <div class="form-group">
                            <label for="pass">Mật Khẩu:</label>
                            <input type="password" id="pass" name="pass" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPass">Xác Nhận Mật Khẩu:</label>
                            <input type="password" id="confirmPass" name="confirmPass" required>
                        </div>
                        <div class="form-group">
                            <label for="avatar">Ảnh Đại Diện:</label>
                            <input type="file" class="form-control-file" id="avatar" name="avatar">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Gửi">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script>
function validateForm() {
    // Validate phone number
    var phoneNumber = document.getElementById("phone").value;
    if (!/^0\d{9}$/.test(phoneNumber)) {
        alert("Số điện thoại phải bắt đầu bằng số 0 và có 10 chữ số.");
        return false;
    }

    // Check if phone number already exists
    var phoneCheck = new XMLHttpRequest();
    phoneCheck.open("POST", "checkphone", false); // Synchronous request
    phoneCheck.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    phoneCheck.send("phone=" + encodeURIComponent(phoneNumber));
    
    var response = JSON.parse(phoneCheck.responseText);
    if (response.exists) {
        alert("Số điện thoại đã tồn tại.");
        return false;
    }

    // Validate full name
    var fullName = document.getElementById("fullName").value;
    if (!/^[\p{L}\s]+$/u.test(fullName)) {
        alert("Họ và Tên chỉ được chứa các chữ cái và khoảng trắng.");
        return false;
    }

    // Validate password and confirmation password
    var password = document.getElementById("pass").value;
    var confirmPassword = document.getElementById("confirmPass").value;

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Mật khẩu xác nhận không khớp.");
        return false;
    }

    // Check for leading spaces in passwords
    if (/^\s/.test(password) || /^\s/.test(confirmPassword)) {
        alert("Mật khẩu không được chứa khoảng trắng ở đầu.");
        return false;
    }

    // Check password length
    if (password.length < 8) {
        alert("Mật khẩu phải có ít nhất 8 ký tự.");
        return false;
    }

    // Validate no leading spaces in other fields
    var inputs = document.querySelectorAll('input[type="text"], input[type="password"], input[type="email"]');
    for (var i = 0; i < inputs.length; i++) {
        if (/^\s/.test(inputs[i].value)) {
            alert("Không được viết dấu khoảng cách ở đầu của tất cả các trường.");
            return false;
        }
    }

    // Validate image file
    var avatar = document.getElementById("avatar").files[0];
    if (!avatar) {
        alert("Ảnh đại diện không được để trống.");
        return false;
    }

    // Check for valid image file extensions
    const validExtensions = ['jpg', 'jpeg', 'png'];
    const fileExtension = avatar.name.split('.').pop().toLowerCase();
    if (!validExtensions.includes(fileExtension)) {
        alert("Ảnh đại diện phải là file jpg hoặc png.");
        return false;
    }

    return true;
}

// Add event listeners to prevent leading spaces
var inputs = document.querySelectorAll('input[type="text"], input[type="password"], input[type="email"]');
inputs.forEach(function(input) {
    input.addEventListener('input', function (e) {
        this.value = this.value.replace(/^\s+/g, '');
    });
});

// Additional input restrictions
document.getElementById('phone').addEventListener('input', function (e) {
    this.value = this.value.replace(/[^0-9]/g, '');
});

document.getElementById('fullName').addEventListener('input', function (e) {
    this.value = this.value.replace(/[^\p{L}\s]/gu, '');
});

</script>


</body>
</html>
