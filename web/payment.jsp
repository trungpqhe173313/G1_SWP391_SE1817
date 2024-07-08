<%-- 
    Document   : payment
    Created on : Jul 7, 2024, 1:09:53 AM
    Author     : phamt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="css/payment.css">
        <style>
            .points {
                background: #f8f9fa;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
            }
            .points .form-group {
                margin-bottom: 10px;
            }
            .points .btn-secondary {
                width: 100%;
            }
            .points .error-message {
                color: red;
                margin-top: 10px;
                display: none;
            }
            .payment-method, .card-details, .cash-details, .bank-transfer-details {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <main class="page payment-page">
            <section class="payment-form dark">
                <div class="container">
                    <div class="block-heading text-center">
                        <h2>Payment</h2>
                    </div>
                    <form action="ajaxservlet" method="post">
                        <div class="products">
                            <h3 class="title">Checkout</h3>
                            <input type="hidden" name="codeOrder" value="${codeOrder}">
                            <c:forEach items="${ls}" var="ls">
                                <div class="item d-flex justify-content-between">
                                    <div>
                                        <p class="item-name">${ls.name}</p>
                                    </div>
                                    <span class="price">${ls.price} VND</span>
                                </div>
                            </c:forEach>

                            <div class="total d-flex justify-content-between">
                                <span>Total</span>
                                <span class="price" id="total-amount">${amount} VND</span>
                                <input type="hidden" name="amount" id="total-amount-hidden" value="${amount}">
                            </div>
                        </div>
                        <div class="points">
                            <h3 class="title">Use Points</h3>
                            <div class="form-group">
                                <p>You have <span id="available-points">${cus.account.point}</span> points available. Maximum discount will be applied automatically.</p>
                                <button type="button" class="btn btn-secondary mt-2" id="apply-points">Apply Points</button>
                                <div class="error-message" id="error-message">Please enter a valid number of points.</div>
                            </div>
                        </div>
                        <div class="form-group col-sm-12 mt-4">
                            <button type="submit" class="btn btn-primary btn-block">Proceed</button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#apply-points').click(function () {
                    var userPoints = parseInt(document.getElementById('available-points').innerText); // Số điểm hiện có của người dùng
                    var totalAmount = parseInt(document.getElementById('total-amount').innerText); // Tổng số tiền ban đầu

                    $.ajax({
                        url: 'calculateDiscount',
                        type: 'POST',
                        data: {
                            points: userPoints,
                            totalAmount: totalAmount
                        },
                        success: function (response) {
                            // Kiểm tra xem response có phải là một đối tượng không
                            if (typeof response === 'string') {
                                response = JSON.parse(response);
                            }
                            $('#total-amount').text(response.newTotal + ' VND');
                            $('#total-amount-hidden').val(response.newTotal);
                            $('#available-points').text(response.newPoints);
                            console.log('Số điểm còn lại:', response.newPoints);
                        },
                        error: function (xhr, status, error) {
                            console.error('Lỗi:', error);
                        }
                    });
                });
            });
        </script>
    </body>
</html>

