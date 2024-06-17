<%-- 
    Document   : viewappointment
    Created on : Jun 9, 2024, 1:59:36 AM
    Author     : phamt
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            .appointment-info {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .appointment-info th, .appointment-info td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        .appointment-info th {
            text-align: left;
        }
        .appointment-info td img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
        }
        .appointment-info .details-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
        }
        </style>
    </head>

    <body>
        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->


            <section class="hero-wrap js-fullheight" style="background-image: url(images/bg-2.jpg);"
                     data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
                        <div class="col-lg-12 ftco-animate d-flex align-items-center">
                            <div class="text text-center">
                                <h1 class="mb-4 mr-auto ml-auto">Tài khoảng của tôi</h1>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

            
        
        <section class="ftco-section ftco-booking bg-light">
            <div class="container ftco-relative">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-10 heading-section text-center ftco-animate">
                        <span class="subheading">Booking</span>
                        <h2 class="mb-4">Lịch hẹn</h2>
                        <p>Hi vọng bạn sẽ có trải nghiệm tuyệt vời với những dịch vụ của chúng tôi</p>
                    </div>
                </div>
                
                <div class="row justify-content-center">
                    <div class="col-md-10 ftco-animate">
                        <table class="appointment-info">
                            <tr>
                                <th>Ngày</th>
                                <th>Ca</th>
                                <th colspan="2">Dịch vụ</th>
                                
                                <th>Trạng thái</th>
                                <th>Tổng tiền</th>
                                
                                <th></th>
                            </tr>
                            <tr>
                                <td>${order.getOrderDate()}</td>
                            <c:forEach items="${shift}" var="shift"> 
                                <c:if test="${shift.getId() == order.getShiftsID()}">
                                    <td>${shift.getStartTime()}</td>
                                </c:if>
                            </c:forEach>
                            <td colspan="2">
                                <ul>
                                    <c:forEach items="${services}" var="s">
                                        <li>${s.getName()}</li>
                                        </c:forEach>
                                </ul>
                            </td>
                            
                            
                            <c:forEach items="${status}" var="status"> 
                                <c:if test="${status.getId() == order.getStatusId()}"> 
                                    <td>${status.getName()}</td>
                                </c:if>
                            </c:forEach>
                                    <td>${order.getTotalAmount()} VND</td>
                            <!--                            <td><img src="https://via.placeholder.com/40" alt="Professional Photo"></td>-->
                        </tr>
                        <td><a href="#" class="details-button">Cập nhật</a></td>
                        <td><a href="CancelAppointment?oId=${order.getId()}" class="details-button">Hủy</a></td>
                    </table>
                </div>
            </div>
        </div>
    </section>









    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00" />
        </svg></div>


    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="js/google-map.js"></script>
    <script src="js/main.js"></script>

</body>

</html>
