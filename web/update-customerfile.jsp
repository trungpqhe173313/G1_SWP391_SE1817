

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Profile</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #CC99FF;
        }
 
        h3 {
            margin-bottom: 20px;
        }
        .Part{
            background-color: #66CCFF;
            color: white;
        }
        
        table {
            border-collapse: collapse;
            width: 40%;
            margin-top: 20px;
        }
 
        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        
        .name{
            color: #6699CC;
        }
        
        
    </style>    
    </head>
    <body>
        <c:set var="c" value="${sessionScope.account}" />
        <form action="customerupdate" method="POST">
            <table>
            <tr>
                <td class="id" >ID</td>
                <td>
                    <input readonly="" value="${c.id}">
                </td>
            </tr>
            
            <tr>
                <td class="phone" >Phone</td>
                <td>
                    <input readonly=""  value="${c.phone}">
                </td>
            </tr>
            
            <tr>
                <td class="password">Password</td>
                <td>
                    <input readonly=""  value="${c.password}">
                </td>
            </tr>
            
            <tr>
                <td class="name">Full Name</td>
                <td>
                    <input type="text" name="fullName" value="${c.fullName}">
                </td>
            </tr>
            
            <tr>
                <td class="ava">Email</td>
                <td>
                    <input type="text" name="email" value="${c.email}">
                </td>
            </tr>
            
            <tr>
                <td class="mail">Avatar</td>
                <td>
                    <input type="text" name="avatar:" value="${c.avatar}">
                </td>
            </tr>
            
            <tr>
                <td class="gen">Gender</td>
                <td>
                    <label><input type="radio" name="isMale" value="${c.isMale}" required> Male</label>
                    <label><input type="radio" name="isMale" value="${c.isMale}" required> Female</label>
                </td>
            </tr>
            
            
          
               
            
        </table>
        <td><button type="submit" value="Update">Update</button></td> 
        </form>
    </body>
</html>
