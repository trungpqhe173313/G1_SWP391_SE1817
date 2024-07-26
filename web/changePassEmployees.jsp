<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Change Password</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for input fields -->
    <style>
        .form-control {
            width: 100%;
            max-width: 400px;
        }
        .text-danger {
            color: blue;
            background-color: white;
            width: 50%; /* Adjust the width as needed */
            margin: 10px auto; /* Center the message and add some vertical spacing */
            padding: 10px; /* Add padding for better readability */
            text-align: center;
            border-radius: 10px; /* Make the corners rounded */
            border: 1px solid red; /* Red border for error messages */
        }
        .success-message {
            color: green; /* Green text color */
            background-color: white; /* White background */
            border: 2px solid green; /* Green border */
            width: 50%; /* Adjust the width as needed */
            margin: 10px auto; /* Center the message and add some vertical spacing */
            padding: 10px; /* Add padding for better readability */
            text-align: center; /* Center the text */
            border-radius: 10px; /* Make the corners rounded */
        }
        .back-button {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        .form-submit-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .form-submit-container button {
            padding: 10px 20px;
            border-radius: 5px;
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
                            <h2 class="mb-4">Đổi Mật Khẩu</h2>
                            <c:if test="${sessionScope.account != null}">
                                <form action="changepassemployees" method="post" id="changePassForm">
                                    <div class="form-group row">
                                        <label for="oldpassword" class="col-sm-4 col-form-label">Mật Khẩu Cũ</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="oldpassword" name="oldpassword" value="${oldpassword}" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="password" class="col-sm-4 col-form-label">Mật Khẩu Mới</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="password" name="password" value="${password}" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="confirmPassword" class="col-sm-4 col-form-label">Xác Nhận Mật Khẩu Mới</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" value="${confirmPassword}">
                                        </div>
                                    </div>

                                    <div class="form-submit-container">
                                        <button type="submit" id="submitButton" class="btn btn-primary">
                                            Lưu Mật Khẩu
                                            <span id="loader"></span>
                                        </button>
                                    </div>

                                    <c:if test="${not empty message}">
                                        <c:choose>
                                            <c:when test="${message eq 'Đổi mật khẩu thành công.'}">
                                                <p class="success-message">${message}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-danger">${message}</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </form>
                                <a href="employeesprofile" class="back-button">Quay Lại</a>
                            </c:if>
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

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

    <!-- Loading spinner script -->
    <script>
        $(document).ready(function () {
            $('#changePassForm').submit(function () {
                $('#submitButton').prop('disabled', true);
                $('#loader').show();
            });
        });
    </script>
</body>
</html>
