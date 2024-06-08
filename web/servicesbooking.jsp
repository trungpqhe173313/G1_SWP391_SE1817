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
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="background-color: #0F0C07 !important;">
            <div class="container">
                <a class="navbar-brand" href="homepage.jsp"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a>
                <button class="navbar-toggler active" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">



                        <c:if test="${sessionScope.account==null}">
                            <li class="nav-item active"><a href="login" class="nav-link">Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account!=null}">
                            <li class="nav-item dropdown active">
                                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Hello ${sessionScope.account.getFullName()}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="cusprofile">Personal Information</a>
                                    <a class="dropdown-item" href="GetAppointment">Appointment Schedule</a>
                                    <a class="dropdown-item" href="bookingschedule">View history Booking</a>
                                </div>
                            </li>
                            <li class="nav-item"><a href="logout" class="nav-link active">Logout</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>



        <!--        <section class="hero-wrap hero-wrap-2" style="background-image: url('https://www.pagerelease.com/wp-content/uploads/2020/10/pic4444.jpg');" data-stellar-background-ratio="0.5">
                    <div class="overlay"></div>
                            <div class="container">
                                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
                                    <div class="col-md-9 ftco-animate pb-5 text-center">
                                        <h2 class="mb-0 bread">Services</h2>
                                        <p class="breadcrumbs"><span class="mr-2"><a href="homepage.jsp">Home <i class="ion-ios-arrow-round-forward"></i></a></span> <span>Services</span></p>
                                    </div>
                                </div>
                            </div>
                </section>-->





        <section class="ftco-section ftco-pricing">
            <div class="container">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-10 heading-section text-center ftco-animate">
                        <span class="subheading">Pricing</span>
                        <h2 class="mb-4">Our Prices</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 ftco-animate" >
                        <div class="pricing-entry pb-5 text-center">
                            <div >
                                <h3 class="mb-4">Hair Style</h3>
                                <img src="https://i.pinimg.com/originals/cb/04/20/cb04208f3393bdc2f5aa072f2d009ea5.jpg" width="width" height="height" alt="alt"/>
                                <p class="service-description">Professional hair styling for all occasions.</p>
                                <p class="price-fixed"><span class="price">$50.00</span></p>
                            </div>
                            <!--                            <ul>
                                                            <li>Hair Dryer</li>
                                                            <li>Hair Coloring</li>
                                                            <li>Hair Cut</li>
                                                            <li>Hair Dresser</li>
                                                            <li>Hair Spa</li>
                                                        </ul>-->
                            <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3 add-service" data-price="50" data-service="Hair Style8">Thêm dịch vụ</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate" >
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Hair Style</h3>
                                <img src="images/LuaDoHoPhan.png" 
                                     width="width" height="height" alt="alt"/>
                                <p class="service-description">Lúa đổ hố phân</p>
                                <p class="price-fixed"><span class="price">$50.00</span></p>
                            </div>
                            <!--                            <ul>
                                                            <li>Hair Dryer</li>
                                                            <li>Hair Coloring</li>
                                                            <li>Hair Cut</li>
                                                            <li>Hair Dresser</li>
                                                            <li>Hair Spa</li>
                                                        </ul>-->
                            <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3 add-service" data-price="50" data-service="Hair Style6">Thêm dịch vụ</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate" >
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Hair Style</h3>
                                <img src="images/SoiHoang.png" 
                                     width="width" height="height" alt="alt"/>
                                <p class="service-description">Sói Hoang Hư Hỏng</p>
                                <p class="price-fixed"><span class="price">$50.00</span></p>
                            </div>
                            <!--                            <ul>
                                                            <li>Hair Dryer</li>
                                                            <li>Hair Coloring</li>
                                                            <li>Hair Cut</li>
                                                            <li>Hair Dresser</li>
                                                            <li>Hair Spa</li>
                                                        </ul>-->
                            <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3 add-service" data-price="50" data-service="Hair Style5">Thêm dịch vụ</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate" >
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Hair Style</h3>
                                <img src="https://i.pinimg.com/originals/cb/04/20/cb04208f3393bdc2f5aa072f2d009ea5.jpg" width="width" height="height" alt="alt"/>
                                <p class="service-description">Professional hair styling for all occasions.fsdfsdfsdfsdfsdfsdfsdfsdf
                                    sdfsdfsdfdsfsdfsdfsd</p>
                                <p class="price-fixed"><span class="price">$50.00</span></p>
                            </div>
                            <!--                            <ul>
                                                            <li>Hair Dryer</li>
                                                            <li>Hair Coloring</li>
                                                            <li>Hair Cut</li>
                                                            <li>Hair Dresser</li>
                                                            <li>Hair Spa</li>
                                                        </ul>-->
                            <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3 add-service" data-price="50" data-service="Hair Style1">Thêm dịch vụ</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate" >
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Hair Style</h3>
                                <img src="https://i.pinimg.com/originals/cb/04/20/cb04208f3393bdc2f5aa072f2d009ea5.jpg" width="width" height="height" alt="alt"/>
                                <p class="service-description">Professional hair styling for all occasions.fsdfsdfsdfsdfsdfsdfsdfsdf
                                    sdfsdfsdfdsfsdfsdfsd</p>
                                <p class="price-fixed"><span class="price">$50.00</span></p>
                            </div>
                            <!--                            <ul>
                                                            <li>Hair Dryer</li>
                                                            <li>Hair Coloring</li>
                                                            <li>Hair Cut</li>
                                                            <li>Hair Dresser</li>
                                                            <li>Hair Spa</li>
                                                        </ul>-->
                            <p class="button text-center"><a href="#" class="btn btn-primary px-4 py-3 add-service" data-price="50" data-service="Hair Style2">Thêm dịch vụ</a></p>
                        </div>
                    </div>
                    <!-- Repeat for other services as needed -->
                </div>
            </div>
        </section>

        <div class="fixed-bottom-bar">
            <span id="service-count">0 dịch vụ</span> | <span id="total-price">$0.00</span>
            <button class="btn btn-primary" style="border-radius: 5px" onclick="done()">Xong</button>
        </div>

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
                let serviceCount = 0;
                let totalPrice = 0.00;
                const addedServices = {};

                document.querySelectorAll('.add-service').forEach(button => {
                    button.addEventListener('click', () => {
                        const service = button.getAttribute('data-service');
                        const price = parseFloat(button.getAttribute('data-price'));

                        if (addedServices[service]) {
                            // Remove service
                            delete addedServices[service];
                            serviceCount--;
                            totalPrice -= price;
                            button.textContent = 'Thêm dịch vụ';
                            button.classList.remove('btn-secondary');
                            button.classList.add('btn-primary');
                        } else {
                            // Add service
                            addedServices[service] = price;
                            serviceCount++;
                            totalPrice += price;
                            button.textContent = 'Đã thêm';
                            button.classList.remove('btn-primary');
                            button.classList.add('btn-secondary');
                        }

                        document.getElementById('service-count').innerText = serviceCount + ' dịch vụ';
                        document.getElementById('total-price').innerText = '$' + totalPrice.toFixed(2);
                    });
                });

                function done() {
                    // Redirect to booking page
                    window.location.href = 'booking.jsp';
                }
        </script>

    </body>
</html>
