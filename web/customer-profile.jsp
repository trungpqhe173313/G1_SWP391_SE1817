

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="a" value="${requestScope.account}" />

        <form action="cusprofile">
            <div class="container" style="margin-top: 50px;">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="avatar">Avatar </label>
                            <td>${a.avatar}</td>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone: </label>
                            <td>${a.phone}</td>
                        </div>
                        <div class="form-group">
                            <label for="password">Password: </label>
                            <td>${a.password}</td>
                        </div>
                        <div class="form-group">
                            <label for="fullName">Full Name: </label>
                            <td>${a.fullName}</td>
                        </div>
                        <div class="form-group">
                            <label for="email">Email: </label>
                            <td>${a.email}</td>
                        </div>
                        <div class="form-group">
                            <label for="isMale">Gender: </label>
                            <td>${a.isMale}</td>
                        </div>

                    <button type="button" class="btn btn-primary" onclick="updateCustomer('${a.phone}')">Update</button>

                    <script>
                        function updateCustomer(phone) {
                            window.location.href = 'customerupdate?phone=' + phone;
                        }
                    </script>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
