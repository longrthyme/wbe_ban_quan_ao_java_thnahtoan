<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        function confirmUpdate() {
            return confirm("Bạn có chắc chắn muốn cập nhật sản phẩm này không?");
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Cập nhật sản phẩm</h2>

    <form action="/san-pham/cap-nhat" method="post" onsubmit="return confirmUpdate();">
        <input type="hidden" name="id" value="${sp.id}">

        <div class="form-group">
            <label for="ma">Mã sản phẩm:</label>
            <input type="text" class="form-control" id="ma" name="ma" value="${sp.ma}" readonly>
        </div>

        <div class="form-group">
            <label for="ten">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="ten" name="ten" value="${sp.ten}">
        </div>

        <div class="form-group">
            <label for="loai">Loại sản phẩm:</label>
            <input type="text" class="form-control" id="loai" name="loai" value="${sp.loai}">
        </div>

        <div class="form-group">
            <label for="trangThai">Trạng thái:</label>
            <select class="form-control" id="trangThai" name="trangThai">
                <option value="true" <c:if test="${sp.trangThai}">selected</c:if>>Còn hàng</option>
                <option value="false" <c:if test="${!sp.trangThai}">selected</c:if>>Hết hàng</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
    </form>

    <a href="/san-pham/hien-thi" class="btn btn-secondary mt-3">Quay lại danh sách sản phẩm</a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>