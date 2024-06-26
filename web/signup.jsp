<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Đăng ký</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="style.css">
    </head>



    <body>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-2" type="radio" name="tab" class="sign-up" checked>
                <label for="tab-2" class="tab">Đăng ký</label>
                <div class="login-form">
                    <div class="sign-up-htm">
                        <form action="signup" method="post">
                            <div class="group">
                                <label for="fullname" class="label">Họ và tên</label>
                                <input type="text" required value="${param.fullName}" name="fullname"  class="input">
                            </div>

                            <div class="group">
                                <label for="phone" class="label">Số điện thoại</label>
                                <input type="text" name="phone" required value="${param.phone}" pattern="0[1-9]{9}" 
                                       title="Số điện thoại phải là 10 chữ số và bắt đầu bằng số 0" class="input">
                            </div>

                            <div class="group">
                                <label for="pass" class="label">Mật khẩu</label>
                                <input type="password" required value="${param.pass}" name="pass" class="input">
                            </div>
                            <div class="group">
                                <label for="re_pass" class="label">Xác Thực Mật khẩu</label>
                                <input type="password" required value="${param.re_pass}" name="re_pass" class="input">
                            </div>
                            <p class="text-danger">${error1}</p>

                            <div class="group">
                                <label for="email" class="label">Email</label>
                                <input type="text" name="email" required value="${param.email}" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                                       title="Địa chỉ email không hợp lệ" class="input">
                            </div>

                            <div class="group">
                                <label for="gender" class="label">Giới tính</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="${param.gender}" />
                                    <label class="form-check-label" for="female">Nữ</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" value="${param.gender}" />
                                    <label class="form-check-label" for="male">Nam</label>
                                </div>
                            </div>  

                            <div class="group">
                                <label for="avatar" class="label">Ảnh đại diện</label>
                                <input type="file" value="${param.avatar}" name="avatar" accept="image/*"class="input">
                            </div> 

                            <div class="group">
                                <input type="submit" class="button" value="Đăng ký">
                            </div>
                            <br>
                            <div class="foot-lnk">
                                <p>Đã có tài khoản?<a href="login">Đăng nhập</a></p>
                            </div>
                            <br>
                            <div class="foot-lnk">
                                <a href="home" style="color: black"><- Quay lại trang chủ </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

