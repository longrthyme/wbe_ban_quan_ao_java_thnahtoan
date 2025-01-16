<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #ffffff; /* Nền trắng */
        }

        .container {
            background-color: #ffffff; /* Nền trắng */
            border: 1px solid black; /* Đường viền đen */
            padding: 40px;
            border-radius: 8px;
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: black; /* Chữ màu đen */
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: black; /* Chữ màu đen */
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border: 1px solid black; /* Đường viền đen */
            border-radius: 4px;
        }

        .btn {
            /*background-color: black;*/
            /*color: white;*/
            border: 1px solid black;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #333333; /* Đậm hơn khi hover */
        }

        .btn-back {
            background-color: #f8f9fa;
            color: black;
            border: 1px solid black;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #e0e0e0; /* Màu xám nhạt khi hover */
        }

        .form-actions {
            text-align: center;
            margin-top: 30px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Thông tin cá nhân</h2>

    <form action="/trang-chu/sua" method="post" onsubmit="return validateForm(event)">

    <%--        <div class="form-group">--%>
<%--            <label for="maKhachHang">Mã khách hàng</label>--%>
<%--            <input type="text" id="maKhachHang" name="maKhachHang" class="form-control" value="${khachHang.maKhachHang}">--%>
<%--        </div>--%>

        <div class="form-group">
            <label for="tenKhachHang">Tên khách hàng</label>
            <input type="text" id="tenKhachHang" name="tenKhachHang" class="form-control" value="${khachHang.tenKhachHang}">
        </div>

        <div class="form-group">
            <label for="ngaySinh">Ngày sinh</label>
            <input type="date" id="ngaySinh" name="ngaySinh" class="form-control" value="${formattedNgaySinh}">
        </div>

        <div class="form-group">
            <label for="gioiTinh">Giới tính</label>
            <select class="form-control" id="gioiTinh" name="gioiTinh">
                <option value="Nam" ${khachHang.gioiTinh == 'Nam' ? 'selected' : ''}>Nam</option>
                <option value="Nữ" ${khachHang.gioiTinh == 'Nữ' ? 'selected' : ''}>Nữ</option>
            </select>
        </div>

        <div class="form-group">
            <label for="sdt">Số điện thoại</label>
            <input type="text" id="sdt" name="sdt" class="form-control" value="${khachHang.sdt}">
            <span id="sdtError" style="color: red; display: none;">Số điện thoại phải có ít nhất 10 chữ số.</span>
        </div>
        <div class="form-group">
            <label for="diaChi">Địa chỉ</label>
            <input type="text" id="diaChi" name="diaChi" class="form-control" value="${khachHang.diaChi}">
        </div>

<%--        <div class="form-group">--%>
<%--            <label for="email">Email</label>--%>
<%--            <input type="email" id="email" name="email" class="form-control" value="${khachHang.email}" readonly>--%>
<%--        </div>--%>
        <div class="form-group">
            <label for="matKhau">Mật khẩu</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" value="${khachHang.matKhau}">
        </div>

        <div class="form-actions">
            <a href="/trang-chu/thong-tin-khach-hang" class="btn btn-success">Quay lại</a>
            <button type="submit" class="btn btn-primary">Sửa</button>
        </div>
    </form>
</div>

<script>
    function validateForm(event) {
        // Lấy giá trị từ các trường input
        const sdt = document.getElementById('sdt').value;
        // const email = document.getElementById('emaill').value;

        // Lấy các phần tử span để hiển thị lỗi
        const sdtError = document.getElementById('sdtError');
        // const emailError = document.getElementById('emailError');

        // Biểu thức regex kiểm tra số điện thoại (ít nhất 10 số)
        const phoneRegex = /^[0-9]{10,}$/;

        // Biểu thức regex kiểm tra định dạng email
        // const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        let isValid = true;

        // Kiểm tra số điện thoại
        if (!phoneRegex.test(sdt)) {
            sdtError.style.display = 'block';
            isValid = false;
        } else {
            sdtError.style.display = 'none';
        }

        // Kiểm tra định dạng email
        // if (!emailRegex.test(email)) {
        //     emailError.style.display = 'block';
        //     isValid = false;
        // } else {
        //     emailError.style.display = 'none';
        // }

        // Nếu có lỗi, ngăn form gửi đi
        if (!isValid) {
            event.preventDefault();
        }

        // Hiển thị thông báo sau khi gửi form
        alert('Cập nhật thành công!');
        return isValid; // Nếu hợp lệ, cho phép gửi form
    }
</script>

</body>
</html>
