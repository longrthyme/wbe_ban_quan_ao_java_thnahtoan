<c:forEach items="${gioHang}" var="gh">
    <tr>
            <%--                        <td><img src="https://cf.shopee.vn/file/sg-11134201-22100-9aslwqu1neiv15" alt="Áo thun"></td>--%>
        <td>${gh.id_gio_hang}</td>
        <td>${gh.ma_gh}</td>
        <td>${gh.sanPhamChiTiet.sanPham.ten}</td>
            <%--                        <td>${sanPhamChiTiet.size}</td>--%>
            <%--                        <td>${sanPhamChiTiet.mauSac.ten_mau_sac}</td>--%>
            <%--                        <td>${sanPhamChiTiet.thuongHieu.ten_thuong_hieu}</td>--%>
            <%--                        <td style="text-align: center;">--%>
            <%--                            <div style="display: flex; align-items: center; margin: 10px 0;">--%>
            <%--                                <!-- Nút giảm -->--%>
            <%--                                <button type="button" class="quantity-btn decrease" style="border-radius: 5px; background-color: #f0f0f0; padding: 5px 10px; cursor: pointer;">-</button>--%>

            <%--                                <!-- Ô nhập số lượng -->--%>
            <%--                                <input--%>
            <%--                                        type="text"--%>
            <%--                                        class="quantity-input"--%>
            <%--                                        style="background-color: white; width: 40px; height: 20px; text-align: center; border-radius: 5px; margin: 0 5px;"--%>
            <%--                                        value="1"--%>
            <%--                                        name="soLuongBH"--%>
            <%--                                        data-price="${sanPhamChiTiet.gia_ban}"--%>
            <%--                                        readonly>--%>

            <%--                                <!-- Nút tăng -->--%>
            <%--                                <button type="button" class="quantity-btn increase" style="border-radius: 5px; background-color: #f0f0f0; padding: 5px 10px; cursor: pointer;">+</button>--%>
            <%--                            </div>--%>
            <%--                        </td>--%>
            <%--                        <td>${sanPhamChiTiet.gia_ban}₫</td>--%>
    </tr>
</c:forEach>