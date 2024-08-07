<%-- 
    Document   : changePassReset
    Created on : May 29, 2024, 9:03:02 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/css/cssResetPass/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/css/cssResetPass/style.css">
        <link rel="stylesheet" type="text/css" href="css/css/cssResetPass/util.css">
    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle">
                <c:if test="${sessionScope.account==null}">
                    <form action="changepassreset" method="post" ">

                        <img src="" id="signupLogo"/>

                        <h2 class="formTitle">
                            Đổi Mật Khẩu
                        </h2>

                        <div class="inputDiv">
                            <label class="inputLabel" for="password">Mật Khẩu Mới</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="inputDiv">
                            <label class="inputLabel" for="confirmPassword">Nhập Lại Mật Khẩu</label>
                            <input type="password" id="confirmPassword" name="confirmPassword">
                        </div>

                        <div class="buttonWrapper">
                            <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                                <span>Continue</span>
                                <span id="loader"></span>
                            </button>
                        </div>

                    </form>
                </c:if>

                <c:if test="${sessionScope.account!=null}">
                    <form action="changepassw" method="post" ">

                        <img src="" id="signupLogo"/>

                        <h2 class="formTitle">
                            Đổi Mật Khẩu
                        </h2>

                        <div class="inputDiv">
                            <label class="inputLabel" for="password">Mật Khẩu Cũ</label>
                            <input type="password" id="oldpassword" name="oldpassword" required>
                        </div>

                        <div class="inputDiv">
                            <label class="inputLabel" for="password">Mật Khẩu Mới</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="inputDiv">
                            <label class="inputLabel" for="confirmPassword">Nhập Lại Mật Khẩu</label>
                            <input type="password" id="confirmPassword" name="confirmPassword">
                        </div>

                        <div class="buttonWrapper">
                            <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                                <span>Continue</span>
                                <span id="loader"></span>
                            </button>
                        </div> <br>
                        <p class="text-danger" style="color: blue ; background-color: white ; width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">
                            ${mess}
                        </p>
                        <div class="text-md-left">
                            <p class="text-danger" style="color: blue ; background-color: white ; width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">
                                ${mess} <br>
                            <a href="cusprofile" style="color: #ffaf00"> Back </a>
                            </p>
                            
                        </div>
                    </form> 
                </c:if>
            </div>
        </div>

        <script>
            var password = document.getElementById("password")
                    , confirm_password = document.getElementById("confirmPassword");

            document.getElementById('signupLogo').src = "https://s3-us-west-2.amazonaws.com/shipsy-public-assets/shipsy/SHIPSY_LOGO_BIRD_BLUE.png";
            enableSubmitButton();

            function validatePassword() {
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                    return false;
                } else {
                    confirm_password.setCustomValidity('');
                    return true;
                }
            }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;

            function enableSubmitButton() {
                document.getElementById('submitButton').disabled = false;
                document.getElementById('loader').style.display = 'none';
            }

            function disableSubmitButton() {
                document.getElementById('submitButton').disabled = true;
                document.getElementById('loader').style.display = 'unset';
            }

            function validateSignupForm() {
                var form = document.getElementById('signupForm');

                for (var i = 0; i < form.elements.length; i++) {
                    if (form.elements[i].value === '' && form.elements[i].hasAttribute('required')) {
                        console.log('There are some required fields!');
                        return false;
                    }
                }

                if (!validatePassword()) {
                    return false;
                }

                onSignup();
            }

            function onSignup() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {

                    disableSubmitButton();

                    if (this.readyState == 4 && this.status == 200) {
                        enableSubmitButton();
                    } else {
                        console.log('AJAX call failed!');
                        setTimeout(function () {
                            enableSubmitButton();
                        }, 1000);
                    }

                };

                xhttp.open("GET", "ajax_info.txt", true);
                xhttp.send();
            }
        </script>
    </body>
</html>
