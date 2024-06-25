<%-- 
    Document   : employeerecovery
    Created on : Jun 24, 2024, 4:33:40 AM
    Author     : ducth
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee Status</title>
    <script type="text/javascript">
        // Tự động submit form khi trang được tải
        window.onload = function() {
            document.getElementById("updateForm").submit();
        }
    </script>
</head>
<body>
    <form id="updateForm" action="EmployeesRecoveryController" method="post">
        <input type="hidden" name="employeeId" value="<%= request.getParameter("employeeId") %>">
        <input type="hidden" name="isActive" value="<%= !Boolean.parseBoolean(request.getParameter("isActive")) %>">
    </form>
</body>
</html>
