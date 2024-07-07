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
                    <form>
                        <div class="products">
                            <h3 class="title">Checkout</h3>
                            
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
                                <span class="price" name="amount" id="total-amount">${amount} VND</span>
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
                            <button type="button" class="btn btn-primary btn-block">Proceed</button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                var userPoints = 50; // User's available points

                function calculateDiscount(points) {
                    var discount = 0;
                    if (points >= 20) {
                        discount += Math.floor(points / 20) * 1.5; // Discount for every 20 points is $1.5
                        points %= 20;
                    }
                    if (points >= 10) {
                        discount += Math.floor(points / 10); // Discount for every 10 points is $1
                    }
                    return discount;
                }

                $('#apply-points').click(function () {
                    var totalAmount = 320; // Initial total amount
                    var pointsToUse = Math.min(userPoints, 20 + Math.floor((totalAmount / 1.5) * 20));
                    var discount = calculateDiscount(pointsToUse);
                    var newTotal = totalAmount - discount;
                    if (newTotal < 0)
                        newTotal = 0;
                    $('#total-amount').text('$' + newTotal.toFixed(2));

                    userPoints -= pointsToUse;
                    $('#available-points').text(userPoints);
                    console.log('Remaining points:', userPoints);
                });
            });
        </script>
    </body>
</html>

