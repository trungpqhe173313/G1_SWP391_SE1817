

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Profile</title>
    </head>
    <body>
        <c:set var="c" value="${requestScope.account}" />
        <form action="customerupdate" method="POST">
            <input type="hidden" name="username" value="${account.username}">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${account.fullName}"><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${account.email}"><br>
            <label for="avatar">Avatar:</label>
            <input type="text" id="avatar" name="avatar" value="${account.avatar}"><br>
            <label for="isMale">Gender:</label>
            <input type="radio" id="male" name="isMale" value="true" <c:if test="${account.isMale}">checked</c:if>> Male
            <input type="radio" id="female" name="isMale" value="false" <c:if test="${!account.isMale}">checked</c:if>> Female<br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
