<%-- 
    Document   : viewSaleDetail
    Created on : Jun 16, 2024, 5:30:08 PM
    Author     : xdrag
--%>

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
                font-size: 1.3rem;
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
                font-size: 2.8rem;
            }
            #services{
                border: 2px solid #AAAAAA;
                border-radius: 4px;
                padding: 0px 2px;
                text-wrap: nowrap;
                font-size: 1.2rem;
                font-weight: 700;
                color: #3D63D2;
            }
        </style>
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Components</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item" href="buttons.html">Buttons</a>
                            <a class="collapse-item" href="cards.html">Cards</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Utilities</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Utilities:</h6>
                            <a class="collapse-item" href="utilities-color.html">Colors</a>
                            <a class="collapse-item" href="utilities-border.html">Borders</a>
                            <a class="collapse-item" href="utilities-animation.html">Animations</a>
                            <a class="collapse-item" href="utilities-other.html">Other</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="login.html">Login</a>
                            <a class="collapse-item" href="register.html">Register</a>
                            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="404.html">404 Page</a>
                            <a class="collapse-item" href="blank.html">Blank Page</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tables</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>



            </ul>
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
                    <div class="container-fluid" style="width: 100%; max-width: 2600px;">
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Doanh Thu Trong Tháng</h1>
                        </div>

                        <!-- Content Row -->
                        <div class="d-flex justify-content-center">
                            <div class="row justify-content-around" style="width: 1600px;">
                                <!-- Earnings (Monthly) Card Example -->

                                <div class="col-lg-6">
                                    <div class="card mb-4 shadow" style="border-radius: 10px;;
                                         ">
                                        <div class="card-body text-center">
                                            <img src="https://static.tintuc.com.vn/images/ver3/2022/08/10/1660106455288-1660102460808-kha-banh-234.jpg"
                                                 alt="avatar" class="fixed-size-img border rounded-circle"
                                                 style="width: 15rem; height: 17rem;">
                                            <div style="background-image: url('\img\Screenshot 2024-06-16 114728.png');
                                                 background-size: cover; background-position: center;
                                                 border-radius: 5px;">
                                                <h5 class="my-3" id="nameTopBarber" style="margin-top: -20px;">John Smith</h5>
                                                <p class="text-muted mb-1" style="font-size: 1.5rem;
                                                   font-weight: 700;">0398521155</p>
                                                <p class="text-muted mb-4" style="font-size: 1.8rem;
                                                   font-weight: 700;">Lương Ước Tính: <span style="color: green; font-weight: 800;">500K</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- Content Row -->

                        <div class="row justify-content-center">
                            <!-- Area Chart -->
                            <div class="col-lg-12">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Đơn Hàng</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Sắp Xếp Theo Ngày</a>
                                                <a class="dropdown-item" href="#">Sắp xếp Theo Giá Trị</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="table-responsive" style="max-height: 500px; overflow-y: scroll;">
                                            <table class="table table-striped custom-table"
                                                   style="font-size: 1.1rem; font-weight: 600;
                                                   text-align: center;">
                                                <thead>
                                                    <tr>

                                                        <th scope="col">Đơn Hàng</th>
                                                        <th scope="col">Tên Khách Hàng</th>
                                                        <th scope="col">SĐT</th>
                                                        <th scope="col">Dịch Vụ</th>
                                                        <th scope="col">Ngày Đặt Lịch</th>
                                                        <th scope="col">Tổng Thanh Toán</th>
                                                        <th scope="col">Trạng Thái</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                    <tr scope="row">
                                                        <td>20</td>
                                                        <td style="color: #3D63D2;
                                                            font-size: 1.2rem;">
                                                            James Yates
                                                        </td>
                                                        <td>+63 983 0962 971</td>
                                                        <td>
                                                            <span id="services">sfsdfsdf</span>
                                                            <span id="services">sfsdfsdfiouiou</span>
                                                            <span id="services">sfsdf</span>
                                                            <span id="services">sfsd453656</span>
                                                            <span id="services">sfsdfsôi</span>
                                                        <td>2024-06-15</td>
                                                        <td id="totalMoney">200K</td>
                                                        <td>Hoàn Thành</td>
                                                        <td><a href="#" class="more">Details</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
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

    </body>

</html>