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
            text-decoration: none;
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
    </style>
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
            <ul class="navbar-nav ms-auto">
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
    <div class="container mt-5 pt-5">
        <h2 class="text-center">Danh sách tìm kiếm hóa đơn</h2>
        <br>
        <br>
        <%--        <p>Current Page: ${currentPage}</p>--%>
        <%--        <p>Total Pages: ${totalPages}</p>--%>

        <!-- Search Form -->
        <form action="/hoa-don/tim-kiem-hoa-don" method="get" class="d-flex justify-content-between mb-4">
            <div class="flex-grow-1 pe-2">
                <input type="text" name="sdt" class="form-control" placeholder="Nhập mã hóa đơn">
            </div>
            <button type="submit" class="btn btn-info">Tìm kiếm</button>
        </form>

        <!-- Add Button -->
        <%--        <div class="text-end mb-3">--%>
        <%--            <a href="/khach-hang/add" class="btn btn-info">Thêm khách hàng</a>--%>
        <%--        </div>--%>

        <!-- Customer Table -->
        <table class="table table-dark mt-4" id="customerTable">
            <thead>
            <tr>
                <%--                <th scope="col">Id hóa đơn</th>--%>
                <th scope="col">Mã hóa đơn</th>
                <th scope="col">Tên khách hàng</th>
                <%--                <th scope="col">Sản Phẩm</th>--%>
                <th scope="col">Nhân viên</th>
                <th scope="col">Tên người nhận</th>
                <th scope="col">Loại hóa đơn</th>
                <th scope="col">Voucher</th>
                <th scope="col">Tổng tiền</th>
                <th scope="col">Ngày tạo</th>
                <%--                <th scope="col">Thành phố</th>--%>
                <%--                <th scope="col">Địa chỉ</th>--%>
                <%--                <th scope="col">Phí vận chuyển</th>--%>
                <%--                <th scope="col">Email</th>--%>
                <th scope="col">Trạng thái</th>
                <th scope="col">Thao tác</th>
            </tr>
            </thead>
            <tbody>

                <tr>
                        <%--                    <td>${hd.id_hoa_don}</td>--%>
                    <td>${hoaDon.ma_hd}</td>
                    <td>${hoaDon.khachHang.tenKhachHang}</td>
                    <td>${hoaDon.nhanVien.ten_nv}</td>
                    <td>${hoaDon.ten_nguoi_nhan}</td>
                    <td>${hoaDon.id_loai_hoa_don == 1 ? "Tại quầy" : "Trực tuyến"}</td>
                    <td>${hoaDon.id_voucher}</td>
                    <td>${hoaDon.tong_tien}</td>
                    <td>${hoaDon.ngay_tao}</td>
                        <%--                    <td>${hd.thanh_pho}</td>--%>
                        <%--                    <td>${hd.diachi}</td>--%>
                        <%--                    <td>${hd.phi_van_chuyen}</td>--%>
                        <%--                    <td>${hd.email}</td>--%>
                    <td>${hd.id_thanh_toan  == 1 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
                    <td>
                        <form action="/hoa-don/hoa-don-chi-tiet" method="get">
                            <input type="hidden" name="idHoaDon" value="${hoaDon.id_hoa_don}">
                            <button class="btn btn-warning" type="submit">Chọn</button>
                        </form>

                    </td>
                </tr>
            <%--                    <td>--%>
            <%--                        <a href="update/${kh.id}">--%>
            <%--                            <button class="btn btn-warning">--%>
            <%--                                <i class="fas fa-edit"></i>--%>
            <%--                            </button>--%>
            <%--                        </a>--%>
            <%--                        <a href="detail/${kh.id}">--%>
            <%--                            <button class="btn btn-primary">--%>
            <%--                                <i class="fas fa-info-circle"></i>--%>
            <%--                            </button>--%>
            <%--                        </a>--%>
            <%--                            &lt;%&ndash;                        <a href="delete/${kh.id}">&ndash;%&gt;--%>
            <%--                            &lt;%&ndash;                            <button class="btn btn-danger">&ndash;%&gt;--%>
            <%--                            &lt;%&ndash;                                <i class="fas fa-trash-alt"></i>&ndash;%&gt;--%>
            <%--                            &lt;%&ndash;                            </button>&ndash;%&gt;--%>
            <%--                            &lt;%&ndash;                        </a>&ndash;%&gt;--%>

            <%--                    </td>--%>

            <%--                        <a href=khach-hang/detail/${kh.id}"><button class="btn btn-detail">Detail</button></a>--%>


            </tbody>
        </table>

        <form action="/hoa-don/hoa-don" method="get">
            <button type="submit" class="btn btn-primary">
                Quay lại hóa đơn
            </button>
        </form>

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

<script>
    function toggleSidebar() {
        document.getElementById('sidebar').classList.toggle('collapsed');
        document.getElementById('content').classList.toggle('collapsed');
        document.querySelector('.navbar').classList.toggle('collapsed');
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
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
