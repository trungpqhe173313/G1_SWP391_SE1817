<%-- 
    Document   : sidebar
    Created on : May 26, 2024, 1:26:28 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" style="background-color: #2E59D9;" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="viewOrder">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Haircare</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="viewOrder">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Addons
    </div>
    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="viewrevenue">
            <i class="fas fa-fw fa-table"></i>
            <span>Doanh Thu</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="viewsale">
            <i class="fas fa-fw fa-table"></i>
            <span>Doanh Thu Nhân Viên</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="employeesdetail">
            <i class="fas fa-fw fa-table"></i>
            <span>Nhân Viên</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="workscheduleemployees">
            <i class="fas fa-fw fa-table"></i>
            <span>Nhân Viên Đang Làm</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="servicedetail">
            <i class="fas fa-fw fa-table"></i>
            <span>Dịch Vụ</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="getOrderManager">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Lịch hẹn</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="viewAllBill">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Thanh toán</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="loyaltypolicies">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Chính Sách Tích Điểm</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

