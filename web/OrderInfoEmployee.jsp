<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Information</title>
    
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <style>
        .order-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .order-item {
            border: 1px solid black;
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .order-item h4 {
            margin: 0 0 10px 0;
        }
        .order-item p {
            margin: 5px 0;
        }
        .action-buttons {
            margin-top: 20px;
        }
        .btn-action {
            margin-right: 10px;
        }
        .empty-shift-message {
            font-size: 18px;
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body id="page-top">
    <div id="wrapper">
        <jsp:include page="sidebarEmployees.jsp"></jsp:include>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>
                </nav>

                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h2>Đơn Đang Cắt</h2>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${not empty inProgressOrders}">
                                    <div class="order-container">
                                        <!-- Display orders in progress -->
                                        <c:forEach var="order" items="${inProgressOrders}">
                                            <div class="order-item">
                                                <h4>Mã Đơn Hàng: <c:out value="${order.orderCode}" /></h4>
                                                <p>Tên Khách Hàng: <c:out value="${order.customerName}" /></p>
                                                <p>Dịch Vụ: <c:out value="${order.serviceNames}" /></p>
                                                <p>Trạng Thái: <c:out value="${order.status}" /></p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- Button for ending shifts -->
                                    <div class="action-buttons">
                                        <form action="onshift" method="post" style="display:inline;">
                                            <input type="hidden" name="employeeId" value="${employeeId}" />
                                            <input type="hidden" name="action" value="end" />
                                            <button type="submit" class="btn btn-primary btn-action">Kết Thúc Ca</button>
                                        </form>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <p class="empty-shift-message">Ca Đang Trống</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
