<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Các đánh giá</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .link-muted {
                color: #aaa;
            }
            .link-muted:hover {
                color: #1266f1;
            }
            /* Định nghĩa kiểu cho lớp btn và btn-primary */
            .btn {
                width: 20%;
                border-radius: 5px;
                padding: 1.5%;
                color: #fff;
                background-color: #BF925B;
                border: none;
                cursor: pointer;
                height: 50px; /* Adjust the height as needed */
                line-height: 50px; /* Ensure the text is vertically centered */
                display: inline-block; /* Ensure the button behaves like an inline-block element */
                padding: 0 20px; /* Adjust padding as needed */
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .nav-link {
                padding: 0;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <section style="background-color: #EBE8DE;">
            <div class="container my-5 py-5 text-body">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-11 col-lg-9 col-xl-7">
                        <h2 class="text-center mb-4">Danh sách các phản hồi của khách hàng</h2>
                        <c:forEach var="feedback" items="${feedbackList}">
                            <div class="d-flex flex-start mb-4">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="" alt="avatar" width="65"
                                     height="65" />
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <div class="">
                                            <h5> <c:forEach var="customer" items="${cusList}">
                                                    <c:if test="${customer.customerId == feedback.customerId}">
                                                        ${customer.fullName}
                                                    </c:if>
                                                </c:forEach></h5>
                                            <p>${feedback.noidung}</p>

                                            <div class="d-flex justify-content-between align-items-center">
                                                <a href="#" class="link-muted"><i class="fas fa-reply me-1"></i> Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <a href="cusfeedback" class="btn btn-primary nav-link">Đánh giá của bạn</a>
                        <br>
                        <a href="home"><- Quay lại trang chủ </a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
