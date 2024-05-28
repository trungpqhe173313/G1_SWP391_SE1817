
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="signup">
            <section class="h-100 gradient-form" style="background-color: #eee;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-xl-10">
                            <div class="card rounded-3 text-black">
                                <div class="row g-0">
                                    <div class="col-lg-12">
                                        <div class="card-body p-md-5 mx-md-4">
                                            <div class="text-md-left">
                                                <a href="homepage" style="color: black"> Return to Home </a>
                                            </div>
                                            <div class="text-center">
                                                <img src=""
                                                     style="width: 185px" alt="logo">
                                            </div>
                                            <p class="text-danger">${error}</p>
                                            
                                            <form>
                                                <p>Please input your information</p>
                                                
                                               
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="phone" class="form-control"/>
                                                    <label class="form-label">Phone number</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="password"  class="form-control" />
                                                    <label class="form-label">Password</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="pass"  class="form-control" />
                                                    <label class="form-label">Confirm password</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="fullName"  class="form-control" />
                                                    <label class="form-label">Full Name</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="email"  class="form-control" />
                                                    <label class="form-label">Email</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <input type="text" required name="avatar"  class="form-control" />
                                                    <label class="form-label">Avatar</label>
                                                </div>
                                                
                                                <div class="form-outline mb-4">
                                                    <label class="form-label">Gender</label>
                                                    <div>
                                                        <input type="radio" id="male" name="isMale" value="1" required>
                                                        <label for="male">Male</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" id="female" name="isMale" value="0" required>
                                                        <label for="female">Female</label>
                                                    </div>
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <label class="form-label">Role ID</label>
                                                    <div>
                                                        <input type="radio" id="customer" name="roleId" value="2" required>
                                                        <label for="customer">Customer</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" id="barber" name="roleId" value="4" required>
                                                        <label for="barber">Barber</label>
                                                    </div>
                                                    
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <label class="form-label">Active Status</label>
                                                    <select required name="isActive" class="form-select">
                                                        <option value="1">Active</option>
                                                    </select>
                                                    
                                                </div>
                                                
                                                <div class="text-center pt-1 mb-5 pb-1">
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
        </form>

    </body>
</html>
