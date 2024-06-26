
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Đăng nhập</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked>
            <label for="tab-1" class="tab">Đăng nhập</label>
            <div class="login-form">
                <div class="sign-in-htm">
                    <form action="login" method="post" class="signin-form">
                        <div class="group">
                            <label class="label" for="phone">Số điện thoại</label>
                            <input type="text" class="input"  required name = "phone" value="${cookie.cUser.value}">
                        </div>

                        <div class="group">
                            <label class="label" for="pass">Mật khẩu</label>
                            <input type="password" class="input"  required name = "pass" value="${cookie.cPass.value}">
                        </div>
                        <div class="group">
                            
                            <label for="check"><span class="icon"></span> Lưu tài khoản
                                <input type="checkbox" name="remember" ${cookie.cRem != null ? 'checked' : ''}>
                                <span class="checkmark"></span>
                            </label>

                        </div>
                        <div class="group">
                            <input type="submit" class="button" value="Đăng ký">
                        </div>

                        <div class="foot-lnk">
                            <a href="sendlink">Quên mật khẩu?</a>
                        </div>
                        
                        <div class="foot-lnk">
                            <p>Chưa có tài khoản?<a href="signup"> Đăng ký</a></p>
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












