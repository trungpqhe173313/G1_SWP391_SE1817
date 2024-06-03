<%-- 
    Document   : services
    Created on : May 25, 2024, 2:55:46 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <h2 class="mb-0 bread">Booking Schedule</h2>
                            <p class="breadcrumbs"><span class="mr-2"><a href="homepage.jsp">Home <i class="ion-ios-arrow-round-forward"></i></a></span> <span>Booking</span></p>
                        </div>
                    </div>
                </div>
            </section>



            <section class="ftco-section ftco-booking bg-light">
                <div class="container">

                    <div class="table-responsive custom-table-responsive">

                        <table class="table custom-table">
                            <thead>
                                <tr>  
                                    <th scope="col">Order</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Services</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Barber</th>
                                    <th scope="col"> Customer Contact</th>
                                    <th scope="col"> Total Amount</th>
                                    <th scope="col">Status</th>

                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listBooking}" var="lb">

                                <tr scope="row">

                                    <td>
                                        ${lb.getOrder().id}
                                    </td>
                                    <td><a href="#">${sessionScope.account.getFullName()}</a></td>
                                    <td style="font-size: 16px; font-weight: 500;">
                                        <c:forEach items="${lb.getListServices()}" var="s">
                                            - ${s.getName()} </br>
                                        </c:forEach>
                                    </td>
                                    <td>

                                        <span style="font-size: 15px;">${lb.getShift().getStartTime()}-${lb.getShift().getEndTime()}</span>
                                        </br>
                                        <span style="font-size: 18px; font-weight: 500">${lb.getOrder().getOrderDate()}</span>
                                    </td>
                                    <td>${lb.getBarber().getFullName()}</td>
                                    <td>${sessionScope.account.getPhone()}</td>
                                    <td>${lb.getOrder().getTotalAmount()}K</td>
                                    <td>${lb.getStatus().getName()}</td>
                                </tr>
                                <tr class="spacer"><td colspan="100"></td></tr>
                                </c:forEach>


                        </tbody>
                    </table>
                </div>
                    <div class="error-message">${mss}</div>
                <div class="row justify-content-center">
                    <div class="col-md-10 ftco-animate">
                        <form action="home" class="appointment-form">
                            <div class="form-group">
                                <input type="submit" value="Back to HomePage" class="btn btn-primary">
                            </div>
                        </form>
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
