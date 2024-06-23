<%-- 
    Document   : managerOrder
    Created on : Jun 22, 2024, 1:30:06 PM
    Author     : phamt
--%>


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
        <title>SB Admin 2 - Dashboard</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.css"/>
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            .modal {
                display: none; /* Ẩn modal ban đầu */
                position: fixed; /* Ở vị trí cố định */
                z-index: 1; /* Hiển thị phía trên cùng */
                left: 0;
                top: 0;
                width: 100%; /* Chiếm toàn bộ chiều rộng màn hình */
                height: 100%; /* Chiếm toàn bộ chiều cao màn hình */
                overflow: auto; /* Bật cuộn nếu cần thiết */
                background-color: rgb(0,0,0); /* Màu nền */
                background-color: rgba(0,0,0,0.4); /* Màu nền đen mờ */
            }
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% từ phía trên và căn giữa */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Chiều rộng của modal */
                max-width: 500px;
                border-radius: 5px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input, .form-group select, .select2-container {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            .form-group button {
                padding: 10px 15px;
                background-color: #28a745;
                border: none;
                color: white;
                cursor: pointer;
                border-radius: 5px;
            }

            .btn-remove-all {
                margin-top: 10px;
                padding: 5px 10px;
                background-color: #dc3545;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                            <!-- Sidebar Toggle (Topbar) -->
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>

                            <!-- Topbar Search -->
                            <form
                                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                <li class="nav-item dropdown no-arrow d-sm-none">
                                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-search fa-fw"></i>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                         aria-labelledby="searchDropdown" style="background-color: #bf925b; border-color: #bf925b">
                                        <form class="form-inline mr-auto w-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small"
                                                       placeholder="Search for..." aria-label="Search"
                                                       aria-describedby="basic-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </li>

                                <!-- Nav Item - Alerts -->


                                <div class="topbar-divider d-none d-sm-block"></div>
                                <!<!--info acc -->
                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                        <img class="img-profile rounded-circle"
                                             src="img/undraw_profile.svg">
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                         aria-labelledby="userDropdown">
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
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->

                        <div class="container-fluid">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Lịch hẹn</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-3">
                                            <label for="statusFilter">Trạng thái</label>
                                            <select class="form-control" id="statusFilter" name="statusFilter" onchange="filterTable()">
                                                <option value="">Tất cả</option>
                                            <c:forEach items="${status}" var="s">
                                                <option value="${s.id}">${s.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="dateFilter">Ngày</label>
                                        <input type="date" class="form-control" id="dateFilter" name="dateFilter" onchange="filterTable()">
                                    </div>
                                </div>

                                <div class="table-responsive mt-3">
                                    <table class="table table-bordered" id="allTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã lịch hẹn</th>
                                                <th>Thợ cắt</th>
                                                <th>Tên khách hàng</th>
                                                <th>Số điện thoại</th>
                                                <th>Ngày cắt</th>
                                                <th>Thời gian bắt đầu</th>
                                                <th>Trạng thái</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${orders}" var="o">
                                                <tr>
                                                    <td>${o.id}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${o.employeeId == 0}">
                                                                Trống
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${ListEmployee}" var="e">
                                                                    <c:if test="${o.employeeId == e.employeeId}">
                                                                        ${e.fullName}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:forEach items="${ListCustomer}" var="ls">
                                                            <c:if test="${o.customerId == ls.customerId}">
                                                                ${ls.fullName}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:forEach items="${ListCustomer}" var="ls">
                                                            <c:if test="${o.customerId == ls.customerId}">
                                                                ${ls.phone}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>${o.orderDate}</td>
                                                    <td>
                                                        <c:forEach items="${shift}" var="s">
                                                            <c:if test="${o.shiftsID == s.id}">
                                                                ${s.startTime}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td data-status-id="${o.statusId}">
                                                        <c:forEach items="${status}" var="s">
                                                            <c:if test="${o.statusId == s.id}">
                                                                ${s.name}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <a href="viewOrderDetatailUpdate?Oid=${o.id}" class='btn btn-info'>Info</a>
                                                        <button class='btn btn-danger'>Cancel</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.container-fluid -->
                    </div>
                    <!-- End of Main Content -->
                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Your Website 2021</span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>


        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
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
        <script src="vendor/chart.js/Chart.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>

                                            $(document).ready(function () {
                                                $('#allTable').DataTable();
                                            });
                                            function filterTable() {
                                                var statusFilter = $("#statusFilter").val(); // Sử dụng jQuery để lấy giá trị của trạng thái
                                                var dateFilter = $("#dateFilter").val(); // Sử dụng jQuery để lấy giá trị của ngày
                                                console.log(statusFilter);
                                                console.log(dateFilter);
                                                $("#allTable tbody tr").each(function () {
                                                    var statusCell = $(this).find("td:eq(6)").data("status-id"); // Cột trạng thái là cột thứ 7 (0-indexed)
                                                    console.log("Row ID:", $(this).find("td:eq(0)").text(), "Status ID:", statusCell, "filter ", statusFilter); // In ra ID dòng và Status ID để kiểm tra
                                                });

                                                $("#allTable tbody tr").each(function () {
                                                    var showRow = true;
                                                    var statusCell = $(this).find("td:eq(6)").data("status-id"); // Cột trạng thái là cột thứ 7 (0-indexed)
                                                    var dateCell = $(this).find("td:eq(4)").text(); // Cột ngày là cột thứ 5 (0-indexed)

                                                    if (statusFilter && statusCell !== parseInt(statusFilter)) {
                                                        console.log(statusCell);
                                                        showRow = false;
                                                    }
                                                    if (dateFilter && dateCell !== dateFilter) {
                                                        showRow = false;
                                                    }
                                                    $(this).toggle(showRow); // Hiển thị hoặc ẩn dòng tùy thuộc vào kết quả lọc
                                                    if (showRow) {
                                                        $(this).show();
                                                    } else {
                                                        $(this).hide();
                                                    }
                                                });
                                            }
        </script>
    </body>
</html>