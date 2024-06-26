<%-- 
    Document   : index.jsp
    Created on : 03-10-2023, 01:09:39
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Khôi phục mật khẩu </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <link rel="stylesheet" href="css/css/cssResetPass/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/css/cssResetPass/style.css">
        <link rel="stylesheet" type="text/css" href="css/css/cssResetPass/util.css">


        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    </head>

    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="https://img.freepik.com/premium-vector/3d-password-field-with-padlock-isolated_169241-6460.jpg" alt="IMG">
                    </div>
                    <form action="sendlink" method="post"> <span class="login100-form-title">
                            <b>Quên Mật Khâủ  </b>
                        </span>

                        <div class="wrap-input100 validate-input">

                            <input class="input100" type="text" placeholder="Nhập email của bạn" name="emailInputReset"
                                   value="" required>

                            <span class="symbol-input100">
                                <i class='bx bx-mail-send' ></i>
                            </span>
                        </div>


                        <div >
                            <input  type="submit"  onclick="return validateEmail();" value="Send"/>
                        </div>  
                        <div class="text-center p-t-12">

                        </div><p class="text-danger" style="color: blue ; background-color: white ; width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">
                            ${mess}
                        </p>
                    </form>



                    <a class="txt2" href="login">
                        Back
                    </a>


                </div>
            </div>
        </div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script>
                                function validateEmail() {
                                    // Lấy giá trị địa chỉ email từ trường input
                                    var email = document.querySelector('input[name="emailInputReset"]').value;

                                    // Sử dụng biểu thức chính quy để kiểm tra định dạng email
                                    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

                                    if (!emailRegex.test(email)) {
                                        alert("Vui lòng nhập địa chỉ email hợp lệ.");
                                        return false;
                                    }

                                    // Nếu địa chỉ email hợp lệ, cho phép form gửi đi
                                    return true;
                                }
        </script>
    </body>
</html>