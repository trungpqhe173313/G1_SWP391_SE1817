
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
        <title>Đơn Xin Nghỉ</title>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.css" />
         <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" />

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
                            <jsp:include page="navadmin.jsp"></jsp:include>
                            </ul>
                        </nav>
                        <!-- End of Topbar -->

                        <!-- Content Row -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Đơn Xin Nghỉ</h6>
                            </div>
                            <div class="card-body">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="pending" aria-selected="true">Chờ Phê Duyệt</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="approved-tab" data-toggle="tab" href="#approved" role="tab" aria-controls="approved" aria-selected="false">Đã Phê Duyệt</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="cancelled-tab" data-toggle="tab" href="#cancelled" role="tab" aria-controls="cancelled" aria-selected="false">Đã Hủy</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="pending" role="tabpanel" aria-labelledby="pending-tab">
                                        <div class="table-responsive mt-3">
                                            <table class="table table-bordered" id="pendingTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Tên nhân viên</th>
                                                        <th>Ngày bắt đầu</th>
                                                        <th>Ngày kết thúc</th>
                                                        <th>Lý do</th>
                                                        <th>Trạng thái</th>
                                                        <th>Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${Requests}" var="request">
                                                    <tr>
                                                        <c:forEach items="${lE}" var="e">
                                                            <c:if test="${request.employeeId == e.employeeId}">
                                                                <td>${e.fullName}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>${request.startDate}</td>
                                                        <td>${request.endDate}</td>
                                                        <td>${request.reason}</td>
                                                        <c:forEach items="${stauts}" var="s">
                                                            <c:if test="${request.statusId == s.id}">
                                                                <td>${s.status}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>
                                                            <a href="yesRequest?rId=${request.requestId}" class='btn btn-info'>Đồng ý</a>
                                                            <a href="cancelleaverequest?rId=${request.requestId}" class='btn btn-danger'>Hủy</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="approved" role="tabpanel" aria-labelledby="approved-tab">
                                    <div class="table-responsive mt-3">
                                        <table class="table table-bordered" id="approvedTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Tên nhân viên</th>
                                                    <th>Ngày bắt đầu</th>
                                                    <th>Ngày kết thúc</th>
                                                    <th>Lý do</th>
                                                    <th>Trạng thái</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${aRequests}" var="request">
                                                    <tr>
                                                        <c:forEach items="${lE}" var="e">
                                                            <c:if test="${request.employeeId == e.employeeId}">
                                                                <td>${e.fullName}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>${request.startDate}</td>
                                                        <td>${request.endDate}</td>
                                                        <td>${request.reason}</td>
                                                        <c:forEach items="${stauts}" var="s">
                                                            <c:if test="${request.statusId == s.id}">
                                                                <td>${s.status}</td>
                                                            </c:if>
                                                        </c:forEach>
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
                                                    <th>Tên nhân viên</th>
                                                    <th>Ngày bắt đầu</th>
                                                    <th>Ngày kết thúc</th>
                                                    <th>Lý do</th>
                                                    <th>Trạng thái</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cRequests}" var="request">
                                                    <tr>
                                                        <c:forEach items="${lE}" var="e">
                                                            <c:if test="${request.employeeId == e.employeeId}">
                                                                <td>${e.fullName}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                        <td>${request.startDate}</td>
                                                        <td>${request.endDate}</td>
                                                        <td>${request.reason}</td>
                                                        <c:forEach items="${stauts}" var="s">
                                                            <c:if test="${request.statusId == s.id}">
                                                                <td>${s.status}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#pendingTable').DataTable();
                $('#approvedTable').DataTable();
                $('#cancelledTable').DataTable();

                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    var target = $(e.target).attr("href"); // get activated tab
                    if (target === "#pending") {
                        $('#pendingTable').DataTable().ajax.reload(); // reload data for pendingTable
                    } else if (target === "#approved") {
                        $('#approvedTable').DataTable().ajax.reload(); // reload data for approvedTable
                    } else if (target === "#cancelled") {
                        $('#cancelledTable').DataTable().ajax.reload(); // reload data for cancelledTable
                    }
                });
            });
        </script>
    </body>

</html>
