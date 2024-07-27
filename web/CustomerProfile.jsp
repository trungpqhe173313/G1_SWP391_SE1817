<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery -->

        <link rel="stylesheet" href="css/style_2.css">
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <!-- Navigation content if any -->
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" 
                                 type="file" id="avatar" name="avatar" 
                                 src="${account.avatar != null ? 'img/service/' + account.avatar : 'http://bootdey.com/img/Content/avatar/avatar1.png'}" alt="Ảnh đại diện">
                            <small class="text-danger" id="AvatarError"></small>
                            <!--                            <div class="small font-italic text-muted mb-4">JPG hoặc PNG không > 5 MB</div>-->
                            <!--                            Tải ảnh lên
                                                        <input class="form-control mb-2" type="file" id="avatar" name="avatar">-->
                        </div>
                    </div>
                </div>

                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Thông tin tài khoản</div>
                        <div class="card-body">
                            <form id="editForm" action="updatecusprofile" method="post"enctype="multipart/form-data">
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (full name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="fullname">Họ và tên</label>
                                        <input class="form-control" id="fullname" name="fullname" value="${customer.fullName}" oninput="validateFullName(this)">
                                        <small class="text-danger" id="fullNameError"></small>
                                    </div>
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="phone">Số điện thoại</label>
                                        <input class="form-control" id="phone" name="phone" value="${account.phone}" readonly>
                                    </div>
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (email address)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="email">Email</label>
                                        <input class="form-control" id="email" name="email" value="${account.email}" oninput="validateEmail(this)">
                                        <small class="text-danger" id="emailError"></small>
                                    </div>
                                    <!-- Form Group (gender)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="gender">Giới tính</label>
                                        <input class="form-control" id="gender" name="gender" value="${account.gender ? 'Male' : 'Female'}" readonly>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <button class="btn btn-primary" type="button" id="update">Cập nhập thông tin</button>
                    <button class="btn btn-primary d-none" type="submit" id="save">Lưu</button>
                    <button class="btn btn-primary" type="button" onclick="changePassword(${customer.customerId})">Cập nhập mật khẩu</button> 
                    <br><br>
                    <a href="home" class="btn btn-secondary custom-spacing">Quay lại</a>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                // Edit button click event
                $('#update').click(function () {
                    // Enable form inputs for editing
                    $('#avatar ').prop('readonly', false);
                    $('#fullname').prop('readonly', false);
                    $('#email').prop('disabled', false);

                    // Show save button and hide edit button
                    $('#update').addClass('d-none');
                    $('#save').removeClass('d-none');
                });

                // Form submit event
                $('#editForm').submit(function (event) {
                    // Prevent default form submission
                    event.preventDefault();

                    var formData = new FormData(this); // Create FormData object
                    // Submit form using AJAX
                    $.ajax({
                        type: 'POST',
                        url: 'updatecusprofile', // Ensure this URL matches your servlet mapping
                        data: formData,
                        processData: false, // Prevent jQuery from automatically transforming the data into a query string
                        contentType: false, // Prevent jQuery from setting the content type
                        success: function (response) {
                            // Redirect to profile page after successful update
                            window.location.href = 'cusprofile';
                        },
                        error: function () {
                            // Handle error if any
                            alert('Có lỗi khi cập nhật hồ sơ. Vui lòng thử lại.');
                        }
                    });
                });
            });

            function validateFullName(input) {
                var regex = /^(?!\s*$)(?:[A-Za-zÀ-ỹà-ỹ]+(?:\s+[A-Za-zÀ-ỹà-ỹ]+){1,})$/;
                if (!regex.test(input.value)) {
                    document.getElementById('fullNameError').textContent = 'Họ và tên chỉ có chữ cái, tối thiểu 2 chữ, và có thể có dấu.';
                    input.setCustomValidity('Họ Tên không hợp lệ.');
                } else {
                    document.getElementById('fullNameError').textContent = '';
                    input.setCustomValidity('');
                }
            }

            function validateEmail(input) {
                var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!regex.test(input.value)) {
                    document.getElementById('emailError').textContent = 'Email phải có dạng như example@gmail.com.';
                    input.setCustomValidity('Địa chỉ email không hợp lệ.');
                } else {
                    document.getElementById('emailError').textContent = '';
                    input.setCustomValidity('');
                }
            }
            function validateAvatar(input) {
                var regex = /PG hoặc PNG không > 5 MB/;
                if (!regex.test(input.value)) {
                    document.getElementById('avatarError').textContent = 'PG hoặc PNG không > 5 MB';
                    input.setCustomValidity('Ảnh không hợp lệ.');
                } else {
                    document.getElementById('avatarError').textContent = '';
                    input.setCustomValidity('');
                }
            }

            function changePassword(customerId) {
                window.location.href = 'changepassw?customerId=' + customerId;
            }
        </script>
    </body>
</html>
