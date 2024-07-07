<%-- 
    Document   : vnpay_return
    Created on : Jul 5, 2024, 3:44:20 PM
    Author     : phamt
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KẾT QUẢ THANH TOÁN</title>
    <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
    <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
    <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        .container h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }
        .container img {
            width: 120px;
            height: 120px;
            margin-bottom: 20px;
        }
        .container p {
            margin: 10px 0;
            color: #333;
        }
        .info {
            text-align: left;
            margin: 20px 0;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 10px;
        }
        .info p {
            margin: 5px 0;
            display: flex;
            justify-content: space-between;
        }
        .info .amount {
            color: #e60012;
            font-weight: bold;
        }
        .info .highlight {
            color: #e60012;
            font-weight: bold;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #999;
        }
        .footer p {
            margin: 5px 0;
        }
        .btn-container {
            margin-top: 20px;
        }
        .btn-container a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e60012;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-container a:hover {
            background-color: #c8000f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>KẾT QUẢ THANH TOÁN</h1>
        <img src="img/cksucces.png" alt="Success">
        <p>Thanh toán thành công</p>
        
        <%
            Map<String, String> fields = new HashMap<>();
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode(params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if (fieldValue != null && fieldValue.length() > 0) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            fields.remove("vnp_SecureHashType");
            fields.remove("vnp_SecureHash");

            String signValue = Config.hashAllFields(fields);
        %>
        <div class="info">
            <p><span>Mã giao dịch thanh toán:</span> <span class="highlight"><%=request.getParameter("vnp_TxnRef")%></span></p>
            <p><span>Số tiền:</span> <span class="amount"><%=request.getParameter("vnp_Amount")%></span></p>
            <p><span>Mô tả giao dịch:</span> <span><%=request.getParameter("vnp_OrderInfo")%></span></p>
            <p><span>Mã lỗi thanh toán:</span> <span><%=request.getParameter("vnp_ResponseCode")%></span></p>
            <p><span>Mã giao dịch tại CTT VNPAY-QR:</span> <span><%=request.getParameter("vnp_TransactionNo")%></span></p>
            <p><span>Mã ngân hàng thanh toán:</span> <span><%=request.getParameter("vnp_BankCode")%></span></p>
            <p><span>Thời gian thanh toán:</span> <span><%=request.getParameter("vnp_PayDate")%></span></p>
            <p><span>Tình trạng giao dịch:</span> <span>
                <%
                    if (signValue.equals(vnp_SecureHash)) {
                        if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                            out.print("Thành công");
                        } else {
                            out.print("Không thành công");
                        }
                    } else {
                        out.print("invalid signature");
                    }
                %></span>
            </p>
        </div>
        <div class="btn-container">
            <a href="viewOrder">TIẾP TỤC QUẢN LÝ</a>
        </div>
            
    </div>
</body>
</html>
