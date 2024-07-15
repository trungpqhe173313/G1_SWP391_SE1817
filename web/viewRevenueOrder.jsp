<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin 2 - Tables</title>
        <style>
            .wrapper {
                width: 100%;
                max-width: 700px;
                background: #FFF;
                border-radius: 10px;
                box-shadow: 0 25px 70px rgba(0, 0, 0, .05);
                overflow: hidden;
                margin: auto;
            }
            h1.title {
                padding: 15px 0;
                margin-left: 25px;
                font-weight: 700;
                color: rgb(52, 100, 231);
            }
            .form {
                width: 100%;
            }
            .myform {
                background: #F4F5F7;
                padding: 25px;
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-gap: 25px;
                width: 100%;
            }
            .myform label {
                display: block;
                color: #A8AAC5;
                font-weight: bold;
                font-size: 1.3rem;
                margin-bottom: 5px;
            }
            .control-from {
                width: 100%;
            }
            .myform input {
                border: 0;
                outline: 0;
                height: 50px;
                background: #FFF;
                width: 100%;
                border-radius: 5px;
                color: #155BDA;
                font-weight: 700;
                font-size: .9rem;
                text-indent: 15px;
                border: 2px solid rgba(112, 109, 109, 0.637);
                transition: border 250ms;
            }
            .full-width {
                grid-column: 1 / -1;
            }
            .button {
                grid-column: 1 / -1;
                display: flex;
                justify-content: center;
            }
            .button button {
                border: 0;
                outline: 0;
                width: 120px;
                height: 50px;
                border-radius: 50px;
                color: #FFF;
                font-weight: bold;
                font-size: 1.1rem;
                cursor: pointer;
                background: linear-gradient(356deg, rgb(50, 58, 173) 0%, rgb(72, 116, 235) 100%);
            }
            .button button:hover {
                background: rgb(50, 58, 173);
            }
            .myform span {
                color: #155BDA;
                font-size: 1.2rem;
                font-weight: 550;
                border: 2px solid #A8AAC5;
                border-radius: 5px;
                background-color: #FFF;
                padding: 0px 3px;
                margin: 6px;
                white-space: nowrap;
            }
            .sticky-footer {
                position: fixed;
                bottom: 0;
                width: 100%;
                background-color: #ffffff;
                padding: 1rem;
                margin-top: 20px;
            }
            .content-wrapper {
                padding-bottom: 80px; /* Add padding to the bottom to prevent content being hidden by the footer */
            }
        </style>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="content-wrapper" class="d-flex flex-column content-wrapper">
                    <div id="content">
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                            <form class="form-inline">
                                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                    <i class="fa fa-bars"></i>
                                </button>
                            </form>
                            <ul class="navbar-nav ml-auto">
                                <div class="topbar-divider d-none d-sm-block"></div>
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                        <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
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
                                        <a class="dropdown-item" href="logout">
                                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Logout
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div class="container-fluid" style="margin-bottom: 20px;">
                            <h1 class="h3 mb-2 text-gray-800">Đơn hàng ${o.getOrder().id}</h1>
                        <p class="mb-4">Cung cấp thông tin chi tiết về đơn khách hàng đã đặt</p>
                        <div class="wrapper">
                            <div class="form" style="border: 3px solid #A8AAC5;">
                                <h1 class="title">Chi Tiết Đơn Hàng</h1>
                                <div class="myform">
                                    <div class="control-from">
                                        <label for="firstname">Tên Khách Hàng: </label>
                                        <input type="text" id="firstname" value="${o.getCustomer().getFullName()}" readonly>
                                    </div>
                                    <div class="control-from">
                                        <label for="lastname">SĐT: </label>
                                        <input type="text" id="lastname" value="${o.getCustomer().getPhone()}" readonly>
                                    </div>
                                    <div class="control-from">
                                        <label for="emailaddress">Ngày Đặt: </label>
                                        <input type="text" id="emailaddress" value="${o.getOrder().getOrderDate()}" readonly>
                                    </div>
                                    <div class="control-from">
                                        <label>Ca đặt: </label>
                                        <c:forEach items="${o.getShift()}" var="shift">

                                            <span>${shift.getStartTime()}</span>
                                        </c:forEach>
                                    </div>
                                    <div class="full-width">
                                        <label for="companyname">Dịch Vụ: </label>
                                        <c:forEach items="${o.getServices()}" var="s">
                                            <span>${s.getName()}</span>
                                        </c:forEach>
                                    </div>
                                    <div class="control-from">
                                        <label for="firstname">Tên Barber: </label>
                                        <input type="text" id="firstname" value="${o.getEmployee().getFullName()}" readonly>
                                    </div>
                                    <div class="control-from">
                                        <label for="lastname">SĐT Barber: </label>
                                        <input type="text" id="lastname" value="${o.getEmployee().getPhone()}" readonly>
                                    </div>
                                    <div class="control-from">
                                        <p style="font-size: 1.7rem; font-weight: 700; color: green;">
                                            Tổng Tiền: ${o.getOrder().getTotalAmount()}đ
                                        </p>
                                    </div>
                                    <div class="control-from">
                                        <p style="font-size: 1.5rem; font-weight: 700; color: rgb(15, 129, 223);">
                                            Trạng Thái: ${o.getStatus().getName()}
                                        </p>
                                    </div>
                                    <div class="button">
                                        <a href="viewrevenue">
                                            <button>Quay Lại</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
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
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/sb-admin-2.min.js"></script>
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="js/demo/datatables-demo.js"></script>
    </body>
</html>
