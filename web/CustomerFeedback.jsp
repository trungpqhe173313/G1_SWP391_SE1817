<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đánh giá</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>

            body{
                background: #EBE8DE;
            }
            .contact-form{
                background: #fff;
                margin-top: 10%;
                margin-bottom: 5%;
                width: 70%;
            }
            .contact-form .form-control{
                border-radius: 5px;
            }
            .contact-image{
                text-align: center;
            }
            .contact-image img{
                border-radius: 6rem;
                width: 11%;
                margin-top: -3%;
                transform: rotate(29deg);
            }
            .contact-form form{
                padding: 14%;
            }

            .contact-form h3{
                margin-bottom: 8%;
                margin-top: -10%;
                text-align: center;
                color: #0062cc;
            }

            .contact-form form .row{
                margin-bottom: -7%;
            }
            .contact-form .btnContact {
                width: 50%;
                border: none;
                border-radius: 5px;
                padding: 1.5%;
                background: #dc3545;
                font-weight: 600;
                color: #fff;
                cursor: pointer;
            }
            .btnContactSubmit
            {
                width: 50%;
                border-radius: 5px;
                padding: 1.5%;
                color: #fff;
                background-color: #0062cc;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form method="post" action="cusfeedback">
                <h3>Đánh giá dịch vụ</h3>
                <div class="form-group">
                    <textarea name="noidung" class="form-control" placeholder="Đánh giá của bạn *"  style="width: 100%; height: 150px;"></textarea>

                </div>
                <div class="col-md-6">
                    <input type="submit" name="btnSubmit" class="btnContact" value="Gửi" />
                    <br>
                    <a href="home"><- Quay lại trang chủ </a>
                </div>



            </form>
        </div>
    </body>
</html>
