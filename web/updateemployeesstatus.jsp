<%-- 
    Document   : updateemployeesstatus
    Created on : Jun 11, 2024, 8:30:18 PM
    Author     : ducth
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Dal.EmployeesDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="javax.servlet.ServletException" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cập Nhật Trạng Thái Nhân Viên</title>
</head>

<body id="page-top">
    <%-- Lấy các tham số từ URL --%>
    <% String employeesIdStr = request.getParameter("employeeId"); %>
    <% String isActiveStr = request.getParameter("isActive"); %>

    <%-- Kiểm tra nếu cả hai tham số đều không null --%>
    <% if (employeesIdStr != null && isActiveStr != null) { %>
        <%-- Chuyển đổi các tham số sang các kiểu dữ liệu phù hợp --%>
        <% int employeeId = Integer.parseInt(employeesIdStr); %>
        <% boolean isActive = Boolean.parseBoolean(isActiveStr); %>

        <%-- Kiểm tra nếu yêu cầu này đã được xác nhận từ người dùng --%>
        <% String confirmed = request.getParameter("confirmed"); %>
        <% if ("true".equals(confirmed)) { %>
            <%-- Tạo một thể hiện của EmployeesDAO để cập nhật trạng thái --%>
            <% EmployeesDAO employeesDAO = new EmployeesDAO(); %>
            <%-- Thử cập nhật trạng thái và xử lý các ngoại lệ có thể xảy ra --%>
            <% try { %>
                <% boolean success = employeesDAO.updateEmployeeActiveStatus(employeeId, !isActive); %>
                <% if (success) { %>
                    <h1>Cập nhật trạng thái nhân viên thành công!</h1>
                    <%-- Chuyển hướng đến employeesdetail.jsp sau khi cập nhật thành công --%>
                    <% 
                        // Lấy RequestDispatcher cho employeesdetail.jsp
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/employeesdetail.jsp");
                        // Chuyển tiếp yêu cầu đến employeesdetail.jsp
                        dispatcher.forward(request, response);
                    %>
                <% } else { %>
                    <h1>Không thể cập nhật trạng thái nhân viên!</h1>
                    <%-- Chuyển hướng đến error.jsp hoặc trang lỗi thích hợp --%>
                    <% response.sendRedirect("error.jsp"); %>
                <% } %>
            <% } catch (Exception ex) { %>
                <h1>Có lỗi xảy ra trong quá trình cập nhật trạng thái nhân viên!</h1>
                <% ex.printStackTrace(); %>
                <%-- Chuyển hướng đến error.jsp hoặc trang lỗi thích hợp --%>
                <% response.sendRedirect("error.jsp"); %>
            <% } %>
        <% } else { %>
            <h1>Cần xác nhận từ người dùng!</h1>
            <script>
                // Chuyển hướng đến chính nó với cờ xác nhận
                var employeeId = '<%= employeeId %>';
                var isActive = '<%= isActive %>';
                window.location.href = 'updateemployeesstatus?employeeId=' + employeeId + '&isActive=' + isActive + '&confirmed=true';
            </script>
        <% } %>
    <% } else { %>
        <h1>Thiếu tham số!</h1>
        <%-- Chuyển hướng đến error.jsp hoặc trang lỗi thích hợp --%>
        <% response.sendRedirect("error.jsp"); %>
    <% } %>
</body>

</html>







