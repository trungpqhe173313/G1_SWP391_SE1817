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
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"/>
        <style>
            .container-fluid {
                width: 80%;
                margin: auto;
                padding: 20px;
            }

            .card {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .card-header h6 {
                margin: 0;
                color: #007bff;
                font-weight: bold;
            }

            .form-group {
                margin-bottom: 15px;
                display: flex;
                align-items: center;
            }

            .form-group label {
                width: 150px;
                margin-right: 20px;
            }

            .form-group input,
            .form-group select {
                flex: 1;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .form-group .select2-container {
                flex: 1;
            }

            .form-group .select2-selection--multiple {
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
                min-height: 38px;
                display: flex;
                align-items: center;
            }

            .form-group .select2-selection__choice {
                background: #f1f1f1;
                padding: 5px 10px;
                border-radius: 4px;
                border: 1px solid #ccc;
                margin-right: 5px;
            }

            .form-group .select2-selection__choice__remove {
                color: #888;
                margin-left: 5px;
            }

            .btn {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                align-self: flex-start;
            }

            .btn:hover {
                background-color: #0056b3;
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
                                <jsp:include page="navadmin.jsp"></jsp:include>

                            </ul>

                        </nav>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Content Row -->

                            <div class="container-fluid">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Lịch hẹn</h6>
                                    </div>
                                    <form action="viewOrderDetailUpdate" method="post">
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input type="text" id="phone" name="phone" value="${infoCustumer.phone}" readonly>
                                    </div>
                                    <input type="hidden" name="Oid" value="${detailOrder.id}">
                                    <div class="form-group">
                                        <label for="services">Dịch Vụ</label>
                                        <select id="services" name="services" multiple="multiple" class="form-control select2" required>
                                            <c:forEach items="${ListServices}" var="s">
                                                <c:set var="isSelected" value="false" />
                                                <c:forEach items="${services}" var="selectedService">
                                                    <c:if test="${s.getServicesId() eq selectedService.getServicesId()}">
                                                        <c:set var="isSelected" value="true" />
                                                    </c:if>
                                                </c:forEach>
                                                <option value="${s.getServicesId()}" ${isSelected eq "true" ? 'selected="selected"' : ''}>
                                                    ${s.getName()}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Trạng thái</label>
                                        <select id="status" name="status" class="form-control">
                                            <c:forEach items="${status}" var="s">
                                                <option ${(s.id == detailOrder.statusId)?"selected = \"selected\"":""}
                                                    value="${s.id}" >${s.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="employee">Thợ</label>
                                        <c:choose>
                                            <c:when test="${0 == detailOrder.employeeId}">
                                                <c:choose>
                                                    <c:when test="${BarberFree != null}">
                                                        <input type="hidden" name="employee" value="${BarberFree.employeeId}" />
                                                        <input type="text"  value="${BarberFree.fullName}" readonly />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="hidden" name="employee" value="" />
                                                        <input type="text"  value="Không có thợ" readonly />                                                       
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${ListEmployee}" var="e">
                                                    <c:if test="${e.employeeId == detailOrder.employeeId}">
                                                        <input type="hidden" name="employee" value="${e.employeeId}" />
                                                        <input type="text"  name="employeeId" value="${e.fullName}" readonly />
                                                    </c:if>                                                
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                    <button class="btn" type="submit">Xác nhận</button>
                                </form>
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
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            $(document).ready(function () {
                // Khởi tạo Select2 với allowClear và placeholder
                $('#services').select2({
                    placeholder: "Chọn dịch vụ",
                    allowClear: true
                });
            });
        </script>
    </body>
</html>
