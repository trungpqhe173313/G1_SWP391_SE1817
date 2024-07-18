<%-- 
    Document   : viewSaleDetail
    Created on : Jun 16, 2024, 5:30:08 PM
    Author     : xdrag
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
        <style>
            #totalMoney {
                color: green;
                font-size: 1rem;
                font-weight: 600;
            }

            .fixed-size-img {
                object-fit: cover;
                /* Giữ tỷ lệ hình ảnh và lấp đầy khung */
            }
            #nameTopBarber {
                font-family: Arial, Helvetica, sans-serif;
                background: linear-gradient(210deg, #ed213a, #2A52C4);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                font-weight: 850;
                font-size: 2.0rem;
            }
            #services{
                border: 2px solid #AAAAAA;
                border-radius: 4px;
                padding: 0px 2px;
                text-wrap: nowrap;
                font-size: 1rem;
                font-weight: 700;
                color: #3D63D2;
            }
            .table span {
                color: #155BDA;
                font-size: 0.8rem;
                font-weight: 550;
                border: 2px solid #A8AAC5;
                border-radius: 5px;
                background-color: #FFF;
                padding: 0px 2px;
                margin: 4px;
                text-wrap: nowrap;
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
                padding-bottom: 90px; /* Add padding to the bottom to prevent content being hidden by the footer */
            }
        </style>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->

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
                                         aria-labelledby="searchDropdown">
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

                                <div class="topbar-divider d-none d-sm-block"></div>

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                        <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
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
                        <div class="container-fluid" style="width: 100%; max-width: 2600px;
                             margin-bottom: 20px;">
                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Doanh Thu Trong Tháng</h1>
                                <span class="select-fixff" >
                                    Tháng
                                    <select name="month" onchange="onMonthChange(this)" style="width: 5rem;
                                            padding: 4px; border: 2px solid #636363;
                                            border-radius: 5px">
                                    <c:forEach items="${listMonthRevenue}" var="m">
                                        <option value="${m}" ${m == monthSelect ? 'selected' : ''}>${m}</option>
                                    </c:forEach>
                                </select>
                            </span>
                        </div>

                        <!-- Content Row -->
                        <div class="d-flex justify-content-center">
                            <div class="d-flex flex-column align-items-center" style="width: 100%; height: 100%;">
                                <!-- Earnings (Monthly) Card Example -->

                                <div class="card mb-4 shadow container" style="border-radius: 5px; max-width: 600px;">

                                    <div class="card-body text-center row">
                                        <div class="col-md-4">
                                            <img src="${top1.getAvatar()}"
                                                 alt="avatar" class="fixed-size-img border rounded-circle"
                                                 style="width: 7rem; height: 7rem;">
                                        </div>

                                        <div class="col-md-8">
                                            <input type="hidden" id="employeeId" value="${vs.getEmployee().getEmployeeId()}">
                                            <p class="my-3" id="nameTopBarber" style="margin-top: -20px; font-size: 1.5rem;">${vs.getEmployee().getFullName()}</p>
                                            <p class="text-muted mb-1" style="font-size: 1.1rem; font-weight: 700;">${vs.getEmployee().getPhone()}</p>
                                            <p class="text-muted mb-4" style="font-size: 1.3rem; font-weight: 700;">Lương Ước Tính: 
                                                <span style="color: green; font-weight: 800;">${vs.getSalary()}đ</span></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card shadow mb-4 col-md-8" style="max-width: 1550px;">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Đơn Hàng</h6>

                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="table-responsive" style="width: 100%">

                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style=" text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th>Đơn Hàng</th>
                                                        <th>Tên Khách Hàng</th>
                                                        <th>SĐT</th>
                                                        <th>Dịch Vụ</th>
                                                        <th>Ngày Đặt Lịch</th>
                                                        <th>Tổng Thanh Toán</th>
                                                        <th>Trạng Thái</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody style="max-height: 430px; overflow-y: scroll;">
                                                    <c:forEach items="${listOrder}" var="o">

                                                        <tr>
                                                            <td>${o.getOrder().id}</td>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <a href="#">${o.getCustomer().getFullName()}</a>
                                                                </div>
                                                            </td>
                                                            <td>${o.getCustomer().phone}</td>
                                                            <td>
                                                                <c:forEach items="${o.getServices()}" var="s">
                                                                    <span>${s.getName()}</span>
                                                                </c:forEach>
                                                            </td>
                                                            <td>${o.getOrder().orderDate}</td>
                                                            <td id="totalMoney">${o.getOrder().totalAmount}đ</td>
                                                            <td>${o.getStatus().name}</td>
                                                            <td><a href="viewsaleorder?orderId=${o.getOrder().id}&month=${monthSelect}" 
                                                                   class="more">Details</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- Content Row -->


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
                            <a class="btn btn-primary" href="login.html">Logout</a>
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
            <!-- Page level plugins -->
            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
            <script>
                                        $(document).ready(function () {
                                            $('#dataTable').DataTable();
                                        });
                                        function onMonthChange(selectElement) {
                                            var selectedMonth = selectElement.value;
                                            var employeeId = document.getElementById('employeeId').value;
                                            // If using a data attribute:
                                            // var employeeId = selectElement.getAttribute('data-employee-id');

                                            window.location.href = 'viewsaledetail?employeeId=' + employeeId + '&month=' + selectedMonth;
                                        }

            </script>
    </body>

</html>