<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Employee Profile</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for input fields -->
    <style>
        .form-control-plaintext {
            border: none;
            background-color: transparent;
        }
        .form-control-plaintext[readonly] {
            cursor: default;
        }
        .d-none {
            display: none;
        }
        .avatar-container {
            width: 100px; /* Adjust the width as needed */
            height: 100px; /* Adjust the height as needed */
            border-radius: 50%; /* Makes the image circular */
            overflow: hidden; /* Ensures image doesn't overflow the container */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .avatar-container img {
            width: 100%; /* Makes sure the image fills the container */
            height: auto; /* Maintain aspect ratio */
            object-fit: cover; /* Cover the container area */
        }
    </style>
</head>
<body id="page-top">
    <div id="wrapper">
        <!-- Include sidebar -->
        <jsp:include page="sidebarEmployees.jsp"></jsp:include>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>

                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="mb-4">Thông Tin Cá Nhân</h2>
                            <form id="editForm" action="updateemployeesprofile" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="row">
                                    <div class="col-md-3 text-center">
                                        <div class="avatar-container">
                                            <img src="img/service/${accountDetails.avatar}" alt="Avatar" class="img-fluid" id="currentAvatar">
                                        </div>
                                        <input type="hidden" name="currentAvatar" value="${accountDetails.avatar}">
                                        <div class="form-group row d-none" id="avatarUploadSection">
                                            <label for="avatar" class="col-sm-12 col-form-label">Chọn Ảnh Đại Diện</label>
                                            <div class="col-sm-12">
                                                <input type="file" class="form-control-file" id="avatar" name="avatar" onchange="previewAvatar(event)">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <!-- Rest of the form fields -->
                                        <div class="form-group row">
                                            <label for="fullName" class="col-sm-4 col-form-label">Họ Tên</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="fullName" name="fullName" readonly value="${employeeDetails.fullName}" maxlength="50" required/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="phone" class="col-sm-4 col-form-label">Số Điện Thoại</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="phone" name="phone" readonly value="${accountDetails.phone}" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-4 col-form-label">Email</label>
                                            <div class="col-sm-8">
                                                <input type="email" class="form-control" id="email" name="email" readonly value="${accountDetails.email}" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="roleId" class="col-sm-4 col-form-label">Chức Vụ</label>
                                            <div class="col-sm-8">
                                                <c:choose>
                                                    <c:when test="${accountDetails.roleId == 2}">
                                                        <input type="text" class="form-control" id="roleId" name="roleId" readonly value="Nhân Viên" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" id="roleId" name="roleId" readonly value="Unknown" />
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="gender" class="col-sm-4 col-form-label">Giới Tính</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="gender" name="gender" readonly value="<c:out value="${accountDetails.gender ? 'Nam' : 'Nữ'}"/>" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-12 text-right">
                                                <button type="button" class="btn btn-primary" id="editButton">Chỉnh Sửa</button>
                                                <button type="submit" class="btn btn-success d-none" id="saveButton">Lưu</button>
                                                <a href="changepassemployees" class="btn btn-info ml-2">Đổi mật khẩu</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Custom scripts for this page-->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="js/demo/datatables-demo.js"></script>

    <script>
        document.getElementById('editButton').addEventListener('click', function() {
            document.getElementById('avatarUploadSection').classList.remove('d-none');
            document.getElementById('saveButton').classList.remove('d-none');
            document.getElementById('editButton').classList.add('d-none');
            document.getElementById('fullName').removeAttribute('readonly');
            document.getElementById('email').removeAttribute('readonly');
        });

        function previewAvatar(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('currentAvatar');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        function validateForm() {
            var fullName = document.getElementById('fullName').value;
            var email = document.getElementById('email').value;

        var fullName = document.getElementById("fullName").value;
        if (!/^[\p{L}\s]+$/u.test(fullName)) {
            alert("Họ và Tên chỉ được chứa các chữ cái và khoảng trắng.");
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

            return true;
        }
    </script>
</body>
</html>
