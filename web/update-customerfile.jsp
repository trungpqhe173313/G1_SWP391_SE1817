

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <style>
        body {
             background: 
                linear-gradient(45deg, #D08C83 25%, transparent 25%, transparent 75%, #D08C83 75%, #D08C83),
                linear-gradient(-45deg, #FFC0CB 25%, transparent 25%, transparent 75%, #FFC0CB 75%, #FFC0CB);
            background-size: 150px 150px; /* Điều chỉnh kích thước của các ô nhỏ */
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-size: 18px;
            }

        h1 {
            color: #ffd700; /* Màu vàng */
        }

        h3 {
            margin-bottom: 20px;
        }

        .Part {
            background-color: #ffd700; /* Màu vàng */
            color: black;
        }

        table{
            border-collapse: collapse;
            width: 40%;
            margin-top: 20px;
            border: 2px solid black; /* Khung table màu đen */
            background-color: white;
            margin-right: 20px; /* Khoảng cách giữa hai bảng */
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .avatar-table {
            width: 40%;
            margin-top: 20px;
            border: 2px solid black; /* Khung table màu đen */
            background-color: #FFC0CB;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .avatar-placeholder {
            background-color: #D08C83;
            border-radius: 50%;
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .ava, .id, .phone, .password, .name, .email, .gen {
            color: #D08C83; 
        }

        .btn-primary {
            background-color: #ffd700; /* Màu vàng */
            border: none;
            color: black; /* Chữ màu đen */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #c0c000; /* Màu vàng nhạt khi di chuột vào */
            cursor: pointer;
        }
        
        
        .radio-label {
            color: black; /* Màu chữ đen */
        }
    </style>
</head>
<body>
    <form action="customerupdate"method="POST" enctype="multipart/form-data">
        <div style="display: flex;">
            <table>
                <tr>
                    <td class="id">ID</td>
                    <td>
                        <input type="text" readonly="" name="id" value="${account.id}">
                    </td>
                </tr>
                <tr>
                    <td class="phone">Phone number</td>
                    <td>
                        <input type="text" readonly="" value="${account.phone}">
                    </td>
                </tr>
                <tr>
                    <td class="password">Password</td>
                    <td>
                        <input type="text" readonly="" value="${account.password}">
                    </td>
                </tr>
                <tr>
                    <td class="name">Full Name</td>
                    <td>
                        <input type="text" name="fullName" value="${account.fullName}">
                    </td>
                </tr>
                <tr>
                    <td class="email">Email</td>
                    <td>
                        <input type="text" name="email" value="${account.email}">
                    </td>
                </tr>
                <tr>
                    <td class="gen">Gender</td>
                    <td>
                        <label class="radio-label"><input type="radio" name="isMale" value="Male" ${account.isMale?"checked=\"checked\"":""}> Male </label>
                        <label class="radio-label"><input type="radio" name="isMale" value="Female" ${!account.isMale?"checked=\"checked\"":""}> Female </label>
                    </td>
                </tr>
            </table>
            <div class="avatar-table">
                <div class="avatar-placeholder">
                    <img src="${c.avatar != null ? c.avatar : 'default-avatar.png'}"  style="width: 100%; height: 100%; border-radius: 50%;">
                </div>
                <input type="file" name="avatar" accept="image/*">
            </div>
        </div>
        <button class="btn-primary" type="submit">Update</button>
    </form>
</body>
</html>
