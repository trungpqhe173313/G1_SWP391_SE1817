

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
            background: 
                    linear-gradient(45deg, #000000 25%, transparent 25%, transparent 75%, #000000 75%, #000000),
                    linear-gradient(-45deg, #000000 25%, transparent 25%, transparent 75%, #000000 75%, #000000);
            background-size: 150px 150px; /* Điều chỉnh kích thước của các ô nhỏ */
            color: #fff;
        }

        h1 {
            color: #ffd700; /* Màu vàng */
        }

        h3 {
            margin-bottom: 20px;
        }

        .Part {
            background-color: #ffd700; /* Màu vàng */
            color: white;
        }

        table{
            border-collapse: collapse;
            width: 40%;
            margin-top: 20px;
            border: 2px solid black; /* Khung table màu đen */
            background-color: navy
        }
        

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .ava{
            color: #ffd700; /* Màu vàng */
        }
        .id{
            color: #ffd700; /* Màu vàng */
        }
        .phone{
            color: #ffd700; /* Màu vàng */
        }
        .password{
            color: #ffd700; /* Màu vàng */
        }
        .name{
            color: #ffd700; /* Màu vàng */
        }
        .email{
            color: #ffd700; /* Màu vàng */
        }
        .gen{
            color: #ffd700; /* Màu vàng */
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

        
    </style>
</head>
<body>
    <c:set var="c" value="${sessionScope.account}" />
    <form action="customerupdate" method="POST">
        <table >
            <tr>
                <td class="ava">Avatar</td>
                <td>
                    <!-- Thay đổi input thành type="file" để cho phép tải ảnh lên -->
                    <input type="file" name="avatar:" accept="image/*">
                </td>
            </tr>
        
            <tr>
                <td class="id">ID</td>
                <td>
                    <input readonly="" name="id" value="${c.id}">
                </td>
            </tr>
            <tr>
                <td class="phone">Phone</td>
                <td>
                    <input readonly="" value="${c.phone}">
                </td>
            </tr>
            <tr>
                <td class="password">Password</td>
                <td>
                    <input readonly="" value="${c.password}">
                </td>
            </tr>
            <tr>
                <td class="name">Full Name</td>
                <td>
                    <input type="text" name="fullName" value="${c.fullName}">
                </td>
            </tr>
            <tr>
                <td class="email">Email</td>
                <td>
                    <input type="text" name="email" value="${c.email}">
                </td>
            </tr>
            <tr>
                <td class="gen">Gender</td>
                <td>
                    <label><input type="radio" name="isMale" style="color: rgba" value="${c.isMale}" required > Male</label>
                    <label><input type="radio" name="isMale" style="color: rgba" value="${c.isMale}" required> Female</label>
                </td>
            </tr>
        </table>
        <button class="btn-primary" type="submit">Update</button>
    </form>
</body>
</html>
