

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <style>
            body {
             background: 
                linear-gradient(45deg, #D08C83 25%, transparent 25%, transparent 75%, #D08C83 75%, #D08C83),
                linear-gradient(-45deg, #FFC0CB 25%, transparent 25%, transparent 75%, #FFC0CB 75%, #FFC0CB);
            background-size: 150px 150px; /* Điều chỉnh kích thước của các ô nhỏ */
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-size: 18px;
            }
            .form-container {
                background-color: #2a2a2a;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
                width: 600px; /* Đặt chiều rộng cố định cho form-container */
                display: flex; /* Sử dụng flexbox để căn chỉnh phần tử bên trong */
                align-items: center; /* Căn giữa các thành phần bên trong */
                margin-bottom: 20px; /* Khoảng cách dưới của form-container */
            }
            .form-container .avatar {
                width: 150px; /* Thay đổi kích thước avatar */
                height: 150px; /* Thay đổi kích thước avatar */
                border-radius: 50%; /* Làm hình tròn */
                background-color: #ffd700;
                color: #000;
                text-align: center;
                line-height: 80px; /* Để chữ nằm giữa avatar */
                font-size: 12px;
                margin-right: 200px;
            }
            .form-content {
                flex: 1; /* Phần tử này sẽ chiếm toàn bộ không gian còn lại */
                margin-left: 20px; /* Đặt khoảng cách giữa avatar và thông tin */
            }
            .form-group label {
                color: #ffd700;
            }
            .form-group td {
                color: #fff;
            }
            .btn-primary {
                background-color: #ffd700;
                border-color: #ffd700;
                border-radius: 5px; /* Góc cong cho nút */
                margin-top: 20px; /* Khoảng cách trên của nút */
                width: 100px;
                height: 50px; 
            }
            .btn-primary:hover {
                background-color: #c0c000;
                border-color: #c0c000;
            }
            .form-group {
                margin-bottom: 20px;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="a" value="${requestScope.account}" />

        <div class="container">
            <div class="form-container">
                <div class="avatar">
                    <div class="form-ava">
                        <label for="avatar"> ${a.avatar}</label>
                    </div>

                </div>
                <div class="form-content">
                    <div class="form-group">
                        <label for="phone">Phone number: </label>
                        <td>${a.phone}</td>
                    </div>
                    <div class="form-group">
                        <label for="fullName">Full Name: </label>
                        <td>${a.fullName}</td>
                    </div>
                    <div class="form-group">
                        <label for="email">Email: </label>
                        <td>${a.email}</td>
                    </div>
                    <div class="form-group">
                        <label for="isMale">Gender: </label>
                        <td>${a.isMale ? 'Male' : 'Female'}</td>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
               
                <button type="button" class="btn btn-primary" onclick="updateCustomer(${a.id})">Update</button>
                <button type="button" class="btn btn-primary" onclick="changePassword(${a.id})">ChangePass</button>
            </div>
        </div>

        <script>
            function updateCustomer(id) {
                window.location.href = 'customerupdate?id=' + id;
            }
            function changePassword(id) {
                window.location.href = 'changepassw?id=' + id;
            }
        </script>
    </body>
</html>
