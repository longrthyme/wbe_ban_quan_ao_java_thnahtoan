<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #1c1e22;
            color: white;
        }

        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .sidebar ul {
            padding: 0;
            list-style: none;
        }

        .sidebar ul li {
            margin: 1rem 0;
        }

        .sidebar ul li a {
            color: white;
            display: block;
            padding: 10px 20px;
            text-decoration: none
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .sidebar .nav-link.active {
            background-color: #495057;
        }

        .navbar {
            margin-left: 250px;
            background-color: #212529;
        }

        .navbar-nav {
            width: 100%;
            justify-content: flex-end;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
        }

        table {
            background-color: #343a40;
            color: white;
        }

        table thead {
            background-color: #495057;
        }

        table tbody tr {
            border-top: 1px solid #dee2e6;
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        ko {
            font-family: Arial, sans-serif;
            margin: 0px;
            padding: 0;
        }

        /* ok */
        .ok {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: black;
            padding: 10px 20px;
            color: white;
            position: relative;
        }

        .ok-left {
            display: flex;
            align-items: center;
        }

        .ok-left img {
            height: 50px;
        }

        .ok-center {
            display: flex;
            align-items: center;
            flex-grow: 1;
            justify-content: center;
        }

        .search-bar {
            display: flex;
        }

        .search-bar input {
            width: 400px;
            padding: 10px;
            border-radius: 5px;
            /* Giảm bo tròn */
            border: 1px solid #ccc;
        }

        .search-button {
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            ransition: background-color 0.3s, transform 0.2s;
        }

        .search-button:hover {
            background-color: red;
            transform: scale(1.05);
        }

        .ok-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .ok-right a {
            color: white;
            font-size: 20px;
            position: relative;
        }

        .ok-right a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }

        .ok-right a span {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: red;
            color: white;
            padding: 3px 6px;
            border-radius: 50%;
            font-size: 12px;
        }

        @keyframes slide {
            0% {
                transform: translateX(-100%);
            }

            100% {
                transform: translateX(120%);
            }
        }

        .discount-banner-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 40px;
            background-color: white;
            border-bottom: 1px solid #ddd;
            overflow: hidden;
            z-index: 9998;
        }

        .discount-banner {
            position: absolute;
            white-space: nowrap;
            font-size: 14px;
            color: black;
            padding: 10px 0;
            animation: slide 10s linear infinite;
        }

        @keyframes slide {
            0% {
                transform: translateX(-100%);
            }

            100% {
                transform: translateX(90%);
            }
        }


        .ok {
            margin-top: 40px;
        }

        .main-content {
            display: flex;
            padding: 20px;
        }

        .k {
            width: 20%;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .filter-header {
            display: flex;
            align-items: center;
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
        }

        .filter-header i {
            margin-right: 10px;
            color: #333;
            font-size: 24px;
        }

        .filter-category {
            margin-bottom: 20px;
            cursor: pointer;
        }

        .filter-category h4 {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .filter-category h4 i {
            margin-right: 10px;
        }

        .filter-options {
            display: none;
            padding-left: 20px;
            margin-top: 10px;
        }

        .filter-options input {
            margin-right: 10px;
        }

        .filter-options label {
            display: block;
            margin-bottom: 5px;
        }

        /*.product-card {*/
        /*    border: 1px solid #ddd;*/
        /*    border-radius: 10px;*/
        /*    overflow: hidden;*/
        /*    background-color: white;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*    transition: transform 0.3s, box-shadow 0.3s;*/
        /*}*/

        /*.product-card:hover {*/
        /*    transform: translateY(-5px);*/
        /*    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);*/
        /*}*/

        /*.product-card img {*/
        /*    width: 100%;*/
        /*    height: auto;*/
        /*    border-bottom: 1px solid #ddd;*/
        /*    transition: transform 0.3s;*/
        /*}*/

        /*.product-card img:hover {*/
        /*    transform: scale(1.05);*/
        /*}*/

        .product-card {
            margin-left: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
            /*border: 10px solid #ddd;*/
            border-radius: 10px;
            padding: 0;
            text-align: center;
            position: relative;
            box-sizing: border-box;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card img {
            width: 100%;
            height: 500px;
            object-fit: cover;
        }

        .product-card:hover {
            /*transform: scale(1.05);*/
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .product-name {
            color: black;
            transition: color 0.3s;
        }

        .product-card:hover {
            color: red;
        }

        .product-grid {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 0 auto;
        }

        .product-discount {
            background-color: red;
            color: white;
            padding: 5px;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 12px;
            border-radius: 5px;
        }

        .old-price {
            text-decoration: line-through;
            color: #888;
        }

        .new-price {
            color: red;
            font-weight: bold;
        }

        .product-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 10px;
        }

        .buy-now-button,
        .add-to-cart-button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .buy-now-button {
            background-color: red;
            color: white;
        }

        .buy-now-button:hover {
            background-color: darkred;
            transform: scale(1.05);
        }

        .add-to-cart-button {
            background-color: #0066CC;
            color: white;
        }

        .add-to-cart-button:hover {
            background-color: darkgreen;
            transform: scale(1.05);
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 50px;
            right: 20px;
            background-color: white;
            border: 1px solid #ccc;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            border-radius: 5px;
        }

        .dropdown-menu a {
            display: block;
            color: black;
            text-decoration: none;
            padding: 8px 0;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        .dropdown-menu button {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            text-align: left;
            margin-bottom: 10px;
        }

        .dropdown-menu button:last-child {
            margin-bottom: 0;
        }


        .dropdown-menu button:hover {
            background-color: red;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
        }

        function confirmAdd() {
            return confirm("Bạn có chắc chắn muốn thêm sản phẩm này không?");
        }

        function confirmSearch() {
            return confirm("Bạn có chắc chắn muốn tìm kiếm không?");
        }

        function toggleDropdown() {
            const dropdown = document.getElementById('profile-dropdown');
            dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        }


        window.onclick = function (event) {
            if (!event.target.matches('.fa-user')) {
                const dropdown = document.getElementById('profile-dropdown');
                if (dropdown.style.display === 'block') {
                    dropdown.style.display = 'none';
                }
            }
        }

        function toggleFilter(id) {
            const filterOptions = document.getElementById(id);
            filterOptions.style.display = filterOptions.style.display === "none" || filterOptions.style.display === "" ? "block" : "none";
        }

        function searchProducts() {
            alert("Chờ update nhé !!");
        }
    </script>

</head>

<body>
<!-- Sidebar -->
<div class="sidebar p-3" id="sidebar">
    <h4 class="text-center">Lifestyle</h4>
    <hr>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="/home/index"><i class="fas fa-home"></i> <span class="link-text">Trang chủ</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-chart-bar"></i> <span class="link-text">Thống kê</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ban-hang/ban-hang"><i class="bi bi-coin"></i> <span class="link-text">Bán hàng</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/san-pham/index"><i class="fas fa-box-open"></i> <span class="link-text">Sản phẩm</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/nhan-vien/index"><i class="fas fa-users"></i> <span class="link-text">Nhân viên</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="/khach-hang/index"><i class="fas fa-user"></i> <span class="link-text">Khách hàng</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-cogs"></i> <span class="link-text">Thiết lập</span></a>
        </li>
    </ul>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <span class="sidebar-toggler text-white me-3" onclick="toggleSidebar()">&#9776;</span>
        <a class="navbar-brand" href="#">Lifestyle</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Đăng nhập</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giỏ hàng</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="content" id="content">
    <div class="container">
        <ko>

<%--            <!-- Thanh chạy ngang với mã giảm giá -->--%>
<%--             <div class="discount-banner-container">--%>
<%--             <div class="discount-banner">--%>
<%--             VOUCHER 10K CHO ĐƠN 99K | VOUCHER 50K CHO ĐƠN 799K | FREESHIP MỌI ĐƠN TỪ 399K--%>
<%--             </div>--%>
<%--             </div>--%>


            <!-- ok -->
            <div class="ok">
                <div class="ok-left">
                    <img src="${pageContext.request.contextPath}/images/Logo.jpg"
                         alt="Style life">
                    <span>
                                                <a href="/home/index"
                                                   style="text-decoration: none; color: white; font-size: 20px; margin-left: 10px;">Style
                                                    Life</a>
                                            </span>
                </div>
                <div class="ok-center">
                    <div class="search-bar">
                        <input type="text" placeholder="Bạn cần tìm gì?">
                    </div>
                    <button class="search-button" onclick="searchProducts()">Tìm Kiếm</button>
                </div>
                <div class="ok-right">
                    <a href="#" onclick="toggleDropdown()"><i class="fas fa-user"></i></a>
                    <div id="profile-dropdown" class="dropdown-menu">
                        <button onclick="window.location.href='/login'">Đăng Nhập</button>
                        <button onclick="window.location.href='/register'">Đăng Ký</button>
                    </div>

                    <a href="#"><i class="fas fa-bell"></i><span>4</span></a> <!-- Thông báo -->
                    <a href="/home/cart"><i class="fas fa-shopping-cart"></i><span>0</span></a>
                    <!-- Giỏ hàng -->
                </div>

            </div>

            <div class="main-content">
                <div class="khong">
<%--                    <h3 class="filter-header"><i class="fas fa-filter"></i> Bộ lọc</h3>--%>
<%--                    <div class="filter-category" onclick="toggleFilter('filter-color')">--%>
<%--                        <h4><i class="fas fa-palette"></i> Màu Sắc <i--%>
<%--                                class="fas fa-chevron-down"></i></h4>--%>
<%--                        <div class="filter-options" id="filter-color">--%>
<%--                            <label><input type="checkbox" value="Đỏ"> Đỏ</label>--%>
<%--                            <label><input type="checkbox" value="Xanh"> Xanh</label>--%>
<%--                            <label><input type="checkbox" value="Vàng"> Vàng</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="filter-category" onclick="toggleFilter('filter-size')">--%>
<%--                        <h4><i class="fas fa-ruler-combined"></i> Kích Cỡ <i--%>
<%--                                class="fas fa-chevron-down"></i></h4>--%>
<%--                        <div class="filter-options" id="filter-size">--%>
<%--                            <label><input type="checkbox" value="S"> S</label>--%>
<%--                            <label><input type="checkbox" value="M"> M</label>--%>
<%--                            <label><input type="checkbox" value="L"> L</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="filter-category" onclick="toggleFilter('filter-style')">--%>
<%--                        <h4><i class="fas fa-tshirt"></i> Kiểu Dáng <i--%>
<%--                                class="fas fa-chevron-down"></i></h4>--%>
<%--                        <div class="filter-options" id="filter-style">--%>
<%--                            <label><input type="checkbox" value="Basic"> Basic</label>--%>
<%--                            <label><input type="checkbox" value="Oversize"> Oversize</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="filter-category" onclick="toggleFilter('filter-design')">--%>
<%--                        <h4><i class="fas fa-pen-nib"></i> Thiết Kế <i--%>
<%--                                class="fas fa-chevron-down"></i></h4>--%>
<%--                        <div class="filter-options" id="filter-design">--%>
<%--                            <label><input type="checkbox" value="In Hình"> In Hình</label>--%>
<%--                            <label><input type="checkbox" value="Trơn"> Trơn</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>



                <div class="product-grid">
                    <c:forEach var="home" items="${homes}">
                        <div class="product-card">
                            <span class="product-discount">${home.discount}%</span>
                            <img src="${home.imageUrl}" alt="${home.name}">
                            <h3>${home.name}</h3>
                            <p>${home.description}</p>
                            <p class="old-price">₫${home.price}</p>
                            <p class="new-price">₫${home.price * (1 - home.discount / 100)}</p>

                            <div class="product-buttons">
                                <button onclick="buyNow(${home.id})" class="buy-now-button">Mua
                                    Ngay</button>
                                <button onclick="addToCart(${home.id})"
                                        class="add-to-cart-button">Thêm vào Giỏ Hàng</button>

                            </div>
                            <br>
                        </div>
                    </c:forEach>
                </div>

            </div>


        </ko>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>