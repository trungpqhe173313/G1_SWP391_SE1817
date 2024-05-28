
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <title>JSP Page</title>
        <stype>
       
    </stype>
    </head>
    
    <body>
        
        <section class="h-100 gradient-form" style="background-color: #000;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-12">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-md-left">
                                            <a href="home" style="color: #ffaf00"> Return to Home </a>
                                        </div>
                                        <div class="text-center">
                                            <img src=""
                                                 style="width: 185px" alt="logo">
                                        </div>
                                            <p class="text-danger">${error}</p>

                                        <form action="login" method="post">
                                            
                                            <p>Please login to your account</p>

                                            <div class="form-outline mb-4">
                                                <label class="form-label"style="color: #ffaf00">Phone</label>
                                                <input type="text" required name="phone" class="form-control"/>
                                                
                                            </div>

                                            <div class="form-outline mb-4">
                                                <label class="form-label"style="color: #ffaf00">Password</label>
                                                <input type="password" required name="password"  class="form-control" />
                                                
                                            </div>

                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit"style="background: linear-gradient(45deg, #ffd700, #ffec5e); color: white;">Log
                                                    in</button>
                                                <a class="text-muted" href="sendmail" style="color: #FFA500">Forgot password?</a>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2 mr-5"style="color: #FFA500">Don't have an account?</p>
                                                
                                                <a href="signup"style="color: #000"/> Create new account
                                            </div>

                                            

                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
