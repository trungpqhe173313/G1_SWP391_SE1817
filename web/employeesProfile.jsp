<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <jsp:include page="sidebar.jsp"></jsp:include>

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
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= request.getAttribute("employee").getFullName() %></span>
                                <img class="img-profile rounded-circle" src="img/<%= request.getAttribute("employee").getAvatar() %>">
                            </a>
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
                        <div class="col-lg-6">
                            <h2 class="mb-4">Employee Information</h2>
                            <form>
                                <div class="form-group row">
                                    <label for="fullName" class="col-sm-4 col-form-label">Full Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="fullName" readonly value= "${employee.fullName}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="phone" class="col-sm-4 col-form-label">Phone</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="phone" readonly value= "${employee.phone}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="email" class="col-sm-4 col-form-label">Email</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="email" readonly value= "${account.email}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="roleId" class="col-sm-4 col-form-label">Role ID</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="roleId" readonly value= "${account.roleId}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-sm-4 col-form-label">Gender</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="gender" readonly value= "${account.gender}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="avatar" class="col-sm-4 col-form-label">Avatar</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control-plaintext" id="avatar" readonly value= "${account.avatar}" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 text-right">
                                        <button type="button" class="btn btn-primary" id="editButton">Edit</button>
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

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
</body>
</html>
