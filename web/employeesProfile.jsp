<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Profile</title>
    <!-- Định dạng CSS hoặc thư viện CSS mà bạn muốn sử dụng -->
    <style>
        /* CSS styles here */
    </style>
</head>
<body>
    <h1>Employee Profile</h1>
    <c:if test="${not empty employeeInfo}">
        <p><strong>Name:</strong> ${employeeInfo.name}</p>
        <p><strong>Email:</strong> ${employeeInfo.email}</p>
        <p><strong>Phone:</strong> ${employeeInfo.phone}</p>
        <!-- Thêm các thông tin khác cần hiển thị về nhân viên -->
    </c:if>
    
    <c:if test="${empty employeeInfo}">
        <p>No employee information available.</p>
    </c:if>
    
    <!-- Các đoạn script JavaScript nếu cần -->
</body>
</html>
