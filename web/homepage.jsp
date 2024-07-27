


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <style>
            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 400px; /* Adjust width */
                height: 400px; /* Adjust height to make it square */
                background-color: #D2B48C; /* Light brown color */
                border-radius: 15px; /* Rounded corners */
                z-index: 1000;
                display: none; /* Hidden by default */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow */
                overflow: hidden;
            }

            .popup-content {
                padding: 20px;
                text-align: center;
                position: relative;
                background: linear-gradient(135deg, #8B4513, #CD853F); /* Gradient background light brown */
                color: white; /* Text color */
                height: 100%; /* Ensure content fills the popup */
                display: flex;
                flex-direction: column;
                justify-content: flex-start; /* Align content to the top */
                align-items: center;
            }

            .popup-content a.navbar-brand {
                margin-top: 10px; /* Adjust margin as needed */
                position: absolute;
                top: 10px; /* Adjust top position as needed */
                left: 20px; /* Adjust left position as needed */
                text-decoration: none;
                color: white; /* Text color */
                font-size: 18px; /* Adjust font size as needed */
            }

            .popup-content strong {
                font-weight: bold; /* Make strong elements bold */
                font-size: 28px; /* Adjust font size as needed */
                font-family: Arial, sans-serif; /* Specify font family */
            }

            .popup-content h2 {
                margin: 0 0 10px;
                font-family: 'Arial', sans-serif;
                font-size: 24px;
            }

            .popup-content p {
                margin: 10px 0;
                font-family: 'Arial', sans-serif;
                font-size: 18px;
            }

            .popup-close {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
                font-size: 24px;
                color: white;
                font-weight: bold;
            }

            .popup-logo {
                width: 80px;
                height: 80px;
                margin-bottom: 15px;
            }

            /* Overlay */
            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Transparent black overlay */
                z-index: 999;
                display: none; /* Hidden by default */
            }

            .pricing-entry {
                height: 450px;
                position: relative; /* Make this container the reference for absolute positioning */
            }
            .pricing-entry img {
                width: 100%;
                height: auto;
                max-width: 250px; /* Adjust as needed */
                border-radius: 10px; /* Adjust the radius as needed */
            }
            .price-fixed {
                position: absolute;
                bottom: 30px; /* Adjust as needed */
                left: 50%;
                margin-top: 0px; /* Cách giá tiền và mô tả dịch vụ 20px */
                padding-top: 10px;
                transform: translateX(-50%);
                font-weight: bold; /* Optional: make the text bold */
            }

            .service-description {
                margin-top: 10px;
                padding-bottom: 50px;
                font-size: 14px; /* Adjust as needed */
                color: #555; /* Adjust as needed */
                overflow: hidden; /* Hide overflow */
                text-overflow: ellipsis; /* Add ellipsis for overflow text */
                display: -webkit-box; /* For multi-line ellipsis */
                -webkit-line-clamp: 3; /* Increase number of lines to show */
                -webkit-box-orient: vertical; /* Vertical box for ellipsis */
                height: 100px; /* Adjust height as needed to fit the text */
                position: absolute; /* Đặt vị trí tuyệt đối */
                bottom: 20px; /* Cách bottom 20px */
                left: 0; /* Dính vào bên trái */
                right: 0; /* Dính vào bên phải */
                margin-top: 10px; /* Khoảng cách phía trên */
                padding: 0 20px; /* Padding trái và phải để tạo khoảng cách */
                font-size: 14px; /* Kích thước font chữ */
                color: #555; /* Màu chữ */
            }

            .col-md-3 {
                padding-bottom: 50px;
            }
            .hero-wrap {
                background-size: contain; /* Adjust background size */
                background-repeat: no-repeat; /* Ensure the image doesn't repeat */
                background-position: center center; /* Center the background image */
            }
            .navbar {
                background-color: #0F0C07 !important; /* Set navbar background to black */
            }
            .fixed-bottom-bar {
                position: fixed;
                bottom: 0;
                width: 100%;
                background-color: #343a40;
                color: #fff;
                padding: 15px 0;
                text-align: center;
                box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.3);
                z-index: 1000; /* Ensure it stays above other elements */
            }
            .fixed-bottom-bar .btn {
                margin-left: 20px;
            }
            .carousel-control-prev,
            .carousel-control-next {
                width: 5%;
            }

            .carousel-control-prev-icon,
            .carousel-control-next-icon {
                background-color: black; /* Change this to your preferred color */
                padding: 20px; /* Adjust size as needed */
                border-radius: 50%;
            }

            .carousel-control-prev {
                left: -5%; /* Move the left arrow further to the left */
            }

            .carousel-control-next {
                right: -5%; /* Move the right arrow further to the right */
            }

            .carousel-inner {
                display: flex;
                align-items: center;
            }

            .carousel-indicators {
                bottom: -50px; /* Adjust this value to move the indicators further down */
            }

            .carousel-indicators li {
                background-color: black; /* Change this to your preferred color */
                width: 12px;
                height: 12px;
                border-radius: 50%;
            }

            .carousel-indicators .active {
                background-color: grey; /* Change this to your preferred active color */
            }
        </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
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
    </head>
    <body>
        <div id="popup-overlay" class="popup-overlay" onclick="closePopup()"></div>
        <div id="popup" class="popup">
            <div class="popup-content">
                <span class="popup-close" onclick="closePopup()">&times;</span>

                <a class="navbar-brand" href="home"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a> <br> <br><br>

                <p id="popup-message"></p>
            </div>
        </div>
        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->
            <section class="hero-wrap js-fullheight" style="background-image: url(images/bg-2.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
                        <div class="col-lg-12 ftco-animate d-flex align-items-center">
                            <div class="text text-center">
                                <span class="subheading">Chào mừng đến với Haircare</span>
                                <h1 class="mb-4">Dịch vụ làm tóc chuyên nghiệp</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container-fluid px-0">
                <div class="row no-gutters">
                    <div class="col-md text-center d-flex align-items-stretch">
                        <div class="services-wrap d-flex align-items-center img" style="background-image: url(images/formen.jpg);">
                            <div class="text">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center d-flex align-items-stretch">
                        <div class="text-about py-5 px-4">
                            <h1 class="logo">
                                <a href="#"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a>
                            </h1>
                            <h2>Chào mừng đến với Haircare</h2>
                            <p>Dịch Vụ Tóc Nam Chuyên Nghiệp - Tạo Dáng Độc Đáo, Phong Cách Hoàn Hảo.</p>

                        </div>
                    </div>
                    <div class="col-md text-center d-flex align-items-stretch">
                        <div class="services-wrap d-flex align-items-center img" style="background-image: url(images/Barber-performing-a-shave-service-1-scaled.jpg);">
                            <div class="text">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="services-section ftco-section">
            <div class="container">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-10 heading-section text-center ftco-animate">
                        <span class="subheading">Dịch vụ</span>
                        <h2 class="mb-4">Các dịch vụ</h2>
                        <p>Chúng tôi cung cấp dịch vụ cắt tóc, tạo kiểu và chăm sóc tóc chuyên nghiệp, giúp bạn luôn tự tin với diện mạo hoàn hảo.</p>
                    </div>
                </div>



                <!-- Carousel items -->
                <div id="serviceCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                    <c:forEach items="${listS}" var="s" varStatus="status">
                        <c:if test="${s.isActive && status.index % 4 == 0}">
                            <li data-target="#serviceCarousel" data-slide-to="${status.index / 4}" class="${status.index == 0 ? 'active' : ''}"></li>
                            </c:if>
                        </c:forEach>
                </ol>

                <!-- Carousel items -->
                <div class="carousel-inner">
                    <c:forEach items="${listS}" var="s" varStatus="status">
                        <c:if test="${s.isActive && status.index % 4 == 0}">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="row">
                                </c:if>

                                <c:if test="${s.isActive}">
                                    <div class="col-md-3 ftco-animate">
                                        <div class="pricing-entry pb-5 text-center">
                                            <div>
                                                <h3 class="mb-4">${s.name}</h3>
                                                <img src="img/service/${s.image}" width="300" height="300" alt="${s.name}"/>
                                                <p class="service-description">${s.description}</p>
                                                <p class="price-fixed">
                                                    <span class="price">
                                                        <fmt:formatNumber value="${s.price}" type="number" pattern="###,###"></fmt:formatNumber><sup>đ</sup>
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>

                                <c:if test="${status.index % 4 == 3 || status.index == fn:length(listS) - 1}">
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <!--            <div class="row no-gutters d-flex">
                            <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services d-block text-center">
                                    <div class="icon"><span class="flaticon-male-hair-of-head-and-face-shapes"></span></div>
                                    <div class="media-body">
                                        <h3 class="heading mb-3">Haircut &amp; Styling</h3>
                                        <p>A small river named Duden flows by their place and supplies.</p>
                                    </div>
                                </div>    
                            </div>
                            <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services d-block text-center">
                                    <div class="icon"><span class="flaticon-beard"></span></div>
                                    <div class="media-body">
                                        <h3 class="heading mb-3">Beard</h3>
                                        <p>A small river named Duden flows by their place and supplies.</p>
                                    </div>
                                </div>      
                            </div>
                            <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services d-block text-center">
                                    <div class="icon"><span class="flaticon-beauty-products"></span></div>
                                    <div class="media-body">
                                        <h3 class="heading mb-3">Makeup</h3>
                                        <p>A small river named Duden flows by their place and supplies.</p>
                                    </div>
                                </div>      
                            </div>
                            <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
                                <div class="media block-6 services d-block text-center">
                                    <div class="icon"><span class="flaticon-healthy-lifestyle-logo"></span></div>
                                    <div class="media-body">
                                        <h3 class="heading mb-3">Body Treatment</h3>
                                        <p>A small river named Duden flows by their place and supplies.</p>
                                    </div>
                                </div>      
                            </div>
                        </div>-->
        </div>
    </section>

    <section class="ftco-section ftco-booking bg-light">
        <div class="container ftco-relative">
            <div class="row justify-content-center pb-3">
                <div class="col-md-10 heading-section text-center ftco-animate">
                    <span class="subheading">Đặt Lịch</span>
                    <h2 class="mb-4">Tạo Cuộc Hẹn</h2>
                    <p>Đặt lịch hẹn dễ dàng ngay hôm nay để trải nghiệm dịch vụ tóc nam chất lượng cao và phong cách độc đáo!</p>
                </div>
            </div>
            <h3 class="vr">Call Us: 012-3456-7890</h3>
            <div class="row justify-content-center">
                <div class="col-md-10 ftco-animate">
                    <c:if test="${sessionScope.account != null}">
                        <form action="appointment" class="appointment-form">
                            <div class="form-group">
                                <input type="submit" value="Đặt Lịch Ngay" class="btn btn-primary">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <form action="appointmentwithoutlogin" method="get" class="appointment-form" onsubmit="return validatePhoneNumber()">
                            <div>
                                <input type="text" name="phone" placeholder="SĐT" id="phone" value="${inValidPhone}" class="form-control" style="width: 300px; margin: auto;">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Đặt Lịch Ngay" class="btn btn-primary">
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-pricing">
        <div class="container">
            <div class="row justify-content-center pb-3">
                <div class="col-md-10 heading-section text-center ftco-animate">
                    <span class="subheading">Dịch vụ nổi bật</span>
                    <h2 class="mb-4">Top Dịch Vụ</h2>
                    <p>Khám phá những dịch vụ hàng đầu của chúng tôi: Cắt tóc, tạo kiểu, và chăm sóc tóc nam chuyên nghiệp, mang đến cho bạn vẻ ngoài ấn tượng nhất!</p>
                </div>
            </div>

            <div class="row">
                <c:forEach items="${listT}" var="t" varStatus="statu" begin="0" end="3">
                    <c:if test="${t.isActive}">
                        <div class="col-md-3 ftco-animate">
                            <div class="pricing-entry pb-5 text-center">
                                <div>
                                    <h3 class="mb-4">${t.name}</h3>
                                    <img src="img/service/${t.image}" width="300" height="300" alt="${t.name}"/>
                                    <p class="service-description">${t.description}</p>
                                    <p class="price-fixed">
                                        <span class="price">
                                            <fmt:formatNumber value="${t.price}" type="number" pattern="###,###"></fmt:formatNumber><sup>đ</sup>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<section class="testimony-section bg-light">
    <div class="container">
        <div class="row ftco-animate justify-content-center">
            <div class="col-md-6 col-lg-5 d-flex">
                <div class="testimony-img" style="background-image: url(images/testimony-img.jpg);"></div>
            </div>
            <div class="col-md-6 col-lg-7 py-5 pl-md-5">
                <div class="py-md-5">
                    <div class="heading-section ftco-animate">
                        <span class="subheading">Đánh Giá</span>
                        <h2 class="mb-0">Phản hồi từ khách hàng</h2>
                    </div>
                    <div class="carousel-testimony owl-carousel ftco-animate" id="feedback-list">
                        <!-- Start of dynamic feedback loop -->
                        <c:forEach var="feedback" items="${feedbackList}">
                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">${feedback.noidung}</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/.jpg)"></div>
                                        <div class="pos ml-3">
                                            <p class="name">
                                                <c:forEach var="customer" items="${cusList}">
                                                    <c:if test="${customer.customerId == feedback.customerId}">
                                                        ${customer.fullName}
                                                    </c:if>
                                                </c:forEach>
                                            </p>
                                            <span class="position">Customer</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <a href="javascript:void(0);" class="" onclick="openFeedbackModal()">Để lại phản hồi</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Feedback Modal -->
<div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="feedbackModalLabel">Đánh giá dịch vụ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <iframe id="feedbackIframe" src="" frameborder="0" style="width: 100%; height: 500px;"></iframe>
            </div>
        </div>
    </div>
</div>

<footer class="ftco-footer ftco-section">
    <div class="container">
        <div class="row mb-5">
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2 logo">Haircare</h2>
                    <p>Chúng tôi cung cấp dịch vụ cắt tóc, tạo kiểu và chăm sóc tóc chuyên nghiệp, giúp bạn luôn tự tin với diện mạo hoàn hảo.</p>
                    <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                        <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4 ml-md-5">
                    <h2 class="ftco-heading-2">Thông Tin</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">FAQs</a></li>
                        <li><a href="#" class="py-2 d-block">Riêng tư</a></li>
                        <li><a href="#" class="py-2 d-block">Điều khoản Điều kiện</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Liên Kết</h2>
                    <ul class="list-unstyled">
                        <li><a href="home" class="py-2 d-block">Trang Chủ</a></li>
                        <li><a href="about.jsp" class="py-2 d-block">Về Chúng Tôi</a></li>
                        <li><a href="service" class="py-2 d-block">Dịch Vụ</a></li>
                        <li><a href="appointment?" class="py-2 d-block">Đặt Lịch</a></li>
                        <li><a href="blog" class="py-2 d-block">Blog</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Bạn có câu hỏi cho chúng tôi?</h2>
                    <div class="block-23 mb-3">
                        <ul>
                            <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                            <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                            <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">

                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
                        function openFeedbackModal() {
                            $('#feedbackIframe').attr('src', 'CustomerFeedback.jsp');
                            $('#feedbackModal').modal('show');
                        }

                        $(document).ready(function () {
                            $('.btnContact').click(function (e) {
                                e.preventDefault();
                                var formData = $('.contact-form form').serialize();

                                $.ajax({
                                    type: 'POST',
                                    url: 'cusfeedback',
                                    data: formData,
                                    success: function (response) {
                                        if (response.trim() === 'Phản hồi của bạn đã được gửi đi thành công! :>') {
                                            $('#feedbackModal').modal('hide');
                                            // Reload the homepage to reflect new feedback
                                            location.reload();
                                        } else {
                                            alert('Error: Không thể gửi phản hồi. Vui lòng thử lại.');
                                        }
                                    },
                                    error: function () {
                                        alert('Error: Không thể gửi phản hồi. Vui lòng thử lại.');
                                    }
                                });
                            });
                        });
                        function validatePhoneNumber() {
                            var phoneInput = document.getElementById("phone").value;
                            var phonePattern = /^(03|05|07|08|09)\d{8}$/;

                            if (!phonePattern.test(phoneInput)) {
                                alert("Vui lòng nhập số điện thoại Việt Nam hợp lệ.");
                                return false; // Ngăn không cho form submit
                            }

                            return true; // Cho phép form submit
                        }
</script>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
                        $(document).ready(function () {
                            $('#serviceCarousel').carousel({
                                interval: 3000
                            });
                        });


</script>
<script>
    // Function to format number as percentage with specified decimal places
    function formatPercentage(number, decimals) {
        return (number * 100).toFixed(decimals) + '%';
    }

    // Function to format date as dd-MM-yyyy
    function formatDate(dateString) {
        var date = new Date(dateString);
        var day = date.getDate();
        var month = date.getMonth() + 1; // Months are zero based
        var year = date.getFullYear();

        // Padding day and month with leading zeros if needed
        if (day < 10) {
            day = '0' + day;
        }
        if (month < 10) {
            month = '0' + month;
        }

        return day + '-' + month + '-' + year;
    }

    // Function to display popup and format discount
    function showPopup() {
    var vouchers = [
    <c:forEach items="${todaysVouchers}" var="voucher">
    {
    name: "${voucher.name}",
            discount: ${voucher.discount},
            startTime: "${voucher.startTime}",
            endTime: "${voucher.endTime}"
    }<c:if test="${!voucherStatus.last}">,</c:if>
    </c:forEach>
    ];
            console.log("Vouchers: ", vouchers); // Debugging line

            if (vouchers.length > 0) {
    var discountFormatted = formatPercentage(vouchers[0].discount, 0); // Format discount here
            var startDateFormatted = formatDate(vouchers[0].startTime); // Format start date
            var endDateFormatted = formatDate(vouchers[0].endTime); // Format end date

            var message = "<strong>Haircare xin thông báo</strong><br><br>Hiện nay cửa hàng đang giảm giá " + discountFormatted + " từ ngày " + startDateFormatted + " đến ngày " + endDateFormatted;
            document.getElementById('popup-message').innerHTML = message;
            document.getElementById('popup').style.display = 'block';
            document.getElementById('popup-overlay').style.display = 'block';
    } else {
    console.log("No vouchers available"); // Debugging line
    }
    }

    function closePopup() {
    document.getElementById('popup').style.display = 'none';
            document.getElementById('popup-overlay').style.display = 'none';
    }

    window.onload = showPopup;
</script>
</body>
</html>
