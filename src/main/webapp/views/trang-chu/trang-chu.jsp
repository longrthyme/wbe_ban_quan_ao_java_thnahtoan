<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: black;
            padding: 10px 20px;
            color: white;
            position: relative;
        }

        .navbar-left {
            display: flex;
            align-items: center;
        }

        .navbar-left img {
            height: 50px;
        }

        .navbar-center {
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
            border-radius: 5px; /* Giảm bo tròn */
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
        .navbar-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .navbar-right a {
            color: white;
            font-size: 20px;
            position: relative;
        }
        .navbar-right a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }
        .navbar-right a span {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: red;
            color: white;
            padding: 3px 6px;
            border-radius: 50%;
            font-size: 12px;
        }

        /*Thanh chạy ngang*/

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


        .navbar {
            margin-top: 40px;
        }

        .main-content {
            display: flex;
            padding: 20px;
        }

        .sidebar {
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

        .product-card {
            border: none;
            padding: 0;
            text-align: center;
            position: relative;
            box-sizing: border-box;
        }

        .product-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .product-card:hover {
            transform: scale(1.05);
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

        /*Button mua ngay*/
        .buy-now-button, .add-to-cart-button {
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

        /*Button thêm vào giỏ*/
        .add-to-cart-button {
            background-color: #0066CC;
            color: white;
        }

        .add-to-cart-button:hover {
            background-color: darkgreen;
            transform: scale(1.05);
        }

        /*Mũi tên trỏ xuống (Bộ lọc)*/
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

        /*Lọc theo loại*/
        #filter-section {
            margin: 20px;
        }

        #filter-section label {
            display: block;
            margin-bottom: 10px;
        }

        /*Button Apply*/
        #apply-filters {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        #apply-filters:hover {
            background-color: #0056b3;
        }
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        /*Phân trang*/
        .pagination {
            display: flex;
            gap: 10px;
        }

        .pagination a {
            padding: 10px 15px;
            margin: 0;
            text-decoration: none;
            color: black;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .pagination a.active {
            background-color: red;
            color: white;
            pointer-events: none;
        }

        .pagination a:hover {
            background-color: black;
            color: white;
        }

    </style>
</head>
<body>

<!-- Thanh chạy ngang với mã giảm giá -->
<div class="discount-banner-container">
    <div class="discount-banner">
        VOUCHER 10K CHO ĐƠN 99K | VOUCHER 50K CHO ĐƠN 799K | FREESHIP MỌI ĐƠN TỪ 399K
    </div>
</div>

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-left">
        <a href="trang-chu"><img src="${pageContext.request.contextPath}/images/Logo.jpg" alt="Style life"></a>
        <a href="trang-chu"><span style="color: white; font-size: 20px; margin-left: 10px;">Style Life</span></a>
    </div>
    <div class="navbar-center">
        <div class="search-bar">
            <input type="text" placeholder="Bạn cần tìm gì?">
        </div>
        <button class="search-button" onclick="searchProducts()">Tìm Kiếm</button>
    </div>
    <div class="navbar-right">
        <p>Xin chào, ${customerName}</p>

        <!-- Conditionally set the href for the link -->
        <a href="<c:choose>
             <c:when test="${isLoggedIn}">
                 /trang-chu/thong-tin-khach-hang
             </c:when>
             <c:otherwise>
                 # <!-- Stay on the same page if not logged in -->
             </c:otherwise>
         </c:choose>" onclick="<c:if test='${not isLoggedIn}'>toggleDropdown()</c:if>">
            <i class="fas fa-user"></i>
        </a>

        <c:choose>
            <c:when test="${not isLoggedIn}">
                <!-- Show login dropdown menu if user is not logged in -->
                <div id="profile-dropdown" class="dropdown-menu">
                    <button onclick="window.location.href='/dang-nhap/login'">Đăng Nhập</button>
                    <button onclick="window.location.href='/dang-nhap/logout'">Đăng Xuất</button>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Hide dropdown menu if user is logged in -->
                <div id="profile-dropdown" class="dropdown-menu" style="display:none;">
                    <button onclick="window.location.href='/dang-nhap/login'">Đăng Nhập</button>
                    <button onclick="window.location.href='/dang-nhap/logout'">Đăng Xuất</button>
                </div>
            </c:otherwise>
        </c:choose>

        <a href="/trang-chu/gio-hang"><i class="fas fa-shopping-cart"></i><span>0</span></a> <!-- Giỏ hàng -->
        <a href=""></a>

        <c:choose>
            <c:when test="${not isLoggedIn}">
                <!-- Show login dropdown menu if user is not logged in -->
                    <button style="display: none" onclick="window.location.href='/dang-nhap/logout'">Đăng Xuất</button>

            </c:when>
            <c:otherwise>
                <!-- Nút Đăng Xuất đẹp hơn với các hiệu ứng -->
                <a href="/dang-nhap/logout">Đăng Xuất</a>

            </c:otherwise>
        </c:choose> <!-- Giỏ hàng -->
<%--        <button class="search-button" onclick="">Đăng xuất</button>--%>
    </div>

</div>

<div class="main-content">
    <div class="sidebar">
        <div id="filter-section">
            <h3 class="filter-header"><i class="fas fa-filter"></i> Bộ lọc</h3>
            <form action="/trang-chu/loc" method="GET">
                <c:forEach var="loai" items="${loai}">
                    <label>
                        <input type="radio" name="loaiSP" value="${loai}" id="${loai}"> ${loai}
                    </label>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Lọc</button>
            </form>
            <br>
            <a href="http://localhost:8080/trang-chu/trang-chu">
                <button type="submit">Reset</button>
            </a>

        </div>
    </div>


    <!-- Main Content -->
    <div class="product-grid">
        <c:forEach var="sp" items="${sanPham}">
            <div class="product-card">
                <img src="${sp.anh}" alt="${sp.id}">
                <h3>${sp.ten}</h3>
                <p>${sp.loai}</p>
                <div class="product-buttons">
                    <form action="/trang-chu/san-pham-chi-tiet" method="GET">
                        <input type="hidden" name="idSanPham" value="${sp.id}" />
                        <button type="submit">Xem chi tiết</button>
                    </form>


                </div>
                <br>
            </div>
        </c:forEach>
    </div>
</div>
<%--    <div class="content" id="content">--%>
<%--        <div class="container mt-5 pt-5">--%>
<%--            <table class="table">--%>
<%--                <tr>--%>
<%--                    <td>Id sản phẩm</td>--%>
<%--                    <td>Mã</td>--%>
<%--                    <td>Tên</td>--%>
<%--                    <td>Loại</td>--%>
<%--                    <td>Trạng thái</td>--%>
<%--                    <td>Thao tác</td>--%>
<%--                </tr>--%>
<%--                <c:forEach items="${sanPham}" var="sp">--%>
<%--                    <tr>--%>
<%--                        <td>${sp.id}</td>--%>
<%--                        <td>${sp.ma}</td>--%>
<%--                        <td>${sp.ten}</td>--%>
<%--                        <td>${sp.loai}</td>--%>
<%--                        <td>${sp.trangThai}</td>--%>
<%--                        <td>--%>
<%--                            <form action="/trang-chu/san-pham-chi-tiet" method="GET">--%>
<%--                                <input type="hidden" name="idSanPham" value="${sp.id}" />--%>
<%--                                <button type="submit">Chọn</button>--%>
<%--                            </form>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--            </table>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--<div class="pagination-container">--%>
<%--    <div class="pagination">--%>
<%--        <c:if test="${currentPage > 0}">--%>
<%--            <a href="?loai=${param.loai}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&page=${currentPage - 1}&size=${param.size}">Previous</a>--%>
<%--        </c:if>--%>
<%--        <c:forEach var="i" begin="0" end="${totalPages - 1}">--%>
<%--            <a href="?loai=${param.loai}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&page=${i}&size=${param.size}"--%>
<%--               class="${i == currentPage ? 'active' : ''}">${i + 1}</a>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${currentPage < totalPages - 1}">--%>
<%--            <a href="?loai=${param.loai}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}&page=${currentPage + 1}&size=${param.size}">Next</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>
<%--</div>--%>
<% if (request.getAttribute("redirectMessage") != null) { %>
<script>
    alert("<%= request.getAttribute("redirectMessage") %>");
    window.location.href = "/dang-nhap/login"; // Chuyển hướng sau khi nhấn OK
</script>
<% } %>
<script>
    // chuyển trang khi chưa đăng nhập
    <%--let isFeatureEnabled = false; // Mặc định tắt--%>

    <%--document.addEventListener("DOMContentLoaded", function() {--%>
    <%--    if (isFeatureEnabled) {--%>
    <%--        <% if (session.getAttribute("userEmail") == null) { %>--%>
    <%--        alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.");--%>
    <%--        window.location.href = "/dang-nhap/login";--%>
    <%--        <% } %>--%>
    <%--    }--%>
    <%--});--%>

    <%--function toggleFeature() {--%>
    <%--    isFeatureEnabled = true; // Bật chức năng--%>
    <%--    // Thực thi logic ngay sau khi bật--%>
    <%--    if (isFeatureEnabled) {--%>
    <%--        <% if (session.getAttribute("userEmail") == null) { %>--%>
    <%--        alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.");--%>
    <%--        window.location.href = "/dang-nhap/login";--%>
    <%--        <% } %>--%>
    <%--    }--%>
    <%--}--%>



    document.getElementById('apply-filters').addEventListener('click', function () {
        const selectedTypes = Array.from(
            document.querySelectorAll('input[name="product-type"]:checked')
        ).map(checkbox => checkbox.value);

        const products = document.querySelectorAll('.product');

        products.forEach(product => {
            const productType = product.dataset.type; // Sử dụng dataset để dễ dàng lấy loại
            if (selectedTypes.length === 0 || selectedTypes.includes(productType)) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });
    });

    function toggleDropdown() {
        const dropdown = document.getElementById('profile-dropdown');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    }

    window.onclick = function(event) {
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
        let query = document.querySelector('.search-bar input').value;
        query = query.trim().replace(/\s+/g, ' ');
        window.location.href = '/home/search?query=' + encodeURIComponent(query);
    }

    function filterByCategory(category) {
        window.location.href = '/home/filter?loai=' + encodeURIComponent(category);
    }

</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
