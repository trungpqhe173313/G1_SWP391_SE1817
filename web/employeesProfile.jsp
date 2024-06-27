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
                            <h2 class="mb-4">Employee Information</h2>
                            <form id="editForm" action="updateemployeesprofile" method="post">
                                <div class="row">
                                    <div class="col-md-3 text-center">
                                        <img src="img/avatar.jpg" class="img-fluid rounded-circle mb-4" alt="Avatar">
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-group row">
                                            <label for="fullName" class="col-sm-4 col-form-label">Họ Tên</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="fullName" name="fullName" readonly value="${employeeDetails.fullName}" maxlength="50" required
                                                pattern="[A-Za-zÀ-ỹ ]{2,}" oninput="validateFullName(this)" />
                                                <small class="text-danger" id="fullNameError"></small>
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
                                                    <c:when test="${accountDetails.roleId == 1}">
                                                        <input type="text" class="form-control" id="roleId" name="roleId" readonly value="Admin" />
                                                    </c:when>
                                                    <c:when test="${accountDetails.roleId == 2}">
                                                        <input type="text" class="form-control" id="roleId" name="roleId" readonly value="Nhân Viên" />
                                                    </c:when>
                                                    <c:when test="${accountDetails.roleId == 3}">
                                                        <input type="text" class="form-control" id="roleId" name="roleId" readonly value="Khách Hàng" />
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
                    <a class="btn btn-primary" href="#">Logout</a>
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

<script>
    $(document).ready(function() {
        // Edit button click event
        $('#editButton').click(function() {
            // Enable all form inputs for editing
            $('#fullName').prop('readonly', false).addClass('form-control');
            $('#phone').prop('readonly', true).addClass('form-control');
            $('#email').prop('readonly', false).addClass('form-control');
            $('#roleId').prop('readonly', true).addClass('form-control');
            $('#gender').prop('readonly', true).addClass('form-control');

            // Show save button and hide edit button
            $('#editButton').addClass('d-none');
            $('#saveButton').removeClass('d-none');
        });

        // Form submit event
        $('#editForm').submit(function(event) {
            // Prevent default form submission
            event.preventDefault();

            // Submit form using AJAX
            $.ajax({
                type: 'POST',
                url: 'updateemployeesprofile', // Your Servlet URL
                data: $('#editForm').serialize(), // Serialize form data
                success: function(response) {
                    // Redirect to employeesProfile.jsp after successful update
                    window.location.href = 'employeesprofile';
                },
                error: function() {
                    // Handle error if any
                    alert('Error updating profile. Please try again.');
                }
            });
        });
    });

    function validateFullName(input) {
        // Regular expression to match alphabetic characters and spaces
        var regex = /^[A-Za-zÀ-ỹ][A-Za-zÀ-ỹ ]*$/;
        
        // Check if input matches the pattern
        if (!regex.test(input.value)) {
            document.getElementById('fullNameError').textContent = 'Họ Tên chỉ được nhập chữ cái và khoảng trắng, ít nhất 2 ký tự.';
            input.setCustomValidity('Họ Tên không hợp lệ.');
        } else {
            document.getElementById('fullNameError').textContent = '';
            input.setCustomValidity('');
        }
    }
</script>
</body>
</html>
