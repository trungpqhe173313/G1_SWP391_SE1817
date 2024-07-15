<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" style="background-color: #2E59D9;" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="viewOrder">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-cut"></i> <!-- Icon của sidebar-brand, ví dụ ở đây là một icon khác để thay thế -->
        </div>
        <div class="sidebar-brand-text mx-3">Haircare</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="viewOrder">
            <i class="fas fa-tachometer-alt"></i> <!-- Icon Dashboard -->
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
            <i class="fas fa-chart-line"></i> <!-- Icon Doanh Thu -->
            <span>Doanh Thu</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="viewsale">
            <i class="fas fa-chart-line"></i> <!-- Icon Doanh Thu Nhân Viên -->
            <span>Doanh Thu Nhân Viên</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="employeesdetail">
            <i class="fas fa-user"></i> <!-- Icon Nhân Viên -->
            <span>Nhân Viên</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="workscheduleemployees">
            <i class="fas fa-user-clock"></i> <!-- Icon Nhân Viên Đang Làm -->
            <span>Nhân Viên Đang Làm</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="servicedetail">
            <i class="fas fa-hand-holding-heart"></i> <!-- Icon Dịch Vụ -->
            <span>Dịch Vụ</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="getOrderManager">
            <i class="fas fa-calendar-alt"></i> <!-- Icon Lịch hẹn -->
            <span>Lịch hẹn</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="storeholidayschedule">
            <i class="fas fa-calendar-alt"></i> <!-- Icon Lịch hẹn -->
            <span>Lịch nghỉ cửa hàng</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="viewAllBill">
            <i class="fas fa-money-check-alt"></i> <!-- Icon Thanh toán -->
            <span>Thanh toán</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="voucherdetail">
            <i class="fas fa-tags"></i> <!-- Icon Mã Giảm Giá -->
            <span>Mã Giảm Giá</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="loyaltypolicies">
            <i class="fas fa-star"></i> <!-- Icon Chính Sách Tích Điểm -->
            <span>Chính Sách Tích Điểm</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="bloglistadmin">
            <i class="fas fa-blog"></i> <!-- Icon Blog -->
            <span>Blog</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->
