<%-- 
    Document   : changePassReset
    Created on : May 29, 2024, 9:03:02 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form action="changepassreset" method="post" ">

                    <img src="" id="signupLogo"/>

                    <h2 class="formTitle">
                        Login to your account
                    </h2>

                    <div class="inputDiv">
                        <label class="inputLabel" for="password">New Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                    </div>

                    <div class="buttonWrapper">
                        <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                            <span>Continue</span>
                            <span id="loader"></span>
                        </button>
                    </div>

                </form>
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
