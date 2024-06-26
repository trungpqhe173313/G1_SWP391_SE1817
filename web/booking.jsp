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
            .form-group span {
                border: #bf925b solid 2px;
                border-radius: 5px;
                color: #563b4c !important;
                font-size: 17px;
                margin: 5px;
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

            <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg-1.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                        <div class="col-md-9 ftco-animate pb-5 text-center">
                            <h2 class="mb-0 bread">Booking</h2>
                            <p class="breadcrumbs"><span class="mr-2"><a href="homepage.jsp">Home <i class="ion-ios-arrow-round-forward"></i></a></span> <span>Booking</span></p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="ftco-section ftco-booking bg-light">
                <div class="container ftco-relative">
                    <div class="row justify-content-center pb-3">
                        <div class="col-md-10 heading-section text-center ftco-animate">
                            <span class="subheading">Booking</span>
                            <h2 class="mb-4">Make an Appointment</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                        </div>
                    </div>
                    <h3 class="vr">Call Us: 012-3456-7890</h3>
                    <div class="row justify-content-center">
                        <div class="col-md-10 ftco-animate">
                        <c:if test="${sessionScope.account != null}">
                            <c:set value="${sessionScope.account}" var="a"/>
                            <form action="appointment" method="post" class="appointment-form" onsubmit="return validateForm()">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h5 class="mb-4">Chọn dịch vụ</h5>
                                        <div class="form-group">
                                            <c:if test="${sessionScope.services == null}">
                                                <a href="servicesbooking" class="form-control text-center d-flex align-items-center justify-content-start" style="height: 100px;">
                                                    <span class="bi bi-scissors mr-2"></span>
                                                    <span>Chọn dịch vụ</span>
                                                    <span class="bi bi-chevron-right icon-chevron"></span>
                                                </a>
                                            </c:if>
                                            <c:if test="${sessionScope.services != null}">
                                                <a href="servicesbooking" class="form-control text-center d-flex align-items-center justify-content-start" style="height: 100px;">
                                                    <span class="bi bi-scissors mr-2"></span>
                                                    <span>Bạn đã chọn ${sessionScope.services.getQuantityServices()} dịch vụ</span>
                                                    <span class="bi bi-chevron-right icon-chevron"></span>
                                                </a>
                                                <c:forEach items="${sessionScope.services.getListServices()}" var="s">
                                                    <span class="service-name">${s.getName()}</span>

                                                </c:forEach>
                                                <div style="font-size: 19px; color: #19692c">Tổng số tiền cần thanh toán: ${sessionScope.services.getTotalMoney()}K</div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <h5 class="mb-4">Chọn ngày, giờ & barber</h5>
                                        <div id="appointment-fields">
                                            <c:if test="${sessionScope.services == null}">

                                                <input type="text" id="please-select-service" 
                                                       value="Vui lòng chọn dịch vụ trước" readonly class="form-control">
                                            </c:if>
                                            <c:if test="${sessionScope.services != null}">
                                                <div id="appointment-details" >
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <div class="select-wrap">
                                                                <div class="icon"><span style="border: none;" class="ion-ios-arrow-down"></span></div>
                                                                <select name="date" id="date" class="form-control">
                                                                    <c:forEach items="${listDate}" var="date">
                                                                        <option value="${date}"  ${date == sessionScope.time.getDate() ? 'selected' : ''}>${date}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <div class="form-group">
                                                            <div class="select-wrap">
                                                                <div class="icon"><span style="border: none;" class="ion-ios-arrow-down"></span></div>
                                                                <select name="shifts" id="shifts" class="form-control" >
                                                                    <c:forEach items="${sessionScope.time.getShift()}" var="shifts">
                                                                        <option value="${shifts.getId()}">
                                                                            ${shifts.getStartTime()}</option>
                                                                        </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                                <div class="error-message" id="error-message"></div>
                                <div class="form-group">
                                    <input type="submit" value="Make an Appointment" class="btn btn-primary">
                                </div>
                            </form>

                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <form action="login" class="appointment-form">
                                <div class="form-group">
                                    <input type="submit" value="Make an Appointment" class="btn btn-primary">
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
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Information</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">FAQs</a></li>
                                <li><a href="#" class="py-2 d-block">Privacy</a></li>
                                <li><a href="#" class="py-2 d-block">Terms Condition</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Home</a></li>
                                <li><a href="#" class="py-2 d-block">About</a></li>
                                <li><a href="#" class="py-2 d-block">Services</a></li>
                                <li><a href="#" class="py-2 d-block">Work</a></li>
                                <li><a href="#" class="py-2 d-block">Blog</a></li>
                                <li><a href="#" class="py-2 d-block">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
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
                                function validateForm() {
                                    // Check if services are selected
                                    var servicesSelected = ${sessionScope.services != null ? true : false};
                                    if (!servicesSelected) {
                                        document.getElementById("error-message").innerText = "Vui lòng chọn dịch vụ.";
                                        return false;
                                    }

                                    // Check if date is selected
                                    var date = document.getElementById("date").value;
                                    if (date === "") {
                                        document.getElementById("error-message").innerText = "Vui lòng chọn ngày.";
                                        return false;
                                    }

                                    // Check if shifts are selected
                                    var shifts = document.getElementById("shifts").value;
                                    if (shifts === "") {
                                        document.getElementById("error-message").innerText = "Vui lòng chọn ca làm việc.";
                                        return false;
                                    }

                                    return true; // All validations passed
                                }
                                $(document).ready(function () {
                                    // Khi người dùng thay đổi ngày
                                    $('#date').change(function () {
                                        var selectedDate = $(this).val();

                                        // Gửi yêu cầu AJAX để lấy danh sách ca làm việc mới
                                        $.ajax({
                                            url: 'fetchshifts', // Đường dẫn tới Servlet của bạn để lấy danh sách ca làm việc
                                            method: 'GET',
                                            data: {date: selectedDate},
                                            success: function (response) {
                                                // Xóa các option cũ trong dropdown shifts
                                                $('#shifts').empty();

                                                // Thêm các option mới từ response vào dropdown shifts
                                                $.each(response, function (index, shift) {
                                                    $('#shifts').append('<option value="' + shift.id + '">' + shift.startTime + '</option>');
                                                });
                                            },
                                            error: function (error) {
                                                console.log('Error fetching shifts:', error);
                                            }
                                        });
                                    });
                                });
        </script>


    </body>
</html>
