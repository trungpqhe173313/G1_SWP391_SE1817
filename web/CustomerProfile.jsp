
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Hồ sơ cá nhân người dùng</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="css/style_2.css">


    </head>
    <body>
        <c:set var="c" value="${requestScope.customer}" />
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">

            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Thông tin tài khoản</div>
                        <div class="card-body">
                            <form>

                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (full name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="fullname">Họ và tên</label>
                                        <input class="form-control" id="fullname" value="${c.fullName}">
                                    </div>
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="phone">Số điện thoại</label>
                                        <input class="form-control" id="phone" value="${c.phone}">
                                    </div>
                                </div>
                                <!-- Form Row        -->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (email address)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="email">Email</label>
                                        <input class="form-control" id="email" value="${c.account.email}">
                                    </div>
                                    <!-- Form Group (location)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="gender">Giới tính</label>
                                        <input class="form-control" id="gender" value="${c.account.gender ? 'Male' : 'Female'}">
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="button" onclick="updateCustomer(${c.customerId})">Cập nhập thông tin</button>
                                <button class="btn btn-primary" type="button" onclick="changePassword(${c.customerId})">Cập nhập mật khẩu</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function updateCustomer(customerId) {
            window.location.href = 'customerupdate?customerId=' + customerId;
        }
        function changePassword(customerId) {
            window.location.href = 'changepassw?customerId=' + customerId;
        }
    </script>
</body>
</html>
