<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Hiển thị danh sách khách hàng -->
<c:if test="${not empty khachHangs}">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Số điện thoại</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="khachHang" items="${khachHangs}">
            <tr>
                <td>${khachHang.id}</td>
                <td>${khachHang.tenKhachHang}</td>
                <td>${khachHang.sdt}</td>
                <td>${khachHang.email}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${empty khachHangs}">
    <p>Không tìm thấy khách hàng nào.</p>
</c:if>