<%-- 
    Document   : sidebar
    Created on : May 26, 2024, 1:26:28 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" style="background-color: #bf925b;" id="accordionSidebar">

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
        <a class="nav-link" href="tables.jsp">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="employeesdetail">
            <i class="fas fa-fw fa-table"></i>
            <span>Employees</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="servicedetail">
            <i class="fas fa-fw fa-table"></i>
            <span>Services</span></a>
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

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

