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

        <style>

            body{
                margin:0;
                color:#BF925B;
                background:#EBE8DE;
                font:600 16px/18px 'Open Sans',sans-serif;
            }
            *,:after,:before{
                box-sizing:border-box
            }
            .clearfix:after,.clearfix:before{
                content:'';
                display:table
            }
            .clearfix:after{
                clear:both;
                display:block
            }
            a{
                color:inherit;
                text-decoration:none
            }

            .login-wrap {
                width: 100%;
                margin: auto;
                max-width: 500px; /* Increase max-width for more content space */
                min-height: 550px; /* Increase min-height for more content space */
                position: relative;
                background: linear-gradient(rgba(40,57,101, .3), rgba(40,57,101, .3)),
                    url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
                background-size: cover; /* Ensure the background image covers the entire container */
                box-shadow: 0 12px 15px 0 rgba(0,0,0, .24),
                    0 17px 50px 0 rgba(0,0,0, .19);
                padding: 20px; /* Add padding to prevent content from touching the edges */
            }

            .login-wrap-si{
                width: 100%;
                margin: auto;
                max-width: 600px; /* Increase max-width for more content space */
                min-height: 800px; /* Increase min-height for more content space */
                position: relative;
                background: linear-gradient(rgba(40,57,101, .3), rgba(40,57,101, .3)),
                    url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
                background-size: cover; /* Ensure the background image covers the entire container */
                box-shadow: 0 12px 15px 0 rgba(0,0,0, .24),
                    0 17px 50px 0 rgba(0,0,0, .19);
                padding: 20px; /* Add padding to prevent content from touching the edges */
            }


            .login-html{
                width:100%;
                height:100%;
                position:absolute;
                padding:90px 70px 50px 70px;
                background:rgba(255,255,255,.9); /* Sửa lại màu nền */
            }
            .login-html .sign-in-htm,
            .login-html .sign-up-htm{
                top:0;
                left:0;
                right:0;
                bottom:0;
                position:absolute;
                transform:rotateY(180deg);
                backface-visibility:hidden;
                transition:all .4s linear;
            }
            .login-html .sign-in,
            .login-html .sign-up,
            .login-form .group .check{
                display:none;
            }
            .login-html .tab,
            .login-form .group .label,
            .login-form .group .button{
                text-transform:uppercase;
            }
            .login-html .tab{
                font-size:22px;
                margin-right:15px;
                padding-bottom:5px;
                margin:0 15px 10px 0;
                display:inline-block;
                border-bottom:2px solid transparent;
            }
            .login-html .sign-in:checked + .tab,
            .login-html .sign-up:checked + .tab{
                color:#BF925B; /* Sửa lại màu chữ */
                border-color:#BF925B; /* Sửa lại màu border */
            }
            .login-form{
                min-height:345px;
                position:relative;
                perspective:1000px;
                transform-style:preserve-3d;
            }
            .login-form .group{
                margin-bottom:15px;
            }
            .login-form .group .label,
            .login-form .group .input,
            .login-form .group .button{
                width:100%;
                color:#333; /* Sửa lại màu chữ */
                display:block;
            }
            .login-form .group .input,
            .login-form .group .button{
                border:none;
                padding:15px 20px;
                border-radius:25px;
                background:rgba(255,255,255,.1);
                border: 1px solid rgba(255,255,255,.3); /* Thêm viền mờ */
                outline: none; /* Loại bỏ viền mặc định khi focus */
            }
            .login-form .group .input{
                border: 1px solid rgba(0,0,0,.2); /* Thêm viền mờ mờ */
                background-color: rgba(255,255,255,.3); /* Làm nổi bật ô nhập liệu */
            }
            .login-form .group .input:focus{
                border: 1px solid black; /* Đổi màu viền khi focus */
                background-color: rgba(255,255,255,.5); /* Làm nổi bật ô nhập liệu khi focus */
            }
            .login-form .group input[data-type="password"]{
                text-security:circle;
                -webkit-text-security:circle;
            }
            .login-form .group .label{
                color:#333; /* Sửa lại màu chữ */
                font-size:12px;
            }
            .login-form .group .button{
                background:#BF925B; /* Sửa lại màu nền */
            }
            .login-form .group label .icon{
                width:15px;
                height:15px;
                border-radius:2px;
                position:relative;
                display:inline-block;
                background:rgba(255,255,255,.1);
            }
            .login-form .group label .icon:before,
            .login-form .group label .icon:after{
                content:'';
                width:10px;
                height:2px;
                background:#333; /* Sửa lại màu chữ */
                position:absolute;
                transition:all .2s ease-in-out 0s;
            }
            .login-form .group label .icon:before{
                left:3px;
                width:5px;
                bottom:6px;
                transform:scale(0) rotate(0);
            }
            .login-form .group label .icon:after{
                top:6px;
                right:0;
                transform:scale(0) rotate(0);
            }
            .login-form .group .check:checked + label{
                color:#333; /* Sửa lại màu chữ */
            }
            .login-form .group .check:checked + label .icon{
                background:#BF925B; /* Sửa lại màu nền */
            }
            .login-form .group .check:checked + label .icon:before{
                transform:scale(1) rotate(45deg);
            }
            .login-form .group .check:checked + label .icon:after{
                transform:scale(1) rotate(-45deg);
            }
            .login-html .sign-in:checked + .tab + .login-form .sign-in-htm{
                transform:rotate(0);
            }
            .login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
                transform:rotate(0);
            }

            .hr{
                height:2px;
                margin:60px 0 50px 0;
                background:rgba(255,255,255,.2);
            }
            .foot-lnk{
                text-align:center;
            }
            .group-gen{
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                font:600 16px/18px 'Open Sans',sans-serif;
            }

            .group-gen .label {
                color: #333;
                font-size: 12px;
                margin-right: 20px; /* Add space between label and radio buttons */
            }

            .form-check-inline {
                display: flex;
                align-items: center;
                margin-right: 10px; /* Add some space between the radio button groups */
            }

            .form-check-inline .form-check-input {
                margin-right: 5px; /* Add some space between radio button and label */
            }

            .form-check-inline .form-check-label {
                margin-right: 15px; /* Add some space between the two radio button groups */
            }
        </style>
    </head>



    <body>
        <div class="login-wrap-si">
            <div class="login-html">
                <input id="tab-2" type="radio" name="tab" class="sign-up" checked>
                <label for="tab-2" class="tab">Đăng ký</label>
                <div class="login-form">
                    <div class="sign-up-htm">
                        <form action="signup" method="post">
                            <div class="group">
                                <label for="fullname" class="label">Họ và tên*</label>
                                <input type="text" required value="${param.fullName}" name="fullname"  class="input">
                            </div>

                            <div class="group">
                                <label for="phone" class="label">Số điện thoại*</label>
                                <input type="text" name="phone" required value="${param.phone}" pattern="0[0-9]{9}" 
                                       title="Số điện thoại phải là 10 chữ số và bắt đầu bằng số 0" class="input">
                            </div>

                            <div class="group">
                                <label for="pass" class="label">Mật khẩu*</label>
                                <input type="password" required value="${param.pass}" name="pass" class="input">
                            </div>
                            <div class="group">
                                <label for="re_pass" class="label">Xác Thực Mật khẩu*</label>
                                <input type="password" required value="${param.re_pass}" name="re_pass" class="input">
                            </div>
                            <p class="text-danger">${error1}</p>

                            <div class="group">
                                <label for="email" class="label">Email*</label>
                                <input type="text" name="email" required value="${param.email}" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                                       title="Địa chỉ email không hợp lệ" class="input">
                            </div>

                            <div class="group-gen">
                                <label for="gender" class="label">Giới tính</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="female" name="gender" value="false" />
                                    <label class="form-check-label" for="female">Nữ</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="male" name="gender" value="true" />
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

                            <div class="foot-lnk">
                                <p>Đã có tài khoản?<a href="login"> Đăng nhập</a></p>
                            </div>

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

