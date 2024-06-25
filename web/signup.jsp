<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>

            .gradient-custom {
                background-color: #EBE8DE;
            }

            .card-registration {
                border-radius: 15px;
                max-width: 600px; /* Thiết lập chiều rộng tối đa cho card */
                margin: 0 auto; /* Căn giữa card trên màn hình */
            }

            .card-registration .form-label {
                font-weight: bold; /* In đậm chữ trong label */
            }

            .btn-primary {
                background-color: #BF925B !important; /* Màu nút Submit */
                border-color: #BF925B !important;
            }

            /* Thêm padding cho phần nội dung của card */
            .card-body {
                padding: 2rem;
            }

            /* Giảm kích thước font cho các phần tử trong form */
            .card-body h3 {
                font-size: 1.25rem;
            }

            .card-body input[type="text"],
            .card-body input[type="password"] {
                font-size: 0.875rem;
            }

            .form-check-label {
                font-size: 0.875rem;
            }


        </style>
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #EBE8DE;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-8 col-xl-6">
                        <div class="card rounded-3">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp"
                                 class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                                 alt="Sample photo">
                            <div class="card-body p-4 p-md-5">
                                <form action="signup" method="post">


                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <h6 class="mb-0" for="phone">Số điện thoại</h6>
                                            <input type="text" name="phone" required value="${param.phone}" pattern="0[1-9]{9}" 
                                                   title="Số điện thoại phải là 10 chữ số và bắt đầu bằng số 0"class="form-control form-control-lg" />
                                            <p class="text-danger">${error2}</p>
                                        </div>

                                        <div class="col-md-6">
                                            <h6 class="mb-0" for="email">Email</h6>
                                            <input type="text" name="email" required value="${param.email}" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]$" 
                                                   title="Địa chỉ email không hợp lệ" class="form-control form-control-lg" />
                                        </div>
                                    </div>



                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <div data-mdb-input-init class="form-outline">
                                                <h6 class="mb-0" for="pass">Mật khẩu</h6>
                                                <input type="password" required value="${param.pass}" name="pass" class="form-control form-control-lg" />
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div data-mdb-input-init class="form-outline">
                                                <h6 class="mb-0" for="re_pass">Xác Thực Mật khẩu</h6>
                                                <input type="password" required value="${param.re_pass}" name="re_pass" class="form-control form-control-lg" />
                                            </div>
                                        </div>
                                        <p class="text-danger">${error1}</p>
                                    </div>

                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h6 class="mb-0">Giới tính</h6>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" value="${param.gender}" />
                                            <label class="form-check-label" for="female">Nữ</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" value="${param.gender}" />
                                            <label class="form-check-label" for="male">Nam</label>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div data-mdb-input-init class="form-outline">
                                            <h6 class="mb-0">Avatar</h6>
                                            <input type="file" required value="${param.avatar}" name="avatar" accept="image/*"class="form-control form-control-lg">
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <input data-mdb-ripple-init class="btn btn-primary btn-lg" type="submit" value="Đăng ký" />
                                        <br>
                                        <br>
                                        <a href="home"><- Quay lại trang chủ </a>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

