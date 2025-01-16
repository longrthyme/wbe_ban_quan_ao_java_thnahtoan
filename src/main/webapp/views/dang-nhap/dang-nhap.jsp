<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>Online Login Form Responsive Widget Template :: w3layouts</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Online Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS -->
    <link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- online-fonts -->
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext" rel="stylesheet">
    <!-- //online-fonts -->
    <style>
        .dang-nhap {
            background-image: url(https://hpconnect.vn/wp-content/uploads/2020/02/H%C3%ACnh-%E1%BA%A3nh-phong-c%E1%BA%A3nh-thi%C3%AAn-nhi%C3%AAn-31.jpg);
            background-size: cover;  /* Set the size of the background image */
            background-position: center;     /* Center the image horizontally and vertically */
            background-repeat: no-repeat;    /* Prevent repeating the image */
            height: 100vh;
            justify-content: center;         /* Center horizontally */
            align-items: center;
            margin: 0;
            padding: 0;       /* Center vertically */
        }

        .center-container {
            padding-top: 0; /* Xóa padding-top cũ */
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: -200px; /* Di chuyển lên trên 200px */
        }


        .header-w3l h1 {
            padding-top: 70px;  /* Add 30px of space above the text */
            text-align: center;
            font-size: 2.5rem;
            color: #fff;
        }


        .main-content-agile {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
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

        .pom-agile input {
            width: 93%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .icon1, .icon2 {
            position: absolute;
            margin-top: -30px;
            margin-left: 10px;
        }

        .sub-w3l {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .right-w3l input[type="submit"] {
            margin-top: 10px;
            margin-left: 5px;
            width: 311%;               /* Đặt chiều rộng bằng 100% của container */
            padding: 12px;             /* Giống với padding của các ô input */
            font-size: 16px;           /* Giống với font-size của các ô input */
            border: none;              /* Xóa viền mặc định */
            border-radius: 4px;        /* Đặt border-radius giống với các ô input */
            background-color: limegreen;     /* Đặt màu xanh lá cây đậm */
            color: #fff;               /* Chữ màu trắng */
            cursor: pointer;           /* Hiển thị con trỏ chuột khi hover */
            transition: background-color 0.3s ease; /* Hiệu ứng chuyển đổi màu */
        }

        .right-w3l input[type="submit"]:hover {
            background-color: limegreen;
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
<div class="dang-nhap">
    <!-- Header -->
    <div class="header-w3l">
        <h1>LIFE STYLE</h1>
    </div>

    <!-- Main Content -->
    <div class="center-container">
        <div class="sub-main-w3">
            <div class="wthree-pro">
                <h2>ĐĂNG NHẬP </h2>
            </div>
            <form action="/dang-nhap/login" method="post">
                <div class="pom-agile">
                    <input placeholder="E-mail" name="email" class="user" type="email" required>
                    <span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span>
                </div>
                <div class="pom-agile">
                    <input placeholder="Mật Khẩu" name="matKhau" class="pass" type="password" required>
                    <span class="icon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                </div>
                <div class="sub-w3l">
                    <div class="right-w3l">
                        <input type="submit" value="Đăng Nhập">
                    </div>
                </div>
            </form>
        <div style="text-align: center; margin-top: 20px">
            <a href="#">Quên mật khẩu? </a>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/dang-nhap/dang-ki">Chưa có tài khoản? Đăng Ký</a>

        </div>
        </div>
    </div>
</div>
</body>
</html>
