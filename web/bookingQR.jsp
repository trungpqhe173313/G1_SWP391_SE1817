<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <style>
            .error-message {
                color: red;
                font-size: 18px;
                text-align: center;
                margin-top: 10px;
            }
            .is-invalid {
                border-color: red;
            }
            .services-checkboxes {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .checkbox-item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .checkbox-item input[type="checkbox"] {
                margin-right: 5px;
            }
            .list-group-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .service-name {
                flex-grow: 1;
                border: #bf925b solid 2px;
                border-radius: 5px;
                color: #563b4c !important;
                font-size: 17px;
                margin: 5px;
                padding: 0 0.5rem;
                white-space: nowrap;
            }
            .service-price {
                white-space: nowrap;
                margin-left: 10px;
            }
            .appointment-form .form-group a {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                background: transparent !important;
                color: #563b4c !important;
                font-size: 16px;
                padding: 0 20px !important;
                height: 60px !important;
                border: none;
                border: 2px solid #bf925b;
                font-weight: 500;
                margin-bottom: 30px;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                -ms-border-radius: 5px;
                border-radius: 5px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: relative;
            }
            .form-group a span {
                border: none;
            }

            .form-group .icon-chevron {
                position: absolute;
                right: 20px;
            }
            /* Đảm bảo thẻ span có thể xuống dòng khi nội dung dài */
            .service-name span {
                display: inline-block;
                white-space: nowrap; /* Ngăn không cho văn bản xuống dòng tự động */
                word-wrap: break-word; /* Tự động ngắt dòng nếu cần */
            }
        </style>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Barlow+Condensed:500,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css">


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
        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->

            <section class="hero-wrap hero-wrap-2" style="background-color: #010101; max-height: 90px;" data-stellar-background-ratio="0.5">
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
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg></div>

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
