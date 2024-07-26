<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Blog</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Include CKEditor from CDN -->
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>Cập Nhật Blog</h2>
        <form action="updateblog" method="POST" onsubmit="return validateForm()" enctype="multipart/form-data">
            <input type="hidden" name="postId" value="${blog.postId}"/>
            <input type="hidden" name="currentImage" value="${blog.image}"/>
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" value="${blog.title}" maxlength="200" required>
            </div>
            <div class="form-group">
                <label for="content">Nội dung:</label>
                <textarea id="content" name="content" rows="10" required>${blog.content}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Ảnh đại diện:</label>
                <input type="file" class="form-control-file" id="image" name="image">
                <img src="${blog.image}" alt="Current Image" class="mt-3" style="max-width: 200px;">
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

            // Check for empty fields
            if (!title || !content) {
                alert("Tiêu đề và Nội dung không được bỏ trống.");
                return false;
            }

            // Check for leading spaces
            if (title !== title.trim()) {
                alert("Tiêu đề không được có khoảng cách ở đầu.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
