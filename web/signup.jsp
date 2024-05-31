
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <title>JSP Page</title>
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
                                            
                                            
                                            <form action="signup"method="post">
                                                <p>Please input your information</p>
                                                
                                                
                                                 <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Phone number</label>
                                                    <input type="text" required name="phone" class="form-control"/>
                                                </div>
                                                <p class="text-danger">${error2}</p>
                                                <p class="text-danger">${error3}</p>
                                                
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Password</label>
                                                    <input type="text" required name="password"  class="form-control" />
                                                </div>
                                                <p class="text-danger">${error1}</p>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Confirm password</label>
                                                    <input type="password" required name="re_pass"  class="form-control" />
                                                    
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Full Name</label>
                                                    <input type="text" required name="fullName"  class="form-control" />
                                                    
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Email</label>
                                                    <input type="text" required name="email"  class="form-control" />
                                                    
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Avatar</label>
                                                    <input type="text" name="avatar"  class="form-control" />
                                                    
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label"style="color: #ffaf00">Gender</label>
                                                    <div>
                                                        <label><input type="radio" name="isMale" value="true" required> Male</label>
                                                        <label><input type="radio" name="isMale" value="false" required> Female</label>
                                                    </div>
                                                </div>
                                                
                                                
                                                <div class="text-center pt-1 mb-5 pb-1"style="color: white">
                                                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">Create new account</button>

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
