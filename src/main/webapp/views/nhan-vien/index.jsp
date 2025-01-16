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

    <style>
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
<%--<div class="sidebar p-3" id="sidebar">--%>
<%--    <h4 class="text-center">Lifestyle</h4>--%>
<%--    <hr>--%>
<%--    <ul class="nav flex-column">--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="/home/index"><i class="fas fa-home"></i> <span class="link-text">Trang chủ</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="#"><i class="fas fa-chart-bar"></i> <span class="link-text">Thống kê</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="/ban-hang/ban-hang"><i class="bi bi-coin"></i> <span class="link-text">Bán hàng</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="/san-pham/index"><i class="fas fa-box-open"></i> <span class="link-text">Sản phẩm</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="/nhan-vien/index"><i class="fas fa-users"></i> <span class="link-text">Nhân viên</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link active" href="/khach-hang/index"><i class="fas fa-user"></i> <span class="link-text">Khách hàng</span></a>--%>
<%--        </li>--%>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="#"><i class="fas fa-cogs"></i> <span class="link-text">Thiết lập</span></a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>

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
            <li><a href="/ban-hang/ban-hang"><i class="fas fa-cash-register"></i> <span>Tại Quầy</span></a></li>
<%--            <li><a href="#"><i class="fas fa-undo"></i> <span>Trả Hàng</span></a></li>--%>
            <li><a href="/hoa-don/hoa-don"><i class="fas fa-file-invoice"></i> <span>Hóa Đơn</span></a></li>
            <li class="has-submenu">
                <a href="#">
                    <i class="fas fa-box"></i>
                    <span>Quản lý Sản Phẩm</span>
                    <i class="fas fa-chevron-down toggle-icon"></i>
                </a>
                <ul class="submenu">
                    <li><a href="/san-pham/index"><i class="fa-solid fa-shirt"></i><span>Sản phẩm</span></a></li>
                    <li><a href="/mau-sac/index"><i class="fa-solid fa-palette"></i><span>Màu sắc</span></a></li>
                    <li><a href="/thuong-hieu/index"><i class="fa-solid fa-tags"></i><span>Thương hiệu</span></a></li>
                </ul>
            </li>
            <li class="active"><a href="/nhan-vien/index"><i class="fas fa-users"></i> <span>Nhân Viên</span></a></li>
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
<!-- Navbar -->
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">--%>
<%--    <div class="container-fluid">--%>
<%--        <span class="sidebar-toggler text-white me-3" onclick="toggleSidebar()">&#9776;</span>--%>
<%--        <a class="navbar-brand" href="#">Lifestyle</a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"--%>
<%--                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav ms-auto">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">Đăng nhập</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">Giỏ hàng</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<!-- Main Content -->
<div class="main-content"id="content">
    <div class="navbar">
        <span>Quản lý nhân viên</span>
    </div>
    <div class="content">
        <!-- Search Form -->
        <h3 class="search-title">Tìm kiếm</h3>
        <form action="/nhan-vien/search" method="get" class="d-flex justify-content-between mb-4">
            <div class="flex-grow-1 pe-2">
                <input type="text" name="maNV" class="form-control" placeholder="Nhập mã nhân viên">
            </div>
            <div class="flex-grow-1 pe-2">
                <input type="text" name="email" class="form-control" placeholder="Nhập email" value="${email}">
            </div>
            <div class="pe-2">
                <select name="chucVu" class="form-select">
                    <option value="">Chọn chức vụ</option>
                    <option value="true" ${trangThai ? 'selected' : ''}>Quản lý</option>
                    <option value="false" ${trangThai == false ? 'selected' : ''}>Nhân viên</option>
                </select>
            </div>
            <div class="pe-2">
                <select name="trangThai" class="form-select">
                    <option value="">Chọn trạng thái</option>
                    <option value="true" ${trangThai ? 'selected' : ''}>Hoạt động</option>
                    <option value="false" ${trangThai == false ? 'selected' : ''}>Không hoạt động</option>
                </select>
            </div>
            <button type="submit" class="btn btn-info">Tìm kiếm</button>
        </form>

        <!-- Add Button -->
        <div class="text-end mb-3">
            <button type="button" class="btn btn-info btn-refresh" onclick="resetForm()">
                <i class="fa-solid fa-rotate-right"></i>Làm mới
            </button>
            <a href="/nhan-vien/add" class="btn btn-info btn-add">
                <i class="fa-solid fa-plus"></i>Thêm nhân viên
            </a>
        <!-- Customer Table -->
        <table class="table mt-4" id="customerTable">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Mã nhân viên</th>
                <th scope="col">Tên nhân viên</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Giới tính</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Email</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${data}" var="nv">
                <tr>
                    <td>${nv.id_nhan_vien}</td>
                    <td>${nv.ma_nv}</td>
                    <td>${nv.ten_nv}</td>
                    <td>${nv.ngay_sinh}</td>
                    <td>${nv.gioi_tinh}</td>
                    <td>${nv.sdt}</td>
                    <td>${nv.dia_chi}</td>
                    <td>${nv.email}</td>
                    <td>${nv.trang_thai == 0 ? "Còn hoạt động" : "Nghỉ việc"}</td>

                    <td>
                        <a href="update/${nv.id_nhan_vien}">
                            <button class="btn btn-warning">
                                <i class="fas fa-edit"></i>
                            </button>
                        </a>
                        <a href="detail/${nv.id_nhan_vien}">
                            <button class="btn btn-primary">
                                <i class="fas fa-info-circle"></i>
                            </button>
                        </a>
                            <%--                        <a href="delete/${kh.id}">--%>
                            <%--                            <button class="btn btn-danger">--%>
                            <%--                                <i class="fas fa-trash-alt"></i>--%>
                            <%--                            </button>--%>
                            <%--                        </a>--%>

                    </td>

                        <%--                        <a href=khach-hang/detail/${kh.id}"><button class="btn btn-detail">Detail</button></a>--%>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination mt-4">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}&size=5" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}&size=5">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}&size=5" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>
    </div>

</div>

<script>
    // function toggleSidebar() {
    //     document.getElementById('sidebar').classList.toggle('collapsed');
    //     document.getElementById('content').classList.toggle('collapsed');
    //     document.querySelector('.navbar').classList.toggle('collapsed');
    // }
    //
    // // Search function for filtering customer table by "Mã khách hàng"
    // function searchCustomer() {
    //     var input, filter, table, tr, td, i, txtValue;
    //     input = document.getElementById("searchInput");
    //     filter = input.value.toUpperCase();
    //     table = document.getElementById("customerTable");
    //     tr = table.getElementsByTagName("tr");
    //
    //     for (i = 0; i < tr.length; i++) {
    //         td = tr[i].getElementsByTagName("td")[0]; // Column "Mã khách hàng"
    //         if (td) {
    //             txtValue = td.textContent || td.innerText;
    //             if (txtValue.toUpperCase().indexOf(filter) > -1) {
    //                 tr[i].style.display = "";
    //             } else {
    //                 tr[i].style.display = "none";
    //             }
    //         }
    //     }
    // }
    //
    // menuItems.forEach(function (item) {
    //     item.addEventListener("click", function (e) {
    //         e.preventDefault();
    //
    //         const submenu = item.nextElementSibling;
    //
    //         hideAllSubmenus(submenu);
    //
    //         if (submenu) {
    //             submenu.style.display = submenu.style.display === "block" ? "none" : "block";
    //             item.parentElement.classList.toggle("open");
    //         }
    //     });
    // });

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
