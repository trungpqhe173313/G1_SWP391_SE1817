<%-- 
    Document   : index
    Created on : May 26, 2024, 1:31:11 AM
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
                            <form id="checkInForm" action="checkIn" 
                                  class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" onsubmit="return validatePhoneNumber()">
                                <div class="input-group">
                                    <input type="tel" class="form-control bg-light border-0 small" placeholder="Nhập số điện thoại"
                                           aria-label="Phone Number" aria-describedby="basic-addon2" name="phoneNumber" id="phoneNumber" 
                                           pattern="(0|\+84)[3|5|7|8|9][0-9]{8}" inputmode="numeric" required>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit">
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

                            <!-- Page Heading -->
<!--                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

                            </div>-->

                            <!-- Content Row -->
                            <div class="row">

                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                        Earnings (Monthly)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-success shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                        Earnings (Annual)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        Thợ rảnh</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${numberBarberFree}</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->

                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Lịch hẹn</h6>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="upcoming-tab" data-toggle="tab" href="#upcoming" role="tab"
                                               aria-controls="upcoming" aria-selected="true">Lịch hẹn sắp tới</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all"
                                               aria-selected="false">Tất cả lịch hẹn</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="cancelled-tab" data-toggle="tab" href="#cancelled" role="tab"
                                               aria-controls="cancelled" aria-selected="false">Lịch hẹn đã hủy</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="upcoming" role="tabpanel" aria-labelledby="upcoming-tab">
                                            <div class="table-responsive mt-3">
                                                <table class="table table-bordered" id="upcomingTable" width="100%" cellspacing="0">
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
                                                    <c:forEach items="${upcomingOrder}" var="uOder">
                                                        <tr>
                                                            <td>${uOder.codeOrder}</td>
                                                            <c:forEach items="${ListEmployee}" var="e">
                                                                <c:if test="${uOder.employeeId == e.employeeId}">
                                                                    <td>${e.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${uOder.employeeId == 0}">
                                                                <td>Trống</td>
                                                            </c:if>
                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${uOder.customerId == ls.customerId}">
                                                                    <td>${ls.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>

                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${uOder.customerId == ls.customerId}">
                                                                    <td>${ls.phone}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>${uOder.orderDate}</td>
                                                            <td>${uOder.shift.startTime}</td>
                                                            <c:forEach items="${status}" var="s">
                                                                <c:if test="${uOder.statusId == s.id}">
                                                                    <td>${s.name}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>
                                                                <button class='btn btn-info'>Info</button>
                                                                <button class='btn btn-danger'>Cancel</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="all" role="tabpanel" aria-labelledby="all-tab">
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
                                                            <td>${o.codeOrder}</td>
                                                            <c:forEach items="${ListEmployee}" var="e">
                                                                <c:if test="${o.employeeId == e.employeeId}">
                                                                    <td>${e.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${o.employeeId == 0}">
                                                                <td>Trống</td>
                                                            </c:if>
                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${o.customerId == ls.customerId}">
                                                                    <td>${ls.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>

                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${o.customerId == ls.customerId}">
                                                                    <td>${ls.phone}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>${o.orderDate}</td>
                                                            <td>${o.shift.startTime}</td>
                                                            <c:forEach items="${status}" var="s">
                                                                <c:if test="${o.statusId == s.id}">
                                                                    <td>${s.name}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>
                                                                <button class='btn btn-info'>Info</button>
                                                                <button class='btn btn-danger'>Cancel</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="cancelled" role="tabpanel" aria-labelledby="cancelled-tab">
                                        <div class="table-responsive mt-3">
                                            <table class="table table-bordered" id="cancelledTable" width="100%" cellspacing="0">
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
                                                    <c:forEach items="${cancelOrder}" var="co">
                                                        <tr>
                                                            <td>${co.codeOrder}</td>
                                                            <c:forEach items="${ListEmployee}" var="e">
                                                                <c:if test="${co.employeeId == e.employeeId}">
                                                                    <td>${e.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${co.employeeId == 0}">
                                                                <td>Trống</td>
                                                            </c:if>
                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${co.customerId == ls.customerId}">
                                                                    <td>${ls.fullName}</td>
                                                                </c:if>
                                                            </c:forEach>

                                                            <c:forEach items="${ListCustomer}" var="ls">
                                                                <c:if test="${co.customerId == ls.customerId}">
                                                                    <td>${ls.phone}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>${co.orderDate}</td>
                                                            <td>${co.shift.startTime}</td>
                                                            <c:forEach items="${status}" var="s">
                                                                <c:if test="${co.statusId == s.id}">
                                                                    <td>${s.name}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>
                                                                <button class='btn btn-info'>Info</button>
                                                                <button class='btn btn-danger'>Cancel</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
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
                                          $('#upcomingTable').DataTable();
                                          $('#allTable').DataTable();
                                          $('#cancelledTable').DataTable();

                                          $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                                              var target = $(e.target).attr("href"); // get activated tab
                                              if (target === "#all") {
                                                  $('#allTable').DataTable().ajax.reload(); // reload data for allTable
                                              } else if (target === "#upcoming") {
                                                  $('#upcomingTable').DataTable().ajax.reload(); // reload data for upcomingTable
                                              } else if (target === "#cancelled") {
                                                  $('#cancelledTable').DataTable().ajax.reload(); // reload data for cancelledTable
                                              }
                                          });
                                      });
                                      function validatePhoneNumber() {
                                          const phoneInput = document.getElementById('phoneNumber').value;
                                          const phonePattern = /^(0|\+84)[3|5|7|8|9][0-9]{8}$/;

                                          if (!phonePattern.test(phoneInput)) {
                                              alert('Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại di động Việt Nam hợp lệ.');
                                              return false; // Ngăn không cho form submit
                                          }
                                          return true; // Cho phép form submit
                                      }
        </script>
    </body>

</html>
