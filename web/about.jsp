<%-- 
    Document   : about
    Created on : May 25, 2024, 2:54:15 AM
    Author     : phamt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h2 class="mb-0 bread">Về Chúng Tôi</h2>
                    <p class="breadcrumbs"><span class="mr-2"><a href="homepage.jsp">Trang Chủ <i class="ion-ios-arrow-round-forward"></i></a></span> <span>Về Chúng Tôi</span></p>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-no-pb ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-6 d-flex">
                    <div class="p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/bg-2.jpg);">
                        <a href="https://vimeo.com/45830194" class="icon popup-vimeo d-flex justify-content-center align-items-center">
                            <span class="icon-play"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 py-md-5 pb-5 wrap-about pb-md-5 ftco-animate">
                    <div class="heading-section mb-4 mt-md-5">
                        <span class="subheading">Về Chúng Tôi</span>
                        <h2 class="mb-4">Chào mừng đến với Haircare</h2>
                    </div>
                    <div class="pb-md-5">
                        <p>Chào mừng bạn đến với Haircare, nơi chúng tôi cam kết mang đến cho bạn trải nghiệm chăm sóc tóc hoàn hảo nhất. Với đội ngũ thợ làm tóc giàu kinh nghiệm và đam mê, chúng tôi luôn cập nhật những xu hướng tóc mới nhất và áp dụng kỹ thuật tiên tiến để mang đến cho bạn vẻ ngoài ấn tượng. Tại Haircare, mỗi khách hàng đều được chăm sóc tận tình và chu đáo, từ lần đầu tiên đến những lần tiếp theo. Chúng tôi luôn lắng nghe và hiểu rõ nhu cầu của bạn để tạo ra kiểu tóc phù hợp nhất với phong cách và cá tính riêng.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="ftco-section ftco-no-pt ftco-no-pb">
    <div class="container-fluid px-0">
        <div class="row no-gutters">
            <div class="col-md-6 text-center d-flex align-items-stretch order-md-2">
                <div class="services-wrap d-flex align-items-center img" style="background-image: url(images/formen.jpg);">
                    <div class="text">
                        <h3>Cắt Tóc Nam</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-center d-flex align-items-stretch order-md-1">
                <div class="text-about py-5 px-4">
                    <h1 class="logo">
                        <a href="#"><span class="flaticon-scissors-in-a-hair-salon-badge"></span>Haircare</a>
                    </h1>
                    <h2>Chào Mừng Đến Với Salon Của Chúng Tôi</h2>
                    <p>Tại Haircare, chúng tôi tận tâm phục vụ bạn với dịch vụ chăm sóc tóc chuyên nghiệp và không gian thân thiện. Hãy để chúng tôi mang đến cho bạn một trải nghiệm đẳng cấp và sự hài lòng tuyệt đối.</p>
                </div>
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
                                            <div class="user-img" style="background-image: url(images/.jpg)">
                                            </div>
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
                        </div>
                    </div>
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
                    <p>Tại Haircare, chúng tôi tận tâm phục vụ bạn với dịch vụ chăm sóc tóc chuyên nghiệp và không gian thân thiện. Hãy để chúng tôi mang đến cho bạn một trải nghiệm đẳng cấp và sự hài lòng tuyệt đối.</p>
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
                        <li><a href="#" class="py-2 d-block">Câu hỏi thường gặp</a></li>
                        <li><a href="#" class="py-2 d-block">Quyền riêng tư</a></li>
                        <li><a href="#" class="py-2 d-block">Điều khoản sử dụng</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Links</h2>
                    <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">Trang Chủ</a></li>
                        <li><a href="#" class="py-2 d-block">Dịch Vụ</a></li>
                        <li><a href="#" class="py-2 d-block">Phòng Trưng Bày</a></li>
                        <li><a href="#" class="py-2 d-block">Về Chúng Tôi</a></li>
                        <li><a href="#" class="py-2 d-block">Blog</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md">
                <div class="ftco-footer-widget mb-4">
                    <h2 class="ftco-heading-2">Bạn Có Thắc Mắc?</h2>
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
