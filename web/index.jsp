<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            #totalMoney{
                color: green;
                font-size: 1.3rem;
                font-weight: 600;

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
        <!--bieu do hinh vong-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Dịch vụ', 'Số lượt sử dụng'],
            <c:forEach items="${mapServices.entrySet()}" var="entry">
                    ['${entry.getKey()}', ${entry.getValue()}],
            </c:forEach>
                ]);

                var options = {
                    title: 'Thống kê số lượt sử dụng',
                    pieHole: 0.4,
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
            }
        </script>
        <!--bieu do cot-->
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawStuff);

            function drawStuff() {
                var data = new google.visualization.arrayToDataTable([
                    ['Tháng', 'Phần trăm'],
            <c:forEach items="${mapRevenue.entrySet()}" var="entry">
                    ["${entry.getKey()}", ${entry.getValue()}],
            </c:forEach>
                ]);

                var options = {
                    width: 450,
                    legend: {position: 'none'},
                    axes: {
                        x: {
                            0: {side: 'top', label: 'Tháng'} // Top x-axis.
                        }
                    },
                    bar: {groupWidth: "90%"}
                };

                var chart = new google.charts.Bar(document.getElementById('top_x_div'));
                // Convert the Classic options to Material options.
                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
            ;
        </script>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <!-- Custom styles for this page -->
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

                            <!-- Topbar Search -->
                        <jsp:include page="checkin.jsp"></jsp:include>



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
                            <jsp:include page="navadmin.jsp"></jsp:include>

                            </ul>

                        </nav>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid" style="margin-bottom: 20px;">

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Thống Kê Doanh Số</h1>
                                <span class="select-fixff" >
                                    Tháng
                                    <select id="monthSelect" name="month" onchange="onMonthChange(this)" style="width: 5rem;
                                            padding: 4px; border: 2px solid #636363;
                                            border-radius: 5px">
                                    <c:forEach items="${listMonthRevenue}" var="m">
                                        <option value="${m}" ${m == monthSelect ? 'selected' : ''}>${m}</option>
                                    </c:forEach>
                                </select>
                            </span>

                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Doanh Thu (Theo Tháng)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <fmt:formatNumber value="${rm}" type="number" pattern="###,###">

                                                    </fmt:formatNumber><sup>đ</sup>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Doanh Thu (Theo Năm)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <fmt:formatNumber value="${ry}" type="number" pattern="###,###">

                                                    </fmt:formatNumber><sup>đ</sup>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                    Tổng Số Đơn(Theo Tháng)
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${nom}</div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Đơn Hàng (Theo tháng)</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="exportrevenuetoexcel?month=${monthSelect}">Xuất doanh thu sang file Excel</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="table-responsive" style="height: auto; width: auto; font-size: 1.1rem">
                                            <div class="card-body" style="height: 100%; width: 100%;">
                                                <form id="filterForm" class="row mb-3" action="filterrevenuetable" method="POST" onsubmit="return validateForm()">
                                                    <div class="col-md-3">
                                                        <label for="startdate">Từ ngày</label>
                                                        <input type="date" class="form-control" id="startdate" value="${startdate}" name="startdate">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label for="enddate">Đến ngày</label>
                                                        <input type="date" class="form-control" id="enddate" value="${enddate}" name="enddate">
                                                    </div>
                                                    <div class="col-md-2" style="align-items: end; display: flex;">
                                                        <input type="hidden" id="hiddenMonth" name="month">
                                                        <input type="submit" class="form-control mr-3" style="width: 100px; color: white; background-color:#4E73DF; border: none;" value="Lọc đơn">
                                                        <input type="button" class="form-control" style="width: 100px; color: white;
                                                               background-color:#4E73DF; border: none;" value="Làm mới" onclick="window.location.href = 'getrevenuebymonth?month=${monthSelect}';">
                                                    </div>
                                                </form>
                                                <div class="table-responsive" style="height: 100%; overflow-x: hidden;">
                                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center; table-layout: auto;">
                                                        <thead>
                                                            <tr>
                                                                <th>Đơn Hàng</th>
                                                                <th>Tên Khách Hàng</th>
                                                                <th>SĐT</th>
                                                                <th>Ngày Đặt Lịch</th>
                                                                <th>Tổng Thanh Toán</th>
                                                                <th>Trạng Thái</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listOrder}" var="o">
                                                                <tr>
                                                                    <td>${o.getOrder().id}</td>
                                                                    <td>
                                                                        <div class="d-flex align-items-center">
                                                                            <a href="#">${o.getCustomer().getFullName()}</a>
                                                                        </div>
                                                                    </td>
                                                                    <td>${o.getCustomer().phone}</td>
                                                                    <td>${o.getOrder().orderDate}</td>
                                                                    <td id="totalMoney">
                                                                        <fmt:formatNumber value="${o.getOrder().totalAmount}" type="number" pattern="###,###">

                                                                        </fmt:formatNumber><sup>đ</sup>
                                                                    </td>
                                                                    <td>${o.getStatus().name}</td>
                                                                    <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" class="more">Details</a></td>
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

                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4" style="height: 40rem; max-height: 500px; width: 40rem;max-width:500px;">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Thống kê dịch vụ trong tháng ${monthSelect}</h6>

                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body" id="donutchart" style="width: 100%; height: 100%;" >
                                    </div>
                                </div>
                                <div class="card shadow mb-4" style="height: 40rem; max-height: 500px; width: 40rem;max-width:500px;">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Thống kê doanh thu</h6>

                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body" id="top_x_div" style="width: 100%; height: 100%;" >
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


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
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>


    <!-- Page level custom scripts -->
    <script>
                                                                   function onMonthChange(selectElement) {
                                                                       var selectedMonth = selectElement.value;
                                                                       window.location.href = 'getrevenuebymonth?month=' + selectedMonth;
                                                                   }
                                                                   $(document).ready(function () {
                                                                       $('#dataTable').DataTable();
                                                                   });
                                                                   function validateForm() {
                                                                       const month = document.querySelector('#monthSelect').value;
                                                                       const startdate = document.querySelector('#startdate').value;
                                                                       const enddate = document.querySelector('#enddate').value;

                                                                       if (!month || !startdate || !enddate) {
                                                                           alert('Vui lòng điền đầy đủ thông tin.');
                                                                           return false;
                                                                       }

                                                                       if (new Date(startdate) > new Date(enddate)) {
                                                                           alert('Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu.');
                                                                           return false;
                                                                       }

                                                                       document.querySelector('#hiddenMonth').value = month;

                                                                       return true;
                                                                   }
    </script>

</body>

</html>