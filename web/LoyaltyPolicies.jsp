<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Loyalty Policies</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="sidebar.jsp"></jsp:include>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>

                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Số Tiền Tối Thiểu</th>
                                            <th>Điểm Mỗi Đơn Vị</th>
                                            <th>Chỉnh Sửa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="policy" items="${policies}">
                                            <tr>
                                                <td>${policy.minAmount}</td>
                                                <td>${policy.pointsPerUnit}</td>
                                                <td>
                                                    <button type="button" class="btn btn-info btn-sm edit-btn" 
                                                        data-policyid="${policy.policyId}" 
                                                        data-minamount="${policy.minAmount}" 
                                                        data-pointsperunit="${policy.pointsPerUnit}">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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

    <div class="modal fade" id="editPolicyModal" tabindex="-1" role="dialog" aria-labelledby="editPolicyModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPolicyModalLabel">Chỉnh sửa Chính sách Loyalty</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editPolicyForm">
                        <div class="form-group">
                            <label for="minAmount">Số Tiền Tối Thiểu</label>
                            <input type="number" class="form-control" id="minAmount" name="minAmount" required>
                        </div>
                        <div class="form-group">
                            <label for="pointsPerUnit">Điểm Mỗi Đơn Vị</label>
                            <input type="number" class="form-control" id="pointsPerUnit" name="pointsPerUnit" required>
                        </div>
                        <input type="hidden" id="policyId" name="policyId">
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
                    <a class="btn btn-primary" href="#">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function() {
            // Khi nhấn vào nút "Chỉnh Sửa"
            $('.edit-btn').on('click', function() {
                // Lấy thông tin từ dòng hiện tại
                var policyId = $(this).data('policyid');
                var minAmount = $(this).data('minamount');
                var pointsPerUnit = $(this).data('pointsperunit');

                // Điền thông tin vào form
                $('#policyId').val(policyId);
                $('#minAmount').val(minAmount);
                $('#pointsPerUnit').val(pointsPerUnit);

                // Hiển thị modal
                $('#editPolicyModal').modal('show');
            });

            // Xử lý khi form được submit
            $('#editPolicyForm').on('submit', function(event) {
                event.preventDefault();

                // Lấy dữ liệu từ form
                var formData = $(this).serialize();

                // Gửi yêu cầu AJAX để cập nhật chính sách
                $.ajax({
                    type: 'POST',
                    url: 'updateloyaltypolicies',
                    data: formData,
                    success: function(response) {
                        alert('Cập nhật thành công');
                        location.reload(); // Reload trang sau khi cập nhật thành công
                    },
                    error: function() {
                        alert('Cập nhật thất bại');
                    }
                });
            });
        });
    </script>
</body>
</html>
