<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách hóa đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Nền trắng và chữ đen */
        body {
            background-color: white;
            color: black;
        }

        /* Màu nền bảng */
        .table-dark {
            background-color: #f8f9fa; /* Thay nền bảng thành màu sáng */
            color: black;
        }

        /* Màu nền khi hover trên hàng bảng */
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        /* Màu cho các nút */
        .btn-custom {
            background-color: #4caf50;
            color: white;
        }
        .btn-custom:hover {
            background-color: #45a049;
        }

        /* Card với góc bo tròn */
        .card {
            border-radius: 15px;
            overflow: hidden;
        }

        /* Tiêu đề */
        .card-header {
            background-color: #17a2b8;
            color: white;
        }

        .pagination .page-item .page-link {
            color: black;
        }

        .pagination .page-item.active .page-link {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header text-center">
            <h2>Danh sách hóa đơn</h2>
        </div>
        <div class="card-body">
            <!-- Customer Table -->
            <table class="table table-hover mt-4" id="customerTable">
                <thead>
                <tr>
                    <th scope="col">Mã hóa đơn</th>
                    <th scope="col">Tên khách hàng</th>
                    <th scope="col">Tên người nhận</th>
                    <th scope="col">Loại hóa đơn</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${hoaDons}" var="hd">
                    <tr>
                        <td>${hd.ma_hd}</td>
                        <td>${hd.khachHang.tenKhachHang}</td>
                        <td>${hd.ten_nguoi_nhan}</td>
                        <td>${hd.id_loai_hoa_don == 1 ? "Tại quầy" : "Trực tuyến"}</td>
                        <td>${hd.tong_tien}</td>
                        <td>
                            <!-- Định dạng ngày -->
                            <fmt:formatDate value="${hd.ngay_tao}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${hd.trangThaiDonHang.loaitt}</td>
                        <td>
                            <form action="/hoa-don/hoa-don-chi-tiet" method="get">
                                <input type="hidden" name="idHoaDon" value="${hd.id_hoa_don}">
                                <button class="btn btn-warning" type="submit">Chọn</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}&size=5">&laquo;</a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}&size=5">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}&size=5">&raquo;</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
