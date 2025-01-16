<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>Đăng Ký</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
    <style>
        .dang-ki {
            background-image: url(https://hpconnect.vn/wp-content/uploads/2020/02/H%C3%ACnh-%E1%BA%A3nh-phong-c%E1%BA%A3nh-thi%C3%AAn-nhi%C3%AAn-31.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .sub-main-w3 {
            background: #fff;
            padding: 40px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
            border-radius: 8px;
            font-family: 'Open Sans', sans-serif;
        }

        .wthree-pro h2 {
            text-align: center;
            font-size: 1.5rem;
            color: #333;
        }

        .pom-agile {
            position: relative;
            margin: 20px 5px 5px 5px;
        }

        .pom-agile input,
        .pom-agile select {
            width: 93%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .sub-w3l {
            display: flex;
            justify-content: center; /* Căn giữa cho nút đăng ký */
            align-items: center;
        }

        .right-w3l input[type="submit"] {
            margin-top: 10px;
            width: 100%; /* Chiều rộng 100% của container */
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            background-color: limegreen;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .right-w3l input[type="submit"]:hover {
            background-color: darkgreen;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        .footer p {
            font-size: 14px;
        }

        .formDN a {
            text-decoration: none;
            color: #007bff;
        }

        .formDN a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<div class="dang-ki">
    <div class="sub-main-w3">
        <div class="wthree-pro">
            <h2>ĐĂNG KÝ</h2>
        </div>
        <form action="${pageContext.request.contextPath}/dang-nhap/dang-ki" method="post">
            <div class="pom-agile">
                <input placeholder="Tên" name="tenKhachHang" type="text" required>
            </div>
            <div class="pom-agile">
                <input placeholder="Ngày Sinh" name="ngaySinh" type="date" required>
            </div>
            <div class="pom-agile">
                <select name="gioiTinh" required>
                    <option value="" disabled selected>Chọn Giới Tính</option>
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                </select>
            </div>
            <div class="pom-agile">
                <input placeholder="SĐT" name="sdt" type="text" required>
            </div>
            <div class="pom-agile">
                <input placeholder="Địa Chỉ" name="diaChi" type="text" required>
            </div>
            <div class="pom-agile">
                <input placeholder="Email" name="email" type="email" required>
            </div>
            <div class="pom-agile">
                <input placeholder="Mật Khẩu" name="matKhau" type="password" required>
            </div>
            <div class="sub-w3l">
                <div class="right-w3l">
                    <input type="submit" value="Đăng Ký">
                </div>
            </div>
        </form>
        <div style="text-align: center; margin-top: 20px">
            <a href="${pageContext.request.contextPath}/dang-nhap/login">Đã có tài khoản? Đăng Nhập</a>
        </div>
    </div>
</div>
</body>
</html>