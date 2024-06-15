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
    <title>Update Employee Status</title>
</head>

<body id="page-top">
    <%-- Perform the update here --%>
    <%-- Get the parameters passed from the URL --%>
    <% String employeesIdStr = request.getParameter("employeesId"); %>
    <% String isActiveStr = request.getParameter("isActive"); %>
    
    <%-- Check if both parameters are not null --%>
    <% if (employeesIdStr != null && isActiveStr != null) { %>
        <%-- Parse the parameters to appropriate data types --%>
        <% int employeesId = Integer.parseInt(employeesIdStr); %>
        <% boolean isActive = Boolean.parseBoolean(isActiveStr); %>

        <%-- Create an instance of EmployeesDAO to update the status --%>
        <% EmployeesDAO employeesDAO = new EmployeesDAO(); %>
        
        <%-- Try to update the status and handle any exceptions --%>
        <% try { %>
            <% boolean success = employeesDAO.updateEmployeeActiveStatus(employeesId, !isActive); %>
            <% if (success) { %>
                <h1>Employee status updated successfully!</h1>
                <%-- Redirect to employeesDetail.jsp after successful update --%>
                <% 
                    // Get the RequestDispatcher for employeesDetail.jsp
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/employeesdetail.jsp");
                    // Forward the request to employeesDetail.jsp
                    dispatcher.forward(request, response);
                %>
            <% } else { %>
                <h1>Failed to update employee status!</h1>
                <%-- Redirect to error.jsp or appropriate error page --%>
                <% response.sendRedirect("error.jsp"); %>
            <% } %>
        <% } catch (Exception ex) { %>
            <h1>Error occurred while updating employee status!</h1>
            <% ex.printStackTrace(); %>
            <%-- Redirect to error.jsp or appropriate error page --%>
            <% response.sendRedirect("error.jsp"); %>
        <% } %>
    <% } else { %>
        <h1>Missing parameters!</h1>
        <%-- Redirect to error.jsp or appropriate error page --%>
        <% response.sendRedirect("error.jsp"); %>
    <% } %>
</body>

</html>






