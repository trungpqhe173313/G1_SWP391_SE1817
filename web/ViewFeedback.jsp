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
        </style>
    </head>
    <body>
        <section style="background-color: #EBE8DE;">
            <div class="container my-5 py-5 text-body">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-11 col-lg-9 col-xl-7">
                        <h2 class="text-center mb-4">Danh sách phản hồi</h2>
                        <c:forEach var="feedback" items="${feedbackList}">
                            <div class="d-flex flex-start mb-4">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp" alt="avatar" width="65"
                                     height="65" />
                                <div class="card w-100">
                                    <div class="card-body p-4">
                                        <div class="">
                                            <h5>${feedback.customer.fullName}</h5>
                                            <p class="small">${feedback.createdAt}</p>
                                            <p>${feedback.noidung}</p>

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <a href="#!" class="link-muted me-2"><i class="fas fa-thumbs-up me-1"></i>132</a>
                                                    <a href="#!" class="link-muted"><i class="fas fa-thumbs-down me-1"></i>15</a>
                                                </div>
                                                <a href="#!" class="link-muted"><i class="fas fa-reply me-1"></i> Reply</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
