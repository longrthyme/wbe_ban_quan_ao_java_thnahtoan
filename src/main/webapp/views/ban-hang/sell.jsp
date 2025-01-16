<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lifestyle Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .toggle-switch input {
            display: none;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: 0.4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .hidden {
            display: none;
        }
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 100%;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .sidebar {
            width: 280px;
            background-color: white;
            color: black;
            display: flex;
            flex-direction: column;
            /*justify-content: space-between;*/
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            position: fixed; /*cố định sidebar*/
            top: 0;
            bottom: 0;
            left: 0;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            padding: 15px 20px;
        }

        .sidebar-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .sidebar.collapsed {
            width: 120px;
            transition: width 0.3s ease;
        }

        .sidebar.collapsed .welcome,
        .sidebar.collapsed strong {
            display: none;
        }
        .sidebar.collapsed .menu a .menu-title {
            display: none;
        }
        .sidebar.collapsed img {
            margin: auto;
        }
        .sidebar.collapsed .menu-title {
            display: none;
        }

        .sidebar.collapsed .menu a span {
            display: none;
        }
        .sidebar.collapsed .menu a {
            justify-content: center;
            padding: 12px 0;
        }

        .sidebar.collapsed .menu a i {
            font-size: 24px;
            margin-right: 0;
        }
        .menu .has-submenu a i.toggle-icon {
            margin-left: 10px;
            font-size: 14px;
        }
        .menu .submenu a {
            padding: 10px 20px;
            margin-bottom: 5px;
            border-radius: 4px;
        }

        .menu .submenu a:hover {
            background-color: #f0f8ff;
            color: #004d99;
        }
        /* Khi menu thu gọn */
        .sidebar.collapsed .menu .has-submenu:hover .submenu {
            display: block;
            position: absolute;
            left: 120px;
            top: 50%;
            transform: translateY(-50%);
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar.collapsed .menu .submenu a {
            padding: 8px 15px;
            font-size: 14px;
        }

        .main-content {
            transition: margin-left 0.3s ease;
        }

        /* Khi menu thu gọn, giảm khoảng cách */
        .sidebar.collapsed + .main-content {
            margin-left: 120px;
        }

        .sidebar.collapsed .submenu a {
            justify-content: center;
        }

        .sidebar.collapsed .submenu a span {
            display: none;
        }

        .menu .submenu {
            margin-left: 10px;
        }

        .menu .has-submenu.open .submenu {
            max-height: 500px;
        }

        .sidebar .menu a {
            display: flex;
            align-items: center;
            justify-content: start;
        }
        .sidebar .menu a i {
            margin-right: 10px;
        }
        .sidebar .menu section {
            display: none;
        }

        .sidebar .menu section span {
            display: none;
        }
        .main-content.expanded {
            margin-left: 120px;
            transition: margin-left 0.3s ease;
        }
        .welcome {
            text-align: left;
            font-size: 14px;
            margin-top: 10px;
        }

        .welcome p {
            margin-bottom: 5px;
            margin: 0;
            color: #666; /* Màu chữ "Chào mừng bạn" */
        }

        .welcome strong {
            display: block;
            font-size: 16px;
            color: #333; /* Màu chữ tên người dùng */
        }

        .menu-section {
            margin-top: 3px;
        }

        .menu-title {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            color: #666;
        }

        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu li {
            margin-bottom: 5px;
        }

        .menu a {
            text-decoration: none;
            color: #000;
            display: flex;
            align-items: center;
            padding: 12px 20px;
            transition: background-color 0.3s, color 0.3s;
        }

        .menu a i {
            margin-right: 10px;
            color: #000; /* Màu icon */
        }

        .menu a:hover, .menu .active a {
            background-color: #e6f7ff;
            color: #004d99;
        }

        .menu a:hover i {
            color: #004d99;
        }
        .menu-section:last-child {
        }

        .toggle-menu {
            background-color: transparent;
            border: none;
            color: #666;
            font-size: 20px;
            cursor: pointer;
            margin-left: auto;
        }

        /* Nội dung chính */
        .main-content {
            margin-left: 280px;
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
            overflow-y: auto;
            height: 100vh;
        }

        .navbar {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar span {
            font-size: 18px;
            font-weight: bold;
        }

        .content {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menu .submenu {
            display: none;
            padding-left: 20px;
            gap: 10px;
        }
        .menu .submenu li {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .has-submenu.open .submenu {
            display: block;
        }

        .menu .has-submenu a i.toggle-icon {
            font-size: 14px;
        }

        /*Nút tìm kiếm*/
        .search-title {
            font-size: 20px;
            font-weight: 500;
            color: #333;
            margin-bottom: 15px;
            text-align: left;
        }
        .btn-refresh i, .btn-add i {
            margin-right: 5px;
        }

        .btn-info {
            align-items: center;
        }
        .table-phiphai {
            overflow-x: auto;
            width: 100%;
            margin-bottom: 1rem;
        }

        table {
            background-color: white;
            color: #212529;
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            min-width: 1000px;
        }

        table th, table tfoot td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }

        table th {
            background-color: white;
            font-weight: bold;
            color: #495057;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        table tbody tr {
            border: none;
        }

        table tbody tr:nth-child(even) {
            background-color: #fdfdfe;
        }

        table tbody tr:hover {
            background-color: #e9f7ff;
            transition: background-color 0.3s ease;
        }

        table tbody td {
            padding: 12px;
        }

        table tbody td .btn {
            padding: 6px 10px;
            font-size: 14px;
            border-radius: 4px;
            margin-right: 4px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        table tbody td .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        /* Các nút hành động */
        .btn-warning {
            background-color: #ffc107; /* Màu vàng */
            color: white;
            border: none;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-info {
            background-color: #007bff; /* Màu xanh dương */
            color: white;
            border: none;
        }

        .btn-info:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545; /* Màu đỏ */
            color: white;
            border: none;
        }

        .btn-danger:hover {
            background-color: #bd2130;
        }

        table tbody td .btn {
            padding: 6px 10px;
            font-size: 14px;
            border-radius: 4px;
            margin-right: 4px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        table tbody td .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        /* Nút thêm nhân viên */
        .btn-info {
            background-color: #17a2b8;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        /* Phân trang */
        .pagination a {
            display: inline-block;
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        .pagination a.active {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
            cursor: default;
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination {
            display: inline-flex;
            list-style-type: none;
            padding: 0;
        }
        .pagination-info {
            display: none;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            margin-top: 10px;
        }

        .pagination-container:hover .pagination-info {
            display: block;
        }

        .pagination-info .pagination-tooltip {
            background-color: rgba(0, 0, 0, 0.75);
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<!-- Thanh bên trái -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <%--        <img src="${pageContext.request.contextPath}/images/hehe.jpg" alt="AvtCuaBan">--%>
        <div class="welcome">
            <p>Chào mừng bạn</p>
            <strong>${sessionScope.userEmail}</strong>
        </div>
        <button class="toggle-menu">
            <i class="fas fa-bars"></i>
        </button>
    </div>

    <!-- Menu chính -->
    <div class="menu-section">
        <div class="menu-title">Main</div>
        <ul class="menu">
            <li><a href="/thong-ke/thong-ke"><i class="fa-solid fa-chart-line"></i> <span>Thống kê</span></a></li>
            <li><a href="/trang-chu/trang-chu"><i class="fas fa-home"></i> <span>Trang Chủ</span></a></li>
            <li class="active"><a href="/ban-hang/ban-hang"><i class="fas fa-cash-register"></i> <span>Tại Quầy</span></a></li>
            <%--            <li><a href="#"><i class="fas fa-undo"></i> <span>Trả Hàng</span></a></li>--%>
            <li><a href="/hoa-don/hoa-don"><i class="fas fa-file-invoice"></i> <span>Hóa Đơn</span></a></li>
            <li class="has-submenu">
                <a href="#">
                    <i class="fas fa-box"></i>
                    <span>Quản lý Sản Phẩm</span>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </a>
                <ul class="submenu" style="display: none;">
                    <li><a href="/san-pham/index"><i class="fa-solid fa-shirt"></i><span>Sản phẩm</span></a></li>
                    <li><a href="/mau-sac/index"><i class="fa-solid fa-palette"></i><span>Màu sắc</span></a></li>
                    <li><a href="/thuong-hieu/index"><i class="fa-solid fa-tags"></i><span>Thương hiệu</span></a></li>
                </ul>
            </li>
            <li><a href="/nhan-vien/index"><i class="fas fa-users"></i> <span>Nhân Viên</span></a></li>
            <li><a href="/khach-hang/index"><i class="fas fa-user"></i> <span>Khách Hàng</span></a></li>
            <%--            <li><a href="/voucher/index"><i class="fas fa-tags"></i> <span>Phiếu Giảm Giá</span></a></li>--%>
            <%--            <li><a href="#"><i class="fas fa-percent"></i> <span>Đợt Giảm Giá</span></a></li>--%>
        </ul>
    </div>
    <div class="menu-section">
        <div class="menu-title">Account</div>
        <ul class="menu">
            <li><a href="/dang-nhap/logout"><i class="fas fa-sign-out-alt"></i> <span>Đăng Xuất</span></a></li>
        </ul>
    </div>
</div>
<!-- Main Content -->
<div class="main-content"id="content">
    <div class="navbar">
        <span>Bán hàng tại quầy</span>
    </div>
    <div class="content">
        <h1 style="text-align: center; color: red">Hóa đơn chờ thanh toán</h1>
        <div style="display: flex">
            <div style="width: 80%; margin-right: 3%">
                <div style="display: flex;">
                    <form action="/ban-hang/add" method="POST">
                        <button style="height: 60px; border-radius: 10px; margin-bottom: 20px" class="btn btn-primary" type="submit">Bán tại quầy</button>
                    </form>

                    <c:if test="${not empty errorMessage}">
                        <div style="width: 300px; height: 60px; margin-left: 20px; place-items: center" class="alert alert-danger">${errorMessage}</div>
                    </c:if>
                    <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success" role="alert" style="width: 300px;">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                    <% } %>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                    <% } %>
                </div>
                <table class="table" id="Cu">
                    <tr>
                        <td>Mã hóa đơn</td>
                        <td>Khách hàng</td>
                        <td>Nhân viên</td>
                        <td>Ngày tạo</td>
                        <td>Thao tác</td>
                    </tr>
                    <c:forEach items="${hoadon}" var="c">
                        <tr>
                            <td>${c.ma_hd}</td>
                            <td>${c.khachHang != null ? c.khachHang.tenKhachHang : "Chưa chọn khách hàng"}</td>
                            <td>${c.nhanVien != null ? c.nhanVien.ten_nv : "Chưa chọn nhân viên"}</td>
                            <td>${c.ngay_tao}</td>
                            <td>
                                <form action="/ban-hang/hoa-don" method="GET">
                                    <input type="hidden" name="idHoaDon" value="${c.id_hoa_don}" /> <!-- Chuyển id_hoa_don vào form -->
                                    <button class="btn btn-warning" type="submit">Chọn</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>


                <!-- Modal thêm sản phẩm-->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog d-flex justify-content-center align-items-center">
                        <div class="modal-content" style="width: 1200px; margin: auto;">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Chọn sản phẩm</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/ban-hang/them-san-pham" method="POST">
                                    <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                    <table class="table">
                                        <tr>
                                            <td>Sản phẩm</td>
                                            <td>Loại</td>
                                            <td>Màu sắc</td>
                                            <td>Thương hiệu</td>
                                            <td>Kích cỡ</td>
                                            <td>Số lượng còn lại</td>
                                            <td>Giá bán</td>
                                        </tr>
                                        <c:forEach items="${sanphamct}" var="ok">
                                            <tr>
                                                <td>${ok.sanPham.ten}</td>
                                                <td>${ok.sanPham.loai}</td>
                                                <td>${ok.mauSac.ten_mau_sac}</td>
                                                <td>${ok.thuongHieu.ten_thuong_hieu}</td>
                                                <td>${ok.size}</td>
                                                <td>${ok.so_luong_ton}</td>
                                                <td>${ok.gia_ban}</td>
                                                <td>
                                                    <button style="float: right" class="btn btn-primary" type="submit" name="idSanPhamCT" value="${ok.id_san_pham_ct}">
                                                        Thêm
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal thêm khách hàng -->
                <div style="margin: 3%" class="modal fade" id="ModalKhachHang" tabindex="-1" aria-labelledby="ModalKhachHangLabel" aria-hidden="true">
                    <div class="modal-dialog d-flex justify-content-center align-items-center">
                        <div class="modal-content" style="width: 1200px; margin: auto;">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="ModalKhachHangLabel">Chọn khách hàng</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <div style="display: flex;">
                                    <form method="post" action="/ban-hang/add-khach-hang-le">
                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                        <button type="submit" class="btn btn-primary">Khách lẻ</button>
                                    </form>
                                    <!-- Hiển thị thông báo lỗi -->
                                    <c:if test="${not empty errorMessages}">
                                        <div class="alert alert-danger" role="alert" style="margin-left: 10px; height: 38px; line-height: 38px; padding: 0 15px; font-size: 1rem;">
                                                ${errorMessages}
                                        </div>
                                    </c:if>

                                    <form style="margin-left: auto" method="get" action="/ban-hang/hoa-don/tim-kiem-khach-hang">
                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}">

                                        <div class="input-group" style="width: auto;">
                                            <input
                                                    type="text"
                                                    id="sdtInput"
                                                    name="sdt"
                                                    placeholder="Nhập số điện thoại"
                                                    oninput="toggleSearchButton()"
                                                    style="height: calc(1.5em + 0.75rem + 2px); font-size: 1rem; border-radius: .375rem; margin-right: 10px;"
                                                    pattern="^\d{10,}$"
                                                    title="Số điện thoại phải có ít nhất 10 chữ số"
                                                    required
                                                    class="form-control"
                                            >

                                            <button
                                                    type="submit"
                                                    id="searchButton"
                                                    class="btn btn-warning bi bi-search"
                                                    disabled
                                                    style="height: calc(1.5em + 0.75rem + 2px); font-size: 1rem; border-radius: .375rem;">
                                                Tìm kiếm
                                            </button>
                                        </div>
                                    </form>

                                </div>
                                <br>

                                <!-- Hiển thị danh sách khách hàng -->
                                <c:if test="${not empty khachHang}">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>Tên khách hàng</th>
                                            <th>Số điện thoại</th>
                                            <th>Email</th>
                                            <th>Chọn</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${khachHang}" var="kh">
                                            <tr>
                                                <td>${kh.tenKhachHang}</td>
                                                <td>${kh.sdt}</td>
                                                <td>${kh.email}</td>
                                                <td>
                                                    <form method="post" action="/ban-hang/add-khach-hang">
                                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                                        <input type="hidden" name="idKhachHang" value="${kh.id}" />
                                                        <button type="submit" class="btn btn-primary">Chọn</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>


                                <%--                <c:if test="${empty khachHang}">--%>
                                <%--                    <table class="table">--%>
                                <%--                        <tr>--%>
                                <%--                            <td>Tên khách hàng</td>--%>
                                <%--                            <td>Số điện thoại</td>--%>
                                <%--                            <td>email</td>--%>
                                <%--                        </tr>--%>
                                <%--                        <c:forEach items="${khachHang}" var="kh">--%>
                                <%--                            <tr>--%>
                                <%--                                <td>${kh.tenKhachHang}</td>--%>
                                <%--                                <td>${kh.sdt}</td>--%>
                                <%--                                <td>${kh.email}</td>--%>
                                <%--                                <td>--%>
                                <%--                                    <form method="post" action="/ban-hang/add-khach-hang">--%>
                                <%--                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />--%>
                                <%--                                        <input type="hidden" name="idKhachHang" value="${kh.id}" />--%>
                                <%--                                        <button type="submit" class="btn btn-primary">--%>
                                <%--                                            Chọn--%>
                                <%--                                        </button>--%>
                                <%--                                    </form>--%>
                                <%--                                </td>--%>
                                <%--                            </tr>--%>
                                <%--                        </c:forEach>--%>
                                <%--                    </table>--%>
                                <%--                </c:if>--%>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Script mở modal tự động -->
                <script>
                    // Hàm để bật/tắt nút tìm kiếm
                    function toggleSearchButton() {
                        var sdtInput = document.getElementById("sdtInput");
                        var searchButton = document.getElementById("searchButton");

                        // Kiểm tra nếu ô nhập liệu có ít nhất 10 ký tự và khớp với pattern
                        if (sdtInput.value.length >= 10 && sdtInput.checkValidity()) {
                            searchButton.disabled = false;
                        } else {
                            searchButton.disabled = true;
                        }
                    }

                    // Tải lại trang kiểm tra trạng thái input
                    document.addEventListener("DOMContentLoaded", toggleSearchButton);
                </script>

                <%--            //mở modal--%>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const showModal = "${showModal}";
                        if (showModal === "true") {
                            const modalKhachHang = new bootstrap.Modal(document.getElementById("ModalKhachHang"));
                            modalKhachHang.show();
                        }
                    });
                </script>


                <!-- Kiểm tra maHoaDon để hiển thị/ẩn các nút -->
                <c:if test="${not empty maHoaDon}">
                    <!-- Hiển thị các nút khi maHoaDon không null -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Chọn sản phẩm
                    </button>

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalKhachHang">
                        Chọn khách hàng
                    </button>
                </c:if>


                <p>
                <h3>
                    <Strong>
                        <label style="color: black">Mã hóa đơn: </label>
                        <label style="color: red">${maHoaDon}</label>
                        <!-- Kiểm tra nếu maHoaDon rỗng thì hiển thị thông báo "Chưa chọn hóa đơn" -->
                        <label style="color: red">
                            <c:if test="${empty maHoaDon}">
                                Chưa chọn hóa đơn
                            </c:if>
                        </label>

                        <!-- Nếu maHoaDon có giá trị (không rỗng), sẽ ẩn thông báo trên -->
                        <c:if test="${not empty maHoaDon}">
                            <!-- Mã hóa đơn đã tồn tại, không cần hiển thị thông báo "Chưa chọn hóa đơn" -->
                        </c:if>

                    </Strong>
                </h3>
                </p>

                <!-- Kiểm tra maHoaDon để hiển thị/ẩn các nút -->
                <c:if test="${not empty maHoaDon}">

                <table class="table">
                    <tr>
                            <%--                    <td>Mã hóa đơn chi tiết</td>--%>
                        <td>Tên sản phẩm</td>
                        <td>Kích cỡ</td>
                        <td>Màu sắc</td>
                        <td>Thương hiệu</td>
                        <td>Số lượng</td>
                        <td>Đơn giá</td>
                        <td>Thành tiền</td>
                        <td>thao tac</td>
                    </tr>
                    <c:forEach items="${hoadonct}" var="ct">
                        <tr>

                                <%--                <td>${ok.sanPham.ten}</td>--%>
                                <%--                <td>${ok.sanPham.loai}</td>--%>
                                <%--                <td>${ok.mauSac.ten_mau_sac}</td>--%>
                                <%--                <td>${ok.thuongHieu.ten_thuong_hieu}</td>--%>
                                <%--                <td>${ok.size}</td>--%>
                                <%--                <td>${ok.so_luong_ton}</td>--%>
                                <%--                <td>${ok.gia_ban}</td>--%>

                                <%--                        <td>${ct.ma_hdct}</td>--%>
                            <td>${ct.sanPhamChiTiet.sanPham.ten}</td>
                            <td>${ct.sanPhamChiTiet.size}</td>
                            <td>${ct.sanPhamChiTiet.mauSac.ten_mau_sac}</td>
                            <td>${ct.sanPhamChiTiet.thuongHieu.ten_thuong_hieu}</td>
                            <td style="text-align: center; display: flex; height: 50px">
                                <form action="/ban-hang/giam-so-luong?idSanPhamCT=${ct.sanPhamChiTiet.id_san_pham_ct}" method="post" id="tru">
                                    <input type="hidden" name="idSanPhamCT" value="${ct.sanPhamChiTiet.id_san_pham_ct}" />
                                    <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                    <button
                                            style="width: 30px; height: 33px; border-radius: 5px"
                                        ${ct.soluong == 1 ? 'disabled' : ''}>-</button>
                                </form>

                                <input
                                        type="text"
                                        min="1"
                                        style="background-color: white; width: 32px; text-align: center; border-radius: 5px; margin: 0 5px 0 5px"
                                        value="${ct.soluong}"
                                        name="soLuongBH"
                                        readonly>

                                <form action="/ban-hang/tang-so-luong?idSanPhamCT=${ct.sanPhamChiTiet.id_san_pham_ct}" method="post" id="cong">
                                    <input type="hidden" name="idSanPhamCT" value="${ct.sanPhamChiTiet.id_san_pham_ct}" />
                                    <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                    <button
                                            style="width: 30px; height: 33px; border-radius: 5px"
                                        ${ct.sanPhamChiTiet.so_luong_ton == 0 ? 'disabled' : ''}>+</button>
                                </form>
                            </td>
                            <td>${ct.don_gia}</td>
                            <td>${ct.thanh_tien}</td>
                            <td>
                                <form action="/ban-hang/xoa-cthd" method="POST" id="deleteForm">
                                    <input type="hidden" name="idSanPhamCT" value="${ct.sanPhamChiTiet.id_san_pham_ct}" />
                                    <input type="hidden" name="idHoaDonChiTiet" value="${ct.id_hoa_don_ct}" />
                                    <input type="hidden" name="idHoaDon" value="${ct.id_hoa_don}" />
                                    <button class="btn btn-danger" type="submit" onclick="deleteConfirm(event)">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div style="width: 17%; color: black; margin-top: 50px;">
                <div>
                    <label style="width: 300px"><h3><Strong>Giao hàng</Strong></h3></label>
                    <label class="toggle-switch" style="display: flex">
                        <input type="checkbox" id="toggleSwitch">
                        <span class="slider"></span>
                    </label>
                </div>
                <br>
                <form action="/ban-hang/xac-nhan-mua-hang" method="POST">
                    <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                    <!-- Trường hidden để lưu trạng thái vận chuyển -->
                    <input type="hidden" name="isShippingSelected" id="isShippingSelected" value="false">
                    <!-- Trường hidden để lưu phí vận chuyển -->
                    <input type="hidden" name="phiVanChuyen" id="phiVanChuyen" value="0">

                    <div id="optionalFields" class="hidden">
                        <p>
                            <label>Tên người nhận</label>
                            <input type="text" name="tenNguoiNhan" id="tenNguoiNhan"><br>
                        </p>
                        <p>
                            <label>Tỉnh/Thành phố:</label>
                            <input type="text" name="thanhPho" id="thanhPho"><br>
                            <span id="shipMessage" style="color: green; font-weight: bold;"></span>
                        </p>
                        <p>
                            <label>Địa chỉ cụ thể:</label>
                            <input type="text" name="diaChi">
                        </p>
                        <p>
                            <label>Email:</label><br>
                            <input type="email" name="email">
                        </p>
                        <p>
                            <label>Số điện thoại:</label>
                            <input type="text" name="sdt" id="sdt" oninput="validatePhone()">
                            <br>
                            <Strong>
                                <span id="error-message" style="color: red; display: none;">Số điện thoại không đúng</span>
                            </Strong>
                        </p>
                    </div>
                    <p>
                    <h5>
                        <strong>
                            <label>Tổng tiền:</label>
                            <label id="tongTienLabel" style="color: red;">${tongTien}</label> <!-- Hiển thị tổng tiền -->
                            <input type="hidden" name="tongTien" id="tongTien" value="${tongTien}">
                        </strong>
                    </h5>
                    </p>
                    <p>
                        <label>Tiền khách đưa:</label>
                        <input type="number" id="tienKhachDua" oninput="calculateChange()" placeholder="Nhập số tiền khách đưa" required>
                    </p>
                    <p>
                        <label>Tiền thừa:</label>
                        <input type="text" id="tienThua" readonly>
                    </p>

                    <!-- Hiển thị thông báo lỗi nếu chưa chọn khách hàng -->
                    <div id="errorMessage" style="color: red; font-weight: bold;"></div>

                    <!-- Hiển thị thông báo lỗi nếu giá tiền <0 -->
                    <div id="errorMessage2" style="color: red; font-weight: bold;"></div>

                    <!-- Nút xác nhận mua hàng -->
                    <button id="submitButton" type="submit" style="display: none;">Xác nhận mua hàng</button>
                </form>

            </div>
        </div>
        </c:if>

        <c:if test="${empty maHoaDon}">
            <!-- Không hiển thị các nút khi maHoaDon là null -->
        </c:if>
    </div>
</div>


<script>
    //check trống sđt
    function validatePhone() {
        var phone = document.getElementById("sdt").value;
        var errorMessage = document.getElementById("error-message");

        // Kiểm tra nếu số điện thoại không đủ 10 số hoặc không phải là số hợp lệ
        if (phone.length !== 10 || isNaN(phone)) {
            errorMessage.style.display = "inline";
        } else {
            errorMessage.style.display = "none";
        }
    }


    //check trống khách hàng
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy thông tin tên khách hàng từ model (được truyền vào từ Controller)
        const tenKhachHang = "${tenKhachHang}";  // Dữ liệu từ model (JSP)
        const tongTien = parseFloat(document.getElementById('tongTien').value);

        // Lấy phần tử thông báo và nút xác nhận mua hàng
        var errorMessage = document.getElementById("errorMessage");
        var errorMessage2 = document.getElementById("errorMessage2");
        var submitButton = document.getElementById("submitButton");
        // Log tên khách hàng
        console.log("Tên khách hàng: ", tenKhachHang);

        // Kiểm tra nếu chưa có khách hàng
        if(tenKhachHang !== "Chưa chọn khách hàng" && tongTien > 0) {
            errorMessage.textContent = "";
            // Nếu tổng tiền hợp lệ (>= 0), ẩn thông báo và hiển thị nút xác nhận mua hàng
            errorMessage2.textContent = ""; // Xóa thông báo lỗi
            submitButton.style.display = "inline-block"; // Hiển thị nút xác nhận
        } else if(tenKhachHang !== "Chưa chọn khách hàng" && tongTien == 0){
            // Nếu đã có khách hàng, ẩn thông báo lỗi và hiển thị nút xác nhận
            errorMessage.textContent = "";
            // Hiển thị thông báo lỗi
            errorMessage2.textContent = "Tối thiểu 1 sản phẩm";
            console.log(errorMessage2)
        } else if (tenKhachHang === "Chưa chọn khách hàng" && tongTien > 0) {
            // Nếu chưa chọn khách hàng, hiển thị thông báo lỗi và ẩn nút xác nhận
            errorMessage.textContent = "Chưa chọn khách hàng, không thể thanh toán";

            // Hiển thị thông báo lỗi
            errorMessage2.textContent = "";
            errorMessage2.style.color = "red"; // Đặt màu chữ đỏ

            submitButton.style.display = "none";  // Ẩn nút xác nhận
        } else if (tenKhachHang === "Chưa chọn khách hàng" && tongTien == 0) {
            // Nếu chưa chọn khách hàng, hiển thị thông báo lỗi và ẩn nút xác nhận
            errorMessage.textContent = "Chưa chọn khách hàng, không thể thanh toán";

            // Hiển thị thông báo lỗi
            errorMessage2.textContent = "Tối thiểu 1 sản phẩm";
            errorMessage2.style.color = "red"; // Đặt màu chữ đỏ

            submitButton.style.display = "none";  // Ẩn nút xác nhận
        }

    });



    // phí vận chuyển
    const toggleSwitch = document.getElementById("toggleSwitch");
    const optionalFields = document.getElementById("optionalFields");
    const tongTienLabel = document.getElementById("tongTienLabel");
    const tongTienInput = document.getElementById("tongTien");
    const phiVanChuyenInput = document.getElementById("phiVanChuyen");
    const isShippingSelectedInput = document.getElementById("isShippingSelected");
    const thanhPhoInput = document.getElementById("thanhPho");
    const shipMessage = document.getElementById("shipMessage");

    let originalTongTien = parseInt(tongTienInput.value);
    let additionalCost = 30000; // Chi phí vận chuyển

    toggleSwitch.addEventListener("change", function () {
        if (toggleSwitch.checked) {
            optionalFields.classList.remove("hidden");
            isShippingSelectedInput.value = "true";
            updateShippingCost();

            // Đặt các trường nhập liệu là bắt buộc
            document.querySelector('input[name="thanhPho"]').setAttribute("required", "true");
            document.querySelector('input[name="diaChi"]').setAttribute("required", "true");
            document.querySelector('input[name="email"]').setAttribute("required", "true");
            document.querySelector('input[name="sdt"]').setAttribute("required", "true");
        } else {
            optionalFields.classList.add("hidden");
            isShippingSelectedInput.value = "false";
            phiVanChuyenInput.value = 0; // Không có phí vận chuyển
            tongTienLabel.textContent = originalTongTien.toLocaleString("vi-VN");
            tongTienInput.value = originalTongTien;
            shipMessage.textContent = "";

            // Nếu toggleSwitch không được chọn, bỏ thuộc tính required
            document.querySelector('input[name="thanhPho"]').removeAttribute("required");
            document.querySelector('input[name="diaChi"]').removeAttribute("required");
            document.querySelector('input[name="email"]').removeAttribute("required");
            document.querySelector('input[name="sdt"]').removeAttribute("required");
        }
    });

    thanhPhoInput.addEventListener("input", updateShippingCost);

    function updateShippingCost() {
        const city = thanhPhoInput.value.trim().toLowerCase();
        if (city === "hà nội") {
            phiVanChuyenInput.value = 0; // Miễn phí vận chuyển
            tongTienLabel.textContent = originalTongTien.toLocaleString("vi-VN");
            tongTienInput.value = originalTongTien;
            shipMessage.textContent = "Miễn phí vận chuyển";
            shipMessage.style.color = "green";
        } else {
            phiVanChuyenInput.value = additionalCost;
            let newTongTien = originalTongTien + additionalCost;
            tongTienLabel.textContent = newTongTien.toLocaleString("vi-VN");
            tongTienInput.value = newTongTien;
            shipMessage.textContent = "Phí vận chuyển: 30,000 VNĐ";
            shipMessage.style.color = "red";
        }
    }



    function calculateChange() {
        // Lấy giá trị tổng tiền từ input
        const tongTien = parseFloat(document.getElementById("tongTien").value) || 0;
        // Lấy giá trị tiền khách đưa từ input
        const tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value) || 0;

        // Tính tiền thừa
        const tienThua = tienKhachDua - tongTien;

        // Hiển thị kết quả
        document.getElementById("tienThua").value = tienThua >= 0 ? tienThua : "Chưa đủ tiền!";
    }


    // Search function for filtering customer table by "Mã khách hàng"
    function searchCustomer() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("customerTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0]; // Column "Mã khách hàng"
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
    document.addEventListener("DOMContentLoaded", function () {
        const allSubmenus = document.querySelectorAll('.submenu');
        const menuItems = document.querySelectorAll(".has-submenu > a");
        const sidebar = document.getElementById('sidebar');
        const toggleButton = document.querySelector('.toggle-menu');
        const content = document.querySelector('.main-content');

        function hideAllSubmenus(except = null) {
            allSubmenus.forEach(submenu => {
                if (submenu !== except) {
                    submenu.style.display = 'none';
                    submenu.parentElement.classList.remove("open");
                }
            });
        }

        menuItems.forEach(function (item) {
            item.addEventListener("click", function (e) {
                e.preventDefault();

                const submenu = item.nextElementSibling;

                hideAllSubmenus(submenu);

                if (submenu) {
                    submenu.style.display = submenu.style.display === "block" ? "none" : "block";
                    item.parentElement.classList.toggle("open");
                }
            });
        });

        // Sự kiện thu gọn/mở rộng sidebar
        toggleButton.addEventListener("click", () => {
            sidebar.classList.toggle('collapsed');
            content.classList.toggle('expanded');
            hideAllSubmenus(); // Ẩn tất cả submenu khi thu gọn sidebar
        });

        // Xử lý submenu khi sidebar thu gọn
        function handleSidebarHover(show = false) {
            if (sidebar.classList.contains('collapsed')) {
                const openSubmenu = sidebar.querySelector('.has-submenu.open .submenu');
                if (openSubmenu) {
                    openSubmenu.style.display = show ? 'block' : 'none';
                    if (!show) {
                        openSubmenu.parentElement.classList.remove("open");
                    }
                }
            }
        }

        sidebar.addEventListener("mouseenter", () => handleSidebarHover(true));
        sidebar.addEventListener("mouseleave", () => handleSidebarHover(false));

    });

    // Tooltip
    document.addEventListener("DOMContentLoaded", function () {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });

    function resetForm() {
        document.querySelector('input[name="maNV"]').value = '';

        window.location.href = '/nhan-vien/index';
    }

</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
