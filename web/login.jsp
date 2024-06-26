<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style_1.css">

    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section"></h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(images/bg-1.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <form action="login" method="post" class="signin-form">
                                    <p class="text-danger">${error}</p>
                                    <div class="form-group mb-3">
                                        <label class="label" for="phone">Số điện thoại</label>
                                        <input type="text" class="form-control" placeholder="Số điện thoại" required name = "phone" value="${cookie.cUser.value}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="pass">Mật khẩu</label>
                                        <input type="password" class="form-control" placeholder="Mật khẩu" required name = "pass" value="${cookie.cPass.value}">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Đăng nhập</button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="checkbox-wrap checkbox-primary mb-0">Lưu tài khoản
                                                <input type="checkbox" name="remember" ${cookie.cRem != null ? 'checked' : ''}>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="sendlink">Quên mật khẩu</a>
                                        </div>
                                    </div>
                                </form>
                                <p class="text-center">Chưa có tài khoản?<a href="signup">Đăng ký</a></p>
                                <div class="text-center">
                                    <a href="home"> <- Quay lại trang chủ </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

