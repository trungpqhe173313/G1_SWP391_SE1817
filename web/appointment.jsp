<%-- 
    Document   : appointment
    Created on : May 28, 2024, 11:29:01 PM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <style>
            .error-message {
                color: red;
                font-size: 18px;
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

            .button-group .btn {
                flex: 1; /* Đảm bảo các nút có cùng kích thước */
                text-align: center; /* Căn giữa nội dung nút */
                padding: 10px 20px; /* Đảm bảo kích thước nút đồng đều */
            }
            .button-group {
                width: 100px; /* Thiết lập chiều rộng cố định */
                padding: 70px 80px; /* Đảm bảo kích thước nút đồng đều */
                text-align: center; /* Căn giữa nội dung nút */
                display: inline-block; /* Đảm bảo các nút có cùng kiểu hiển thị */
            }

            .btn {
                display: inline-block;
                font-weight: 400;
                color: #212529;
                text-align: center;
                vertical-align: middle;
                user-select: none;
                background-color: transparent;
                border: 1px solid transparent;
                padding: 0.375rem 0.75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: 0.25rem;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .btn-primary {
                color: #fff;
                background-color: #007bff;
                border-color: #007bff;
            }

        </style>
        <script>
            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(email);
            }

            function validatePhone(phone) {
                const re = /^\d{10}$/;
                return re.test(phone);
            }

            function validateForm() {
                const name = document.getElementById('appointment_name').value;
                const email = document.getElementById('appointment_email').value;
                const phone = document.getElementById('phone').value;

                const emailInput = document.getElementById('appointment_email');
                const phoneInput = document.getElementById('phone');

                let isValid = true;

                if (!validateEmail(email)) {
                    document.getElementById('email_error_message').innerText = 'Please enter a valid email address.';
                    emailInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('email_error_message').innerText = '';
                    emailInput.classList.remove('is-invalid');
                }

                if (!validatePhone(phone)) {
                    document.getElementById('phone_error_message').innerText = 'Please enter a valid 10-digit phone number.';
                    phoneInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    document.getElementById('phone_error_message').innerText = '';
                    phoneInput.classList.remove('is-invalid');
                }

                return isValid;
            }
        </script>
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
                            <h2 class="mb-4">Appointment</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                        </div>
                    </div>
                    <h3 class="vr">Call Us: 012-3456-7890</h3>
                    <div class="row justify-content-center">
                        <div class="col-md-10 ftco-animate">
                        <c:if test="${sessionScope.account != null}">
                            <c:set value="${sessionScope.account}" var="a"/>
                            <form action="GetAppointment" method="post" class="appointment-form" onsubmit="return validateForm()">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control" id="appointment_name" placeholder="Name" value="${a.getFullName()}" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input type="text" name="email" class="form-control" id="appointment_email" placeholder="Email" value="${a.getEmail()}" readonly="">
                                            <span id="email_error_message" class="error-message"></span>
                                        </div>
                                    </div>
                                    <input type="text" value="${o.getId()}" name="oid" hidden="">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                                <select name="date" id="" class="form-control">
                                                    <c:forEach items="${listDate}" var="date">
                                                        <option ${(date == o.getOrderDate())?"selected = \"selected\"":""} value="${date}">${date}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                <select name="shifts" id="" class="form-control">
                                                    <c:forEach items="${listShift}" var="shifts">
                                                        <option value="${shifts.getId()}"${(shifts.getId() == o.getShiftsID())?"selected = \"selected\"":""} >${shifts.getStartTime()}-${shifts.getEndTime()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="select-wrap">
                                                <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                <select name="barber" id="" class="form-control">
                                                    <c:forEach items="${listBarber}" var="baber">
                                                        <option ${(baber.getId() == o.getEmployeeId())?"selected = \"selected\"":""} value="${baber.getId()}">${baber.getFullName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input type="text" name="phone" class="form-control" id="phone" placeholder="Phone" value="${a.getPhone()}" readonly="">
                                            <span id="phone_error_message" class="error-message"></span>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <h2 class="mb-4">Update Services</h2>
                                        <div class="form-group">
                                            <ul class="list-group">
                                                <c:forEach items="${listServices}" var="service" varStatus="status">
                                                    <li class="list-group-item form-control">
                                                        <div class="custom-control custom-checkbox" style="display: flex; align-items: center; width: 100%;">
                                                            <input class="custom-control-input" name="selectedServices" 
                                                                   type="checkbox" id="selectedService${service.getId()}" value="${service.getId()}"
                                                                   <c:if test="${selectedServiceIds.contains(service.getId())}">
                                                                       checked="checked"
                                                                   </c:if>>
                                                            <label class="cursor-pointer d-block custom-control-label" 
                                                                   for="selectedService${service.getId()}" style="flex-grow: 1;">
                                                                <span class="service-name">${service.getName()}</span>
                                                            </label>
                                                            <span class="service-price">${service.getPrice()}K</span>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>        
                                </div>
                                <div class="form-group">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: left;">
                                                <button type="submit" class="btn btn-primary button-group">Update</button>
                                            </td>
                                            <td style="text-align: right;">
                                                <a href="CancelAppointment" class="btn btn-primary button-group">Cancel</a>
                                            </td>
                                        </tr>
                                    </table>
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

    </body>
</html>
