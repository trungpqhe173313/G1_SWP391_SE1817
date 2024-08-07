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
        <form action="createblog" method="POST" onsubmit="return validateForm()" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" maxlength="200" required>
            </div>
            <div class="form-group">
                <label for="content">Nội dung:</label>
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="form-group">
                <label for="image">Ảnh đại diện:</label>
                <input type="file" class="form-control-file" id="image" name="image" required>
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

        function validateForm() {
            // Get form values
            const title = document.getElementById('title').value.trim();
            const content = CKEDITOR.instances.content.getData().replace(/<[^>]*>/g, '').trim();
            const image = document.getElementById('image').value;

            // Check for empty fields
            if (!title || !content) {
                alert("Tiêu đề và Nội dung không được bỏ trống.");
                return false;
            }

            // Check for leading spaces
            if (title !== title.trim() || content !== content.trim()) {
                alert("Tiêu đề và Nội dung không được có khoảng cách ở đầu.");
                return false;
            }

            // Check if image file is selected
            if (!image) {
                alert("Ảnh đại diện không được để trống.");
                return false;
            }

            // Check for valid image file extensions
            const validExtensions = ['jpg', 'jpeg', 'png'];
            const fileExtension = image.split('.').pop().toLowerCase();
            if (!validExtensions.includes(fileExtension)) {
                alert("Ảnh đại diện phải là file jpg hoặc png.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
