<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Haircare - Free Bootstrap 4 Template by Colorlib</title>
        <style>
            .pricing-entry {
                height: 450px;
                position: relative;
            }
            .pricing-entry img {
                width: 100%;
                height: auto;
                max-width: 250px;
                border-radius: 10px;
            }
            .price-fixed {
                position: absolute;
                bottom: 30px;
                left: 50%;
                margin-top: 0px;
                padding-top: 10px;
                transform: translateX(-50%);
                font-weight: bold;
            }
            .service-description {
                margin-top: 10px;
                padding-bottom: 50px;
                font-size: 14px;
                color: #555;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                height: 100px;
                position: absolute;
                bottom: 20px;
                left: 0;
                right: 0;
                margin-top: 10px;
                padding: 0 20px;
                font-size: 14px;
                color: #555;
            }
            .col-md-3 {
                padding-bottom: 50px;
            }
            .hero-wrap {
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center center;
            }
            .navbar {
                background-color: #0F0C07 !important;
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
                z-index: 1000;
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
                            <li class="nav-item active"><a href="login" class="nav-link">Đăng nhập</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account!=null}">
                            <li class="nav-item dropdown active">
                                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Xin chào ${sessionScope.account.getPhone()}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="cusprofile">Thông tin cá nhân</a>
                                    <a class="dropdown-item" href="GetAppointment">Lịch hẹn</a>
                                    <a class="dropdown-item" href="bookingschedule">Xem lịch sử đặt</a>
                                </div>
                            </li>
                            <li class="nav-item"><a href="logout" class="nav-link active">Đăng xuất</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="ftco-section ftco-pricing">
            <div class="container">
                <div class="row justify-content-center pb-3">
                    <div class="col-md-10 heading-section text-center ftco-animate">
                        <span class="subheading">Bảng giá</span>
                        <h2 class="mb-4">Giá của chúng tôi</h2>
                        <p>Nơi xa, sau những ngọn núi, cách xa những quốc gia Vokalia và Consonantia</p>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listServices}" var="s">
                        <c:set var="selected" value="false" />
                        <c:if test="${sessionScope.services != null && sessionScope.services.listServices != null}">
                            <c:forEach var="selectedService" items="${sessionScope.services.listServices}">
                                <c:if test="${selectedService.servicesId == s.servicesId}">
                                    <c:set var="selected" value="true" />
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <div class="col-md-3 ftco-animate">
                            <c:if test="${s.isActive}">
                            <div class="pricing-entry pb-5 text-center">
                                <div>
                                    <h3 class="mb-4">${s.name}</h3>
                                    <img src="img/service/${s.image}" width="width" height="height" alt="alt"/>
                                    <p class="service-description">${s.description}</p>
                                    <p class="price-fixed"><span class="price">${s.price}K</span></p>
                                </div>
                                <p class="button text-center">
                                    <a href="#" class="btn ${selected ? 'btn-secondary' : 'btn-primary'} px-4 py-3 add-service" data-price="${s.price}" data-service="${s.servicesId}">
                                        ${selected ? 'Đã thêm' : 'Thêm dịch vụ'}
                                    </a>
                                </p>
                            </div>
                            </c:if>        
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <div class="fixed-bottom-bar">
            <span id="service-count">0 dịch vụ</span> | <span id="total-price">0K</span>
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
                let soDichVu = 0;
                let tongGia = 0;
                const dichVuDaThem = {};

                document.querySelectorAll('.add-service').forEach(button => {
                    const dichVu = button.getAttribute('data-service');
                    const gia = parseFloat(button.getAttribute('data-price'));

                    if (button.classList.contains('btn-secondary')) {
                        dichVuDaThem[dichVu] = gia;
                        soDichVu++;
                        tongGia += gia;
                    }

                    button.addEventListener('click', () => {
                        if (dichVuDaThem[dichVu]) {
                            delete dichVuDaThem[dichVu];
                            soDichVu--;
                            tongGia -= gia;
                            button.textContent = 'Thêm dịch vụ';
                            button.classList.remove('btn-secondary');
                            button.classList.add('btn-primary');
                        } else {
                            dichVuDaThem[dichVu] = gia;
                            soDichVu++;
                            tongGia += gia;
                            button.textContent = 'Đã thêm';
                            button.classList.remove('btn-primary');
                            button.classList.add('btn-secondary');
                        }

                        document.getElementById('service-count').innerText = soDichVu + ' dịch vụ';
                        document.getElementById('total-price').innerText = tongGia + 'đ';
                    });
                });

                document.getElementById('service-count').innerText = soDichVu + ' dịch vụ';
                document.getElementById('total-price').innerText = tongGia + 'đ';

                function done() {
                    const dichVuChon = Object.keys(dichVuDaThem);

                    $.ajax({
                        type: 'GET',
                        url: 'servicesbookingajax',
                        data: {
                            soDichVu: soDichVu,
                            tongGia: tongGia,
                            dichVu: dichVuChon
                        },
                        success: function (response) {
                            // Assuming the server sends a success response regardless of selected services
                            window.location.href = 'appointment';
                        },
                        error: function (error) {
                            console.error('Lỗi:', error);
                        }
                    });
                }
        </script>
    </body>
</html>
