<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
            justify-content: space-between;
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

<div class="container">
    <div class="card">
        <div class="card-header">
            Chi tiết khách hàng
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="makh" class="form-label">Mã khách hàng:</label>
                <input type="text" class="form-control" id="makh" value="${detail.maKhachHang}" readonly>
            </div>
            <div class="mb-3">
                <label for="ten" class="form-label">Tên khách hàng:</label>
                <input type="text" class="form-control" id="ten" value="${detail.tenKhachHang}" readonly>
            </div>
            <div class="mb-3">
                <label for="ngaysinh" class="form-label">Ngày sinh:</label>
                <input type="text" class="form-control" id="ngaysinh" value="${detail.ngaySinh}" readonly>
            </div>
            <div class="mb-3">
                <label for="gioitinh" class="form-label">Giới tính:</label>
                <input type="text" class="form-control" id="gioitinh" value="${detail.gioiTinh}" readonly>
            </div>
            <div class="mb-3">
                <label for="sdt" class="form-label">Số điện thoại:</label>
                <input type="text" class="form-control" id="sdt" value="${detail.sdt}" readonly>
            </div>
            <div class="mb-3">
                <label for="diachi" class="form-label">Địa chỉ:</label>
                <input type="text" class="form-control" id="diachi" value="${detail.diaChi}" readonly>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="text" class="form-control" id="email" value="${detail.email}" readonly>
            </div>
            <div class="mb-3">
                <label for="trangthai" class="form-label">Trạng thái:</label>
                <input type="text" class="form-control" id="trangthai" value="${detail.trangThai == 1 ? 'Hoạt động' : 'Ngừng hoạt động'}" readonly>
            </div>
            <div class="text-end
">
                <a href="/khach-hang/index" class="btn btn-back">Quay lại</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
