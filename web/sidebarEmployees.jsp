<%-- 
    Document   : sidebarEmployees
    Created on : Jun 20, 2024, 1:20:40 AM
    Author     : ducth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" style="background-color: #2E59D9;" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Haircare</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="employeesprofile">
            <i class="fas fa-fw fa-user"></i>
            <span>Thông Tin Cá Nhân</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="orderinfoemployee">
            <i class="fas fa-fw fa-briefcase"></i>
            <span>Công Việc</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="historyorder">
            <i class="fas fa-fw fa-briefcase"></i>
            <span>Lịch Sử Công Việc</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="sendleaverequest">
            <i class="fas fa-fw fa-calendar-alt"></i>
            <span>Đơn xin nghỉ phép</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="logout">
            <i class="fas fa-fw fa-sign-out-alt"></i>
            <span>Đăng xuất</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->
