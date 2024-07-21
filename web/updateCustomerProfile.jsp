<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cập nhập hồ sơ người dùng</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="css/style_2.css">
    </head>

    <body>
        <!-- Account page navigation-->
        <nav class="nav nav-borders"></nav>
        <hr class="mt-0 mb-4">
        <div class="container-xl px-4 mt-4">
            <form action="updatecusprofile" method="POST">
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Ảnh đại diện</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                <!-- Profile picture help block-->
                                <div class="small font-italic text-muted mb-4">JPG hoặc PNG không > 5 MB</div>
                                <!-- Profile picture upload button-->
                                <button class="btn btn-primary" type="button">Cập nhật ảnh mới</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">Thông tin tài khoản</div>
                            <div class="card-body">
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (full name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="fullname">Họ và tên</label>
                                        <input class="form-control" type="text" id="fullname" required value""${customer.fullName}"">
                                    </div>
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="phone">Số điện thoại</label>
                                        <input class="form-control"type="text" name="phone" required value="${customer.phone}" readonly class="input">
                                    </div>
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (email address)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="email">Email</label>
                                        <input class="form-control" type="text" name="email" required value="${customer.account.email}" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Địa chỉ email không hợp lệ" class="input">
                                    </div>
                                    <!-- Form Group (location)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="gender">Giới tính</label>
                                        <div>
                                            <label class="radio-label"><input type="radio" name="gender" value="Male" ${customer.account.gender ? "checked" : ""}> Nam </label>
                                            <label class="radio-label"><input type="radio" name="gender" value="Female" ${!customer.account.gender ? "checked" : ""}> Nữ </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Save changes button-->
                        <div class="mt-3">
                            <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                            <a href="cusprofile" class="btn btn-secondary">Quay lại</a>
                        </div>
                    </div>

                </div>

            </form>
        </div>
    </body>
</html>