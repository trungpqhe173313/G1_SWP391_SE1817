<%-- 
    Document   : viewappointment
    Created on : Jun 9, 2024, 1:59:36 AM
    Author     : phamt
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        <style>
            .appointment-info {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            .appointment-info th, .appointment-info td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }
            .appointment-info th {
                text-align: left;
            }
            .appointment-info td img {
                border-radius: 50%;
                width: 40px;
                height: 40px;
            }
            .appointment-info .details-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 4px 2px;
                cursor: pointer;
            }
            body {
                font-family: Arial, sans-serif;
            }
            .modal {
                display: none; /* Ẩn modal ban đầu */
                position: fixed; /* Ở vị trí cố định */
                z-index: 1; /* Hiển thị phía trên cùng */
                left: 0;
                top: 0;
                width: 100%; /* Chiếm toàn bộ chiều rộng màn hình */
                height: 100%; /* Chiếm toàn bộ chiều cao màn hình */
                overflow: auto; /* Bật cuộn nếu cần thiết */
                background-color: rgb(0,0,0); /* Màu nền */
                background-color: rgba(0,0,0,0.4); /* Màu nền đen mờ */
            }
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% từ phía trên và căn giữa */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Chiều rộng của modal */
                max-width: 500px;
                border-radius: 5px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input, .form-group select, .select2-container {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            .form-group button {
                padding: 10px 15px;
                background-color: #28a745;
                border: none;
                color: white;
                cursor: pointer;
                border-radius: 5px;
            }

            .btn-remove-all {
                margin-top: 10px;
                padding: 5px 10px;
                background-color: #dc3545;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="nav.jsp"></jsp:include>
            <!-- END nav -->


            <section class="hero-wrap js-fullheight" style="background-image: url(images/bg-2.jpg);"
                     data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text js-fullheight justify-content-center align-items-center">
                        <div class="col-lg-12 ftco-animate d-flex align-items-center">
                            <div class="text text-center">
                                <h1 class="mb-4 mr-auto ml-auto">Tài khoảng của tôi</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </section>



            <section class="ftco-section ftco-booking bg-light">
                <div class="container ftco-relative">
                    <div class="row justify-content-center pb-3">
                        <div class="col-md-10 heading-section text-center ftco-animate">
                            <span class="subheading">Booking</span>
                            <h2 class="mb-4">Lịch hẹn</h2>
                            <p>Hi vọng bạn sẽ có trải nghiệm tuyệt vời với những dịch vụ của chúng tôi</p>
                        </div>
                    </div>
                    <!-- JavaScript Alert for Null Order -->
                <c:if test="${order == null}">
                    <script type="text/javascript">
                        alert("Lịch trống!");
                        window.location.href = "home"; // Thay "home" bằng URL trang chủ của bạn
                    </script>
                </c:if>

                <!-- Rest of your JSP content -->
                <c:if test="${order != null}">
                    <div class="row justify-content-center">
                        <div class="col-md-10 ftco-animate">
                            <table class="appointment-info">
                                <tr>
                                    <th>Ngày</th>
                                    <th>Ca</th>
                                    <th colspan="2">Dịch vụ</th>

                                    <th>Trạng thái</th>
                                    <th>Tổng tiền</th>

                                    <th></th>
                                </tr>


                                <tr>
                                    <td>${order.getOrderDate()}</td>
                                    <c:forEach items="${shift}" var="shift"> 
                                        <c:if test="${shift.getId() == order.getShiftsID()}">
                                            <td>${shift.getStartTime()}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td colspan="2">
                                        <ul>
                                            <c:forEach items="${services}" var="s">
                                                <li>${s.getName()}</li>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <c:forEach items="${status}" var="status"> 
                                        <c:if test="${status.getId() == order.getStatusId()}"> 
                                            <td>${status.getName()}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td>${order.getTotalAmount()} VND</td>
                                </tr>
                                <td><button id="showFormUpdate" class="details-button">Cập nhật</button></td>
                                <td><a href="CancelAppointment?oId=${order.getId()}" class="details-button">Hủy</a></td>
                            </table>
                        </div>
                    </div>
                </c:if>
            </div>
        </section>

        <!-- Form update booking -->                
        <div id="bookingModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Đặt Lịch Hẹn</h2>
                <form action="updateAppointment" >
                    <div class="form-group">
                        <label for="date">Ngày</label>
                        <input type="date" id="date" name="date" value="${order.getOrderDate()}" required>
                    </div>
                    <input type="hidden" name="orderID" value="${order.getId()}">
                    <div class="form-group">
                        <label for="services">Dịch Vụ</label>
                        <select id="services" name="services" multiple="multiple" required>
                            <c:forEach items="${ls}" var="s">
                                <c:set var="isSelected" value="false" />
                                <c:forEach items="${services}" var="selectedService">
                                    <c:if test="${s.getServicesId() eq selectedService.getServicesId()}">
                                        <c:set var="isSelected" value="true" />
                                    </c:if>
                                </c:forEach>
                                <option value="${s.getServicesId()}" ${isSelected eq "true" ? 'selected="selected"' : ''}>
                                    ${s.getName()}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="time">Thời Gian</label>
                        <select id="shift" name="shift" required>
                            <c:forEach items="${shift}" var="shift">
                                <option ${(shift.getId() == order.getShiftsID())?"selected = \"selected\"":""}
                                    value="${shift.getId()}" >${shift.getStartTime()}</option>
                            </c:forEach>        
                        </select>        
                    </div>
                    <div class="form-group">
                        <button type="submit">Đặt Lịch</button>
                        <button type="button" id="cancelBtn">Hủy</button>
                    </div>
                </form>
            </div>
        </div>








        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>
        <script>
            $(document).ready(function () {
                // Khởi tạo Select2 với allowClear và placeholder
                $('#services').select2({
                    placeholder: "Chọn dịch vụ",
                    allowClear: true
                });
            });
            $(document).ready(function () {
                // Hiển thị modal khi click vào nút "Cập nhật"
                $('#showFormUpdate').click(function () {
                    $('#bookingModal').css('display', 'block');
                });

                // Đóng modal khi click vào nút đóng
                $('.close').click(function () {
                    $('#bookingModal').css('display', 'none');
                });

                // Đóng modal khi click bên ngoài nội dung modal
                $(window).click(function (event) {
                    if (event.target == $('#bookingModal')[0]) {
                        $('#bookingModal').css('display', 'none');
                    }
                });
            });
        </script>
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
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    </body>

</html>
