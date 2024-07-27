<%-- 
    Document   : viewStoreStatus
    Created on : Jul 14, 2024, 12:54:11 AM
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
            .selectdate {
                padding: 0.6rem 0.9rem;
                margin-top: 1rem;
            }
            .selectdate label {
                font-size: 1.4rem;
            }
            .selectdate input {
                padding: 0.4rem;
                border-radius: 5px;
            }
            .form {
                margin-top: 1rem;
                height: 100%;
            }
            .button {
                grid-column: 1 / -1;
                display: flex;
                justify-content: center;
                margin-top: 1rem;
                margin-bottom: 1rem;
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
            .error-message {
                color: red;
                font-size: 1.4rem;
                text-align: center;
                margin-top: 60px;
            }
        </style>
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
                        <div class="container-fluid" style="width: 100%; max-width: 2600px; margin-bottom: 20px; margin-top: 4rem;">
                            <!-- Page Heading -->
                            <div class="d-flex justify-content-center">
                                <div class="row justify-content-around" style="width: 1700px;">
                                    <!-- Earnings (Monthly) Card Example -->
                                    <div class="col-lg-6">
                                        <div class="card mb-4 shadow" >
                                            <img src="https://th.bing.com/th/id/OIP.Lcgm0noK_E2vZNrGKuisDgHaEu?w=830&h=530&rs=1&pid=ImgDetMain"
                                                 alt="avatar" class="fixed-size-img"
                                                 style="width: 100%; height: 100%;" class="fixed-size-img">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Content Row -->

                        <div class="row justify-content-center" >
                            <!-- Area Chart -->
                            <div class="col-lg-5">
                                <div class="card shadow mb-4" class="justify-content-center" style="text-align: center;">
                                    <h3 style="margin-top: 1rem; color: #0062cc;
                                        font-weight: 700;">Đặt lịch nghỉ cho cửa hàng</h3>
                                    <!-- Card Header - Dropdown -->
                                    <form class="form" action="storeholidayschedule" method="post">
                                        <div class="selectdate">
                                            <label>Ngày bắt đầu</label>
                                            <input type="date" id="startdate" value="${startDate}" name="startdate"/>
                                        </div>
                                        <div class="selectdate">
                                            <label>Ngày kết thúc</label>
                                            <input type="date" id="enddate" value="${endDate}" name="enddate" />
                                        </div>
                                        <div style="padding: 1rem 0.4rem;
                                             margin: 0.5rem 0;">
                                            <label style="font-size: 1.4rem; display: block;">Trạng thái cửa hàng hiện tại: </label>
                                            <input type="text" value="${store.isActive == true ? 'Hoạt động':'Tạm nghỉ'}" readonly style="padding: 0.4rem;
                                               border-radius: 5px;
                                               text-align: center;
                                               font-size: 1.4rem;
                                               color: #0062cc;
                                               font-weight: 700">
                                    </div>
                                    <div style="font-size: 1.4rem;">
                                        <c:if test="${check != null}">
                                            Shop đang được đặt lịch nghỉ từ ngày 
                                            <span style="color: #0062cc; font-weight: 700;">${store.startDate}</span> đến ngày 
                                            <span style="color: #0062cc; font-weight: 700;">${store.endDate}</span>
                                        </c:if>
                                    </div>
                                    <div class="error-message" id="error-message">${mss}</div>
                                    <div class="button">
                                        <button type="submit">Đặt Lịch</button>
                                        <a href="cancelstoreholidayschedule" style="margin-left: 1.3rem;">
                                            <button type="button">Hủy Lịch</button>
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Pie Chart -->
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
            // Disable past dates
            window.onload = function () {
                var today = new Date().toISOString().split('T')[0];
                document.getElementById("startdate").setAttribute('min', today);
                document.getElementById("enddate").setAttribute('min', today);
            };
        </script>
    </body>

</html>
