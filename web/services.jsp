<%-- 
    Document   : services
    Created on : May 25, 2024, 2:55:46 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <style>
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
            .error-message {
                color: red;
                font-size: 18px;
                text-align: center;
                margin-top: 10px;
            }
            .is-invalid {
                border-color: red;
            }
        </style>
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


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>


        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->


            <link rel="stylesheet" href="css/flaticon.css">
            <link rel="stylesheet" href="css/icomoon.css">
            <link rel="stylesheet" href="css/style.css">
        </head>


        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg-1.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate pb-5 text-center">
                        <h2 class="mb-0 bread">Dịch Vụ</h2>
                        <p class="breadcrumbs"><span class="mr-2"><a href="homepage.jsp">Trang chủ <i class="ion-ios-arrow-round-forward"></i></a></span> <span>Dịch Vụ</span></p>
                    </div>
                </div>
            </div>
        </section>

        <section class="services-section ftco-section">

            <div class="container">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-10 heading-section text-center ftco-animate">
                        <span class="subheading">Dịch Vụ</span>
                        <h2 class="mb-4">Menu Dịch Vụ</h2>
                        
                    </div>
                </div>

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
        </div>

    </section>

    <section class="ftco-section ftco-booking bg-light">
        <div class="container ftco-relative">
            <div class="row justify-content-center pb-3">
                <div class="col-md-10 heading-section text-center ftco-animate">
                    <span class="subheading">Đặt lịch</span>
                    <h2 class="mb-4">Đặt lịch ngay</h2>
<!--                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>-->
                </div>
            </div>
            <h3 class="vr">Call Us: 012-3456-7890</h3>
            <div class="row justify-content-center">
                <div class="col-md-10 ftco-animate">
                    <c:if test="${sessionScope.account != null}">
                        <form action="appointment" class="appointment-form">
                            <div class="error-message" id="error-message">${mss}</div>
                            <div class="form-group">
                                <input type="submit" value="Đặt Lịch Ngay" class="btn btn-primary">
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <form action="appointmentwithoutlogin" method="get" class="appointment-form" onsubmit="return validatePhoneNumber()">
                            <div>
                                <input type="text" name="phone" id="phone" value="${inValidPhone}" class="form-control" style="width: 300px; margin: auto;">
                            </div>
                            <div class="error-message" id="error-message">${mss}</div>
                            <div class="form-group">
                                <input type="submit" value="Đặt Lịch Ngay" class="btn btn-primary">
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </section>

<!--    <section class="ftco-section ftco-pricing">
        <div class="container">
            <div class="row justify-content-center pb-3">
                <div class="col-md-10 heading-section text-center ftco-animate">
                    <span class="subheading">Pricing</span>
                    <h2 class="mb-4">Our Prices</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 ftco-animate">
                    <div class="pricing-entry pb-5 text-center">
                        <div>
                            <h3 class="mb-4">Hair Style</h3>
                            <p><span class="price">$50.00</span> <span class="per">/ session</span></p>
                        </div>
                        <ul>
                            <li>Hair Dryer</li>
                            <li>Hair Coloring</li>
                            <li>Hair Cut</li>
                            <li>Hair Dresser</li>
                            <li>Hair Spa</li>
                        </ul>
                        <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3">Get Offer</a></p>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="pricing-entry pb-5 text-center">
                        <div>
                            <h3 class="mb-4">Manicure Pedicure</h3>
                            <p><span class="price">$34.50</span> <span class="per">/ session</span></p>
                        </div>
                        <ul>
                            <li>Manicure</li>
                            <li>Pedicure</li>
                            <li>Coloring</li>
                            <li>Nails</li>
                            <li>Nail Cut</li>
                        </ul>
                        <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3">Get Offer</a></p>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="pricing-entry active pb-5 text-center">
                        <div>
                            <h3 class="mb-4">Makeup</h3>
                            <p><span class="price">$54.50</span> <span class="per">/ session</span></p>
                        </div>
                        <ul>
                            <li>Makeup</li>
                            <li>Professional Makeup</li>
                            <li>Blush On</li>
                            <li>Facial Massage</li>
                            <li>Facial Spa</li>
                        </ul>
                        <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3">Get Offer</a></p>
                    </div>
                </div>
                <div class="col-md-3 ftco-animate">
                    <div class="pricing-entry pb-5 text-center">
                        <div>
                            <h3 class="mb-4">Body Treatment</h3>
                            <p><span class="price">$89.50</span> <span class="per">/ session</span></p>
                        </div>
                        <ul>
                            <li>Massage</li>
                            <li>Spa</li>
                            <li>Foot Spa</li>
                            <li>Body Spa</li>
                            <li>Relaxing</li>
                        </ul>
                        <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3">Get Offer</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>-->


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
    <script>
                            $(document).ready(function () {
                                $('#serviceCarousel').carousel({
                                    interval: 3000
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


</body>

</html>
