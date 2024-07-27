<%-- 
    Document   : nav
    Created on : May 28, 2024, 9:02:58 PM
    Author     : phamt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="home"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="home" class="nav-link">Trang Chủ</a></li>
                <li class="nav-item"><a href="service" class="nav-link">Dịch Vụ</a></li>
                <li class="nav-item"><a href="booking" class="nav-link">Đặt Lịch</a></li>
                <li class="nav-item"><a href="about.jsp" class="nav-link">Về Chúng Tôi</a></li>
                <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
                    <c:if test="${sessionScope.account==null}">

                    <li class="nav-item"><a href="login" class="nav-link">Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account!=null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Hello ${sessionScope.account.getPhone()}
                                    
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!--                            <a class="dropdown-item" href="employeesprofile">Personal Information</a>-->
                            <a class="dropdown-item" href="cusprofile">Personal Information</a>
                            <a class="dropdown-item" href="viewAppountController">Appointment Schedule</a>
                            <a class="dropdown-item" href="viewhistorybooking">View history Booking</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
                    </c:if>
            </ul>
        </div>
    </div>
</nav>


