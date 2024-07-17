<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo Blog Mới</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Include CKEditor from CDN -->
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>Tạo Blog Mới</h2>
        <form action="createblog" method="POST">
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="content">Nội dung:</label>
                <!-- Replace textarea with CKEditor -->
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="form-group">
                <label for="image">Ảnh đại diện:</label>
                <input type="file" class="form-control-file" id="image" name="image">
            </div>
            <button type="submit" class="btn btn-primary">Lưu Blog</button>
            <a href="bloglistadmin" class="btn btn-secondary ml-2">Quay lại</a>
        </form>
    </div>

    <!-- Script to initialize CKEditor -->
    <script>
        CKEDITOR.replace('content', {
            filebrowserUploadUrl: ''
        });
    </script>

</body>
</html>
