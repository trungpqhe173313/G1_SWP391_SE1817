<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
    HashMap<String, Integer> voucherMap = (HashMap<String, Integer>) request.getAttribute("voucherMap");
    request.setAttribute("voucherMap", voucherMap); // Đặt lại thuộc tính để JSTL có thể sử dụng
%>
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
            .discount .price {
                color: red; /* Đổi màu chữ của phần tử discount thành màu đỏ */
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
                            <input type="hidden" name="" id="points-hidden" value="${minDiscount.point}">
                            <c:forEach items="${ls}" var="ls">
                                <div class="item d-flex justify-content-between">
                                    <div>
                                        <p class="item-name">${ls.name}</p>
                                    </div>
                                    <span class="price">${ls.price} VND</span>
                                </div>
                            </c:forEach>
                            <c:if test="${not empty voucherMap}">
                                <c:forEach var="entry" items="${voucherMap.entrySet()}">
                                    <div class="discount d-flex justify-content-between">
                                        <div>
                                            <p class="item-name">${entry.key}</p>
                                        </div>
                                        <span class="price">${entry.value} VND</span>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <div class="discount d-flex justify-content-between" id="discount-container" style="display: none;">
                                <div>
                                    <p class="item-name">Discount</p>
                                </div>
                                <span class="price" id="discount-amount">0 VND</span>
                            </div>
                            <div class="total d-flex justify-content-between">
                                <span>Total</span>
                                <span class="price" id="total-amount">${amount} VND</span>
                                <input type="hidden" name="amount" id="total-amount-hidden" value="${amount}">
                            </div>
                        </div>
                        <c:if test="${cus != null}">
                            <div class="points">
                                <h3 class="title">Tích điểm</h3>
                                <div class="form-group">
                                    <input type="hidden" name="points" id="available-points-hidden" value="${cus.account.point}">
                                    <p>Bạn có <span id="available-points">${cus.account.point}</span> Bạn có muốn sử dụng không ?</p>
                                    <button type="button" class="btn btn-secondary mt-2" id="apply-points">Sử dụng</button>
                                    
                                </div>
                            </div>
                        </c:if>

                        <div class="form-group col-sm-12 mt-4">
                            <button type="submit" class="btn btn-primary btn-block">Thanh toán</button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                var pointsApplied = false;
                var minPointsRequired = parseInt(document.getElementById('points-hidden').value);
                $('#apply-points').click(function () {
                    if (pointsApplied) {
                        return;
                    }

                    var userPoints = parseInt(document.getElementById('available-points').innerText); // Số điểm hiện có của người dùng
                    var totalAmount = parseInt(document.getElementById('total-amount').innerText.replace(' VND', '')); // Tổng số tiền ban đầu
                    if (userPoints < minPointsRequired) {
                        alert('Bạn không đủ điểm để áp dụng giảm giá.');
                        return;
                    }
                    $.ajax({
                        url: 'calculateDiscount',
                        type: 'POST',
                        data: {
                            points: userPoints,
                            totalAmount: totalAmount
                        },
                        success: function (response) {
                            if (typeof response === 'string') {
                                response = JSON.parse(response);
                            }
                            var discount = totalAmount - response.newTotal;
                            $('#discount-amount').text(discount + ' VND'); // Hiển thị số tiền trừ
                            $('#total-amount').text(response.newTotal + ' VND'); // Hiển thị tổng tiền sau khi trừ
                            $('#total-amount-hidden').val(response.newTotal);
                            $('#available-points').text(response.newPoints);
                            $('#available-points-hidden').val(response.newPoints);
                            // Hiển thị phần tử discount-container sau khi đã tính toán số tiền trừ
                            $('#discount-container').show();

                            // Vô hiệu hóa nút apply-points và đặt biến cờ
                            $('#apply-points').prop('disabled', true);
                            pointsApplied = true;
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
