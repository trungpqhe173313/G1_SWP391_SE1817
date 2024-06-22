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
                            <div class="row justify-content-around" style="width: 100%;">
                                <!-- Earnings (Monthly) Card Example -->

                                <div class="col-md-4">
                                    <div class="card mb-4 shadow" style="border-radius: 5px;
                                         ">
                                        <div class="card-body text-center">
                                            <img src="data:image/jpeg;base64,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"
                                                 alt="avatar" class="fixed-size-img border rounded-circle"
                                                 style="width: 11rem; height: 11rem;">
                                            <div style="background-image: url('\img\Screenshot 2024-06-16 114728.png');
                                                 background-size: cover; background-position: center;
                                                 border-radius: 5px;">
                                                <!-- Hidden input to store employeeId -->
                                                <input type="hidden" id="employeeId" value="${vs.getEmployee().getEmployeeId()}">
                                                <p class="my-3" id="nameTopBarber" style="margin-top: -20px; font-size: 1.5rem; ">${vs.getEmployee().getFullName()}</p>
                                                <p class="text-muted mb-1" style="font-size: 1.1rem;
                                                   font-weight: 700;">${vs.getEmployee().getPhone()}</p>
                                                <p class="text-muted mb-4" style="font-size: 1.3rem;
                                                   font-weight: 700;">Lương Ước Tính: <span style="color: green; font-weight: 800;">${vs.getSalary()}đ</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
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
                                            <div class="table-responsive" style="max-height: 300px; overflow-y: scroll;">
                                                <table class="table table-striped custom-table"
                                                       style="font-size: 0.8rem; font-weight: 600;
                                                       text-align: center; ">
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
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
                                                                       class="more">Details</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach items="${listOrder}" var="o">

                                                            <tr scope="row">
                                                                <td>${o.getOrder().id}</td>
                                                                <td class="pl-0">
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
                                                                <td><a href="viewrevenueorder?orderId=${o.getOrder().id}" 
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
            <script>
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