<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Quản lý Blog</title>

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
        <%@ include file="sidebar.jsp" %>

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
                            <a class="btn btn-primary mb-3" href="createblog">
                                <i></i>
                                Tạo Blog Mới
                            </a>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 470px;">Tiêu Đề</th>
                                            <th style="width: 470px;">Nội Dung</th>
                                            <th style="width: 100px;">Ngày Tạo</th>
                                            <th style="width: 100px;">Ngày Sửa</th>
                                            <th style="width: 150px;">Trạng Thái</th>
                                            <th>Chỉnh Sửa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="blog" items="${blogs}">
                                            <tr>
                                                <td>${fn:substring(blog.title, 0, 60)}${fn:length(blog.content) > 60 ? '...' : ''}</td>
                                                <td>${fn:substring(blog.content, 0, 60)}${fn:length(blog.content) > 60 ? '...' : ''}</td>
                                                <td><fmt:formatDate value="${blog.createAt}" pattern="dd/MM/yyyy"/></td>
                                                <td><fmt:formatDate value="${blog.updateAt}" pattern="dd/MM/yyyy"/></td>
                                                <td id="status-${blog.postId}" class="status-column">${blog.isActive ? 'Đang hoạt động' : 'Không hoạt động'}</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <button type="button" class="btn btn-info btn-sm edit-btn mr-2"
                                                                data-toggle="modal" data-target="#editBlogModal"
                                                                data-blogid="${blog.postId}"
                                                                data-title="${blog.title}"
                                                                data-content="${blog.content}">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <div class="custom-control custom-switch custom-switch-lg">
                                                            <input type="checkbox" class="custom-control-input toggle-btn"
                                                                   id="toggle-${blog.postId}"
                                                                   data-blogid="${blog.postId}" data-active="${blog.isActive}"
                                                                   ${blog.isActive ? 'checked' : ''}>
                                                            <label class="custom-control-label ml-2" for="toggle-${blog.postId}">
                                                            </label>
                                                        </div>
                                                    </div>
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

    <!-- Modal for Editing Blog -->
    <div class="modal fade" id="editBlogModal" tabindex="-1" role="dialog" aria-labelledby="editBlogModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editBlogModalLabel">Chỉnh Sửa Blog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editBlogForm">
                        <input type="hidden" id="editPostId" name="editPostId">
                        <div class="form-group">
                            <label for="editTitle">Tiêu Đề</label>
                            <input type="text" class="form-control" id="editTitle" name="editTitle">
                        </div>
                        <div class="form-group">
                            <label for="editContent">Nội Dung</label>
                            <textarea class="form-control" id="editContent" name="editContent" rows="5"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary" id="saveChangesBtn">Lưu Thay Đổi</button>
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
    <script src="vendor/ckeditor/ckeditor.js"></script>

    <!-- Script for handling AJAX and modal interactions -->
    <script>
    $(document).ready(function () {
        $('#dataTable').DataTable({
            "columnDefs": [
                { "orderable": false, "targets": [5] } // Disable sorting for column 5 (Chỉnh Sửa)
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Vietnamese.json"
            }
        });

        // Open edit modal and populate with blog data
        $('.edit-btn').click(function() {
            var postId = $(this).data('blogid');
            var title = $(this).data('title');
            var content = $(this).data('content');

            $('#editPostId').val(postId);
            $('#editTitle').val(title);
            $('#editContent').val(content);

            $('#editBlogModal').modal('show');
        });

        // Function to handle toggle button change
        $('.toggle-btn').change(function() {
            var postId = $(this).data('blogid');
            var isActive = $(this).prop('checked');

            // AJAX call to update blog status
            $.ajax({
                type: 'POST',
                url: 'toggleblogstatus', // Adjust URL based on your servlet mapping
                data: {
                    postId: postId,
                    isActive: isActive
                },
                success: function(response) {
                    var statusText = isActive ? 'Đang hoạt động' : 'Không hoạt động';
                    $('#toggle-' + postId).prop('checked', isActive);
                    $('#status-' + postId).text(statusText);

                    // Check if blog needs to be updated (assuming UI updates for now)
                    if (!isActive) {
                        var title = $('#title-' + postId).text(); // Example selector for title
                        var content = $('#content-' + postId).text(); // Example selector for content

                        // Perform AJAX call to update blog content
                        $.ajax({
                            type: 'POST',
                            url: 'bloglistadmin', // URL mapping for updating blog
                            data: {
                                postId: postId,
                                title: title,
                                content: content
                            },
                            success: function(updateResponse) {
                                console.log('Blog updated successfully.');
                            },
                            error: function(xhr, status, error) {
                                console.error('Error updating blog: ' + error);
                            }
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error updating status: ' + error);
                }
            });
        });

        // AJAX call to save edited blog content
        $('#saveChangesBtn').click(function() {
            var postId = $('#editPostId').val();
            var title = $('#editTitle').val();
            var content = $('#editContent').val();

            $.ajax({
                type: 'POST',
                url: 'updateblog', // URL mapping for updating blog
                data: {
                    postId: postId,
                    title: title,
                    content: content
                },
                success: function(response) {
                    // Update UI or handle success message
                    console.log('Blog updated successfully.');
                    $('#editBlogModal').modal('hide');
                    // Optionally update the table row if needed
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    console.error('Error updating blog: ' + error);
                }
            });
        });
    });
    </script>
</body>
</html>
