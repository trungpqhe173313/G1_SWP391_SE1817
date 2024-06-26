<%-- 
    Document   : OTP
    Created on : Jun 26, 2024, 1:31:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác minh OTP</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .otp-field {
                display: flex;
                justify-content: center;
                gap: 10px;
            }
            .otp-field input {
                width: 40px;
                height: 50px;
                text-align: center;
                font-size: 20px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .otp-field input:focus {
                border: 1px solid #007bff;
                outline: none;
            }
            .resend {
                text-align: center;
                margin-top: 10px;
                font-size: 14px;
            }

            .message {
                color: red;
            }

            .resend-link {
                color: blue;
                cursor: pointer;
                text-decoration: underline;
            }

            .resend-message {
                color: green;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="card p-4">
                <h5 class="text-center">NHẬP MÃ XÁC NHẬN</h5>
                <p class="text-center">Anh nhập mã xác nhận (6 chữ số) được gửi đến email <br></p>
                <form id="otp-form" action="verifyotp" method="post" class="text-center">
                    <div class="otp-field">
                        <input type="text" maxlength="1" name="otp1" required>
                        <input type="text" maxlength="1" name="otp2" required disabled>
                        <input type="text" maxlength="1" name="otp3" required disabled>
                        <input type="text" maxlength="1" name="otp4" required disabled>
                        <input type="text" maxlength="1" name="otp5" required disabled>
                        <input type="text" maxlength="1" name="otp6" required disabled>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3" disabled>Hoàn tất</button>
                    <div id="error-message" class="text-danger mt-2"></div>
                </form>
                <div class="resend">
                    Kiểm tra Email để lấy OTP . <br>
                    Gửi lại OTP sau <span id="countdown">60</span> giây <br>

                    
                </div>
                <div class="resend">
                    <div id="resend-message" class="resend-message"></div> <!-- Thêm thẻ này để hiển thị thông báo -->
                    <span class="message">${mess}</span>
                </div>

            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const inputs = document.querySelectorAll('.otp-field input');
                const button = document.querySelector('button[type="submit"]');
                const countdownEl = document.getElementById('countdown');
                const resendDiv = document.querySelector('.resend');
                const errorMessage = document.getElementById('error-message');
                const resendMessage = document.getElementById('resend-message');

                inputs[0].focus();

                inputs.forEach((input, index) => {
                    input.addEventListener('input', () => {
                        // Validate input
                        if (!/^[0-9]$/.test(input.value)) {
                            input.value = '';
                            errorMessage.textContent = 'Chỉ được phép nhập số.';
                        } else {
                            errorMessage.textContent = '';
                        }

                        if (input.value.length > 1) {
                            input.value = input.value.slice(0, 1);
                        }
                        if (input.value !== '') {
                            if (inputs[index + 1]) {
                                inputs[index + 1].disabled = false;
                                inputs[index + 1].focus();
                            }
                        } else {
                            for (let i = index + 1; i < inputs.length; i++) {
                                inputs[i].value = '';
                                inputs[i].disabled = true;
                            }
                        }
                        button.disabled = !Array.from(inputs).every(input => input.value);
                    });

                    input.addEventListener('keydown', (e) => {
                        if (e.key === 'Backspace' && input.value === '' && index > 0) {
                            inputs[index - 1].focus();
                        }
                    });
                });

                document.getElementById('otp-form').addEventListener('submit', function (e) {
                    if (!Array.from(inputs).every(input => input.value)) {
                        e.preventDefault();
                        errorMessage.textContent = 'Không được bỏ trống bất kỳ ô nào.';
                    }
                });

                let countdown = 60;
                const interval = setInterval(() => {
                    countdown--;
                    countdownEl.textContent = countdown;
                    if (countdown === 0) {
                        clearInterval(interval);
                        const resendLink = document.createElement('span');
                        resendLink.classList.add('resend-link');
                        resendLink.textContent = 'Gửi lại OTP';
                        resendLink.addEventListener('click', resendOTP);
                        resendDiv.innerHTML = '';
                        resendDiv.appendChild(resendLink);
                    }
                }, 1000);

                function resendOTP() {
                    resendMessage.textContent = 'Đang gửi lại OTP...'; // Hiển thị thông báo ngay lập tức
                    const resendLink = document.querySelector('.resend-link');
                    if (resendLink) {
                        resendLink.style.pointerEvents = 'none'; // Vô hiệu hóa liên kết
                    }
                    fetch('resendotp', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                    }).then(response => response.text()).then(result => {
                        resendMessage.textContent = 'OTP đã được gửi lại.'; // Cập nhật thông báo
                        countdown = 60; // Đặt lại countdown về 60 sau khi gửi lại OTP
                        countdownEl.textContent = countdown;
                        const interval = setInterval(() => {
                            countdown--;
                            countdownEl.textContent = countdown;
                            if (countdown === 0) {
                                clearInterval(interval);
                                const resendLink = document.createElement('span');
                                resendLink.classList.add('resend-link');
                                resendLink.textContent = 'Gửi lại OTP';
                                resendLink.addEventListener('click', resendOTP);
                                resendDiv.innerHTML = '';
                                resendDiv.appendChild(resendLink);
                            }
                        }, 1000);
                    }).catch(error => {
                        resendMessage.textContent = 'Có lỗi xảy ra, vui lòng thử lại.'; // Thông báo lỗi
                        if (resendLink) {
                            resendLink.style.pointerEvents = 'auto'; // Kích hoạt lại liên kết
                        }
                    });
                }
            });

        </script>
    </body>
</html>
