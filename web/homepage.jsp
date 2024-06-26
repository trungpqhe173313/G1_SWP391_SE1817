

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
        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->
            <section class="hero-wrap js-fullheight" style="background-image: url(images/bg-2.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
                        <div class="col-lg-12 ftco-animate d-flex align-items-center">
                            <div class="text text-center">
                                <span class="subheading">Welcome to Haircare</span>
                                <h1 class="mb-4">We are professional care for your hair</h1>
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
                                <h3>For Men</h3>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 text-center d-flex align-items-stretch">
                        <div class="text-about py-5 px-4">
                            <h1 class="logo">
                                <a href="#"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a>
                            </h1>
                            <h2>Welcome to our Salon</h2>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>

                        </div>
                    </div>
                    <div class="col-md text-center d-flex align-items-stretch">
                        <div class="services-wrap d-flex align-items-center img" style="background-image: url(images/forwomen.jpg);">
                            <div class="text">
                                <h3>For Women</h3>

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
                        <span class="subheading">Services</span>
                        <h2 class="mb-4">Services Menu</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
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
                    <span class="subheading">Booking</span>
                    <h2 class="mb-4">Make an Appointment</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>
            <h3 class="vr">Call Us: 012-3456-7890</h3>
            <div class="row justify-content-center">
                <div class="col-md-10 ftco-animate">
                    <form action="appointment" class="appointment-form">
                        <div class="form-group">
                            <input type="submit" value="Make an Appointment" class="btn btn-primary">
                        </div>
                    </form>


                </div>
            </div>
        </div>
    </section>


    <section class="ftco-section ftco-team">
        <div class="container-fluid px-md-5">
            <div class="row justify-content-center pb-3">
                <div class="col-md-10 heading-section text-center ftco-animate">
                    <h2 class="mb-4">Barber</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ftco-animate">
                    <div class="carousel-team owl-carousel">
                        <div class="item">
                            <a href="#" class="team text-center">
                                <div class="img" style="background-image: url(images/stylist-1.jpg);"></div>
                                <h2>Danica Lewis</h2>
                                <span class="position">Hair Stylist</span>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="team text-center">
                                <div class="img" style="background-image: url(images/stylist-2.jpg);"></div>
                                <h2>Nicole Simon</h2>
                                <span class="position">Nail Master</span>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="team text-center">
                                <div class="img" style="background-image: url(images/stylist-3.jpg);"></div>
                                <h2>Cloe Meyer</h2>
                                <span class="position">Director</span>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="team text-center">
                                <div class="img" style="background-image: url(images/stylist-4.jpg);"></div>
                                <h2>Rachel Clinton</h2>
                                <span class="position">Hair Stylist</span>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="team text-center">
                                <div class="img" style="background-image: url(images/stylist-5.jpg);"></div>
                                <h2>Dave Buff</h2>
                                <span class="position">Barber</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
        <div class="container">
            <div class="row no-gutters justify-content-center mb-5 pb-2">
                <div class="col-md-6 text-center heading-section ftco-animate">
                    <span class="subheading">Gallery</span>
                    <h2 class="mb-4">Our gallery</h2>
                    <p>Separated they live in. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                </div>
            </div>
        </div>
        <div class="container-fluid p-0">
            <div class="row no-gutters">
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-1.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Stylist</span>
                            <h3><a href="project.jsp">Beard</a></h3>
                        </div>
                        <a href="images/work-1.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-2.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Haircut</a></h3>
                        </div>
                        <a href="images/work-2.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-3.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Hairstylist</a></h3>
                        </div>
                        <a href="images/work-3.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-4.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Haircut</a></h3>
                        </div>
                        <a href="images/work-4.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-5.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Makeup</a></h3>
                        </div>
                        <a href="images/work-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-6.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Fashion</span>
                            <h3><a href="project.jsp">Model</a></h3>
                        </div>
                        <a href="images/work-6.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-7.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Makeup</a></h3>
                        </div>
                        <a href="images/work-7.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="project">
                        <img src="images/work-8.jpg" class="img-fluid" alt="Colorlib Template">
                        <div class="text">
                            <span>Beauty</span>
                            <h3><a href="project.jsp">Makeup</a></h3>
                        </div>
                        <a href="images/work-8.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
                            <span class="icon-expand"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
    </section>

  <!--  <section class="testimony-section bg-light">
        <div class="container">
            <div class="row ftco-animate justify-content-center">
                <div class="col-md-6 col-lg-5 d-flex">
                    <div class="testimony-img" style="background-image: url(images/testimony-img.jpg);"></div>
                </div>
                <div class="col-md-6 col-lg-7 py-5 pl-md-5">
                    <div class="py-md-5">
                        <div class="heading-section ftco-animate">
                            <span class="subheading">Testimony</span>
                            <h2 class="mb-0">Happy Customer</h2>
                        </div>
                        <div class="carousel-testimony owl-carousel ftco-animate">
                            <c:forEach var="feedback" items="${feedbackList}">
                                <div class="item">
                                    <div class="testimony-wrap pb-4">
                                        <div class="text">
                                            <p class="mb-4">${feedback.noidung}</p>
                                        </div>
                                        <div class="d-flex">
                                            <div class="user-img" style="background-image: url(${feedback.customer.avatar})"></div>
                                            <div class="pos ml-3">
                                                <p class="name">${feedback.customer.fullName}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach> -->
<!--                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/stylist-1.jpg)">
                                        </div>
                                        <div class="pos ml-3">
                                            <p class="name">Jeff Nucci</p>
                                            <span class="position">Businessman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/stylist-2.jpg)">
                                        </div>
                                        <div class="pos ml-3">
                                            <p class="name">Jeff Nucci</p>
                                            <span class="position">Businessman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/stylist-3.jpg)">
                                        </div>
                                        <div class="pos ml-3">
                                            <p class="name">Jeff Nucci</p>
                                            <span class="position">Businessman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/stylist-4.jpg)">
                                        </div>
                                        <div class="pos ml-3">
                                            <p class="name">Jeff Nucci</p>
                                            <span class="position">Businessman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap pb-4">
                                    <div class="text">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                    </div>
                                    <div class="d-flex">
                                        <div class="user-img" style="background-image: url(images/stylist-5.jpg)">
                                        </div>
                                        <div class="pos ml-3">
                                            <p class="name">Jeff Nucci</p>
                                            <span class="position">Businessman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
 <!--                       </div>
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
                            <li><a href="viewfeedback" class="py-2 d-block">Feedback</a></li>
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
</body>
</html>
