<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
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
            border-radius: 5px;
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

        /* Container */
        .checkout-container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Product Summary */
        .product-summary {
            margin-bottom: 20px;
        }

        .product-summary h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
        }

        .product-table th,
        .product-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .product-table th {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        .product-table img {
            width: 80px;
            border-radius: 5px;
        }

        /* Address Section */
        .address-section {
            margin-bottom: 20px;
        }

        .address-section h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .address-section input, .voucher-section input, .note-section textarea {
            width: 100%;
            max-width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .address-section .save-address-button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        /* Payment Method Section */
        .payment-method-section select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        /* Voucher Section */
        .voucher-display {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .voucher-button {
            background-color: #007bff;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .voucher-button:hover {
            background-color: #0056b3;
        }

        .voucher-modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            padding: 30px;
            border-radius: 8px;
            width: 400px;
            text-align: center;
        }

        .voucher-list {
            margin: 20px 0;
            text-align: left;
        }

        .voucher-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .voucher-image {
            width: 70px;
            height: 70px;
            margin-right: 15px;
        }

        .voucher-info {
            flex-grow: 1;
        }

        .modal-actions {
            display: flex;
            justify-content: space-between;
        }

        .modal-close,
        .modal-confirm {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-close {
            background-color: #ddd;
        }

        .modal-confirm {
            background-color: #007bff;
            color: white;
        }

        .modal-confirm:hover {
            background-color: #0056b3;
        }

        /* Summary Section */
        .summary-section {
            margin-top: 20px;
            padding: 20px;
            border-top: 1px solid #ddd;
        }

        .summary-section h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .summary-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .summary-details .label {
            font-weight: bold;
            color: #333;
        }

        .total-payment {
            font-size: 20px;
            color: red;
            font-weight: bold;
        }

        /* Place Order Button */
        .place-order-button {
            background-color: #f53d2d;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            width: 100%;
            font-size: 18px;
            cursor: pointer;
            display: none;
        }
        .place-order-button.show {
            display: block;
        }
        .place-order-button:hover {
            background-color: #d13428;
        }
    </style>
    <script>
        function toggleSummary() {
            const paymentMethod = document.getElementById("payment-method").value;
            const summarySection = document.querySelector(".summary-section");
            const placeOrderButton = document.querySelector(".place-order-button");

            if (paymentMethod) {
                summarySection.style.display = "block";
                placeOrderButton.classList.add("show");
            } else {
                summarySection.style.display = "none";
                placeOrderButton.classList.remove("show");
            }
        }
    </script>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-left">
        <a href="trang-chu"><img src="${pageContext.request.contextPath}/images/Logo.jpg" alt="Style life"></a>
        <a href="trang-chu"><span style="color: white; font-size: 20px; margin-left: 10px; text-decoration: none">Style Life</span></a>
    </div>
    <div class="navbar-center">
        <div class="search-bar">
            <input type="text" placeholder="Bạn cần tìm gì?">
        </div>
        <button class="search-button" onclick="searchProducts()">Tìm Kiếm</button>
    </div>
    <div class="navbar-right">
        <a href="#"><i class="fas fa-user"></i></a>
        <%--        <a href="#"><i class="fas fa-bell"></a>--%>
        <a href="/home/cart"><i class="fas fa-shopping-cart"></i><span>0</span></a>
    </div>
</div>


<div class="checkout-container">

    <form action="/trang-chu/add-mua-gio-hang" method="POST">
        <div class="product-summary">
            <h2>Sản phẩm đã chọn</h2>
            <table class="product-table">
                <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Size</th>
                    <th>Màu sắc</th>
                    <th>Thương hiệu</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${gioHang}" var="gh">
                    <tr>
                            <%--                        <td><img src="https://cf.shopee.vn/file/sg-11134201-22100-9aslwqu1neiv15" alt="Áo thun"></td>--%>
                        <td>${gh.sanPhamChiTiet.sanPham.ten}</td>
                        <td>${gh.sanPhamChiTiet.size}</td>
                        <td>${gh.sanPhamChiTiet.mauSac.ten_mau_sac}</td>
                        <td>${gh.sanPhamChiTiet.thuongHieu.ten_thuong_hieu}</td>
                        <td style="text-align: center;">
                            <div style="display: flex; align-items: center; margin: 10px 0;">
                                <!-- Nút giảm -->
                                <button type="button" class="quantity-btn decrease" style="border-radius: 5px; background-color: #f0f0f0; padding: 5px 10px; cursor: pointer;">-</button>

                                <!-- Ô nhập số lượng -->
                                <input
                                        type="text"
                                        class="quantity-input"
                                        style="background-color: white; width: 40px; height: 20px; text-align: center; border-radius: 5px; margin: 0 5px;"
                                        value="1"
                                        name="soLuongBH_${gh.sanPhamChiTiet.id_san_pham_ct}"
                                data-price="${gh.sanPhamChiTiet.gia_ban}"
                                readonly>

                                <!-- Nút tăng -->
                                <button type="button" class="quantity-btn increase" style="border-radius: 5px; background-color: #f0f0f0; padding: 5px 10px; cursor: pointer;">+</button>
                            </div>
                        </td>
                        <td>${gh.sanPhamChiTiet.gia_ban}₫</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Địa chỉ nhận hàng -->
        <c:forEach items="${gioHang}" var="gh">
            <input type="hidden" name="idSanPhamChiTiet" value="${gh.sanPhamChiTiet.id_san_pham_ct}">
        </c:forEach>
        <div class="address-section">
            <h2>Địa chỉ nhận hàng</h2>
            <input type="text" name="tenNguoiNhan" placeholder="Tên người nhận" required>
            <input type="text" name="soDienThoai" placeholder="Số điện thoại" required>
            <input type="email" name="email" placeholder="Email" required>
            <input
                    type="text"
                    name="tinhThanhPho"
                    id="tinhThanhPho"
                    placeholder="Tỉnh/Thành phố"
                    required>

            <div id="shipping-info" style="font-weight: bold; color: green;"></div>
            <!-- Trường ẩn chứa giá trị phí vận chuyển -->
            <input type="hidden" name="phiVanChuyen" id="phiVanChuyen" value="0">

            <input type="text" name="diaChi" placeholder="Địa chỉ" required>
        </div>
        <%--        <button type="submit" class="place-order-button">Đặt hàng</button>--%>



        <%--    <div class="voucher-section">--%>
        <%--        <h2>Voucher của Shop</h2>--%>
        <%--        <div class="voucher-display">--%>
        <%--            <span class="voucher-text">Chọn voucher</span>--%>
        <%--            <button class="voucher-button" onclick="showVoucherModal()">Chọn Voucher</button>--%>
        <%--        </div>--%>
        <%--        <p id="selected-voucher" style="color: green; margin-top: 10px;"></p>--%>
        <%--    </div>--%>

        <!-- Modal hiển thị voucher -->
        <%--    <div class="voucher-modal" id="voucherModal" style="display: none;">--%>
        <%--        <div class="modal-content">--%>
        <%--            <h3>Chọn Voucher</h3>--%>
        <%--            <div class="voucher-list">--%>
        <%--                <div class="voucher-item">--%>
        <%--                    <img src="${pageContext.request.contextPath}/images/sale5.png" alt="Voucher 50k" class="voucher-image">--%>
        <%--                    <div class="voucher-info">--%>
        <%--                        <input type="radio" id="voucher1" name="voucher" value="50000" />--%>
        <%--                        <label for="voucher1">Giảm ₫50,000<br>Đơn tối thiểu: ₫250,000<br>HSD: 30/12/2024</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="voucher-item">--%>
        <%--                    <img src="${pageContext.request.contextPath}/images/sale10.png" alt="Voucher 100k" class="voucher-image">--%>
        <%--                    <div class="voucher-info">--%>
        <%--                        <input type="radio" id="voucher2" name="voucher" value="100000" />--%>
        <%--                        <label for="voucher2">Giảm ₫100,000<br>Đơn tối thiểu: ₫500,000<br>HSD: 31/12/2024</label>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="voucher-item">--%>
        <%--                    <input type="radio" id="voucherNone" name="voucher" value="0" />--%>
        <%--                    <label for="voucherNone">Không sử dụng voucher</label>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--            <div class="modal-actions">--%>
        <%--                <button class="modal-close" onclick="hideVoucherModal()">Trở lại</button>--%>
        <%--                <button class="modal-confirm" onclick="confirmVoucher()">Xác nhận</button>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        <div class="payment-method-section">
            <h2>Chọn phương thức thanh toán</h2>
            <select id="payment-method" onchange="toggleSummary()">
                <option value="">Chọn phương thức thanh toán</option>
                <option value="cash">Thanh toán khi nhận hàng</option>
                <option value="vnpay">Thanh toán trực tuyến</option>
            </select>
        </div>

        <!-- Thông tin thanh toán (ẩn/hiện) -->
        <div class="summary-section" style="display: none;">
            <h2>Thông tin thanh toán</h2>
            <div class="summary-details">
                <span class="label">Tổng tiền hàng:</span>
                <span id="total-price">${gh.sanPhamChiTiet.gia_ban}₫</span>
            </div>
            <input type="hidden" name="totalPrice" id="totalPriceInput" value="">

            <!-- Phí vận chuyển -->
            <div class="summary-details" style="margin-top: 10px;">
                <span class="label">Phí vận chuyển:</span>
                <span class="shipping-info" id="shippingFee">30,000₫</span> <!-- Mặc định hiển thị 30,000 -->
            </div>


            <div class="summary-details">
                <span class="label">Voucher giảm giá:</span>
                <span class="voucher-discount">₫0</span>
            </div>
            <!-- Tổng thanh toán -->
            <div class="summary-details">
                <span class="label">Tổng thanh toán:</span>
                <span id="total-pay-price"></span> <!-- Đảm bảo phần tử này tồn tại -->
            </div>
        </div>

        <!-- VNPay Section (ẩn/hiện) -->
        <div class="vnpay-section" style="display: none;">
            <h2>Thanh toán qua VNPay</h2>
            <p>Vui lòng sử dụng ứng dụng VNPay để thanh toán. Quét mã QR hoặc đăng nhập để hoàn tất giao dịch.</p>
            <button>
                Chuyển hướng thanh toán VNPay

            </button>
        </div>

        <!-- Place Order Button -->

        <button type="submit" class="place-order-button">Đặt hàng</button>
    </form>

</div>
<script>
    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });
    }
    // // Hàm cập nhật tổng tiền và gán vào input ẩn
    function updateTotalPrice() {
        const input = document.querySelector('.quantity-input');
        const price = parseFloat(input.dataset.price); // Lấy giá bán từ thuộc tính data-price
        const quantity = parseInt(input.value); // Lấy số lượng hiện tại

        // Tính tổng tiền
        const total = price * quantity;
        console.log(total);
        // Cập nhật tổng tiền trên giao diện
        document.getElementById('total-price').textContent = formatCurrency(total);

        // Cập nhật giá trị tổng tiền vào input ẩn
        document.getElementById('totalPriceInput').value = total;

    }

    // Hàm định dạng tiền tệ
    function formatCurrency(amount) {
        return amount.toLocaleString() + '₫';
    }

    //phí vận chuyển
    document.getElementById('tinhThanhPho').addEventListener('input', function () {
        const input = this.value.trim().toLowerCase();  // Lấy giá trị nhập và chuyển về chữ thường
        const shippingInfo = document.getElementById('shipping-info');  // Hiển thị thông báo
        const shippingFeeElement = document.querySelector('.shipping-info');  // Hiển thị phí vận chuyển trong summary-details
        const phiVanChuyen = document.getElementById('phiVanChuyen');  // Trường phí vận chuyển ẩn
        let shippingFee = '30,000₫';  // Mặc định là phí vận chuyển 30,000₫
        let feeValue = 30000; // Mặc định là 30,000₫

        // Kiểm tra xem nhập có phải "Hà Nội" không
        if (input === 'hà nội') {
            shippingInfo.style.color = 'green';  // Màu xanh cho miễn phí vận chuyển
            shippingInfo.textContent = 'Miễn phí vận chuyển';  // Thông báo miễn phí vận chuyển
            shippingFee = '0₫';  // Phí vận chuyển là 0
            feeValue = 0; // Phí vận chuyển là 0
        } else if (input !== '') {
            shippingInfo.style.color = 'red';  // Màu đỏ cho phí vận chuyển
            shippingInfo.textContent = 'Phí vận chuyển: 30,000 VNĐ';  // Thông báo phí vận chuyển
        } else {
            shippingInfo.textContent = '';  // Không hiển thị khi ô nhập trống
        }

        // Cập nhật lại giá trị trong phần tử summary-details
        shippingFeeElement.textContent = shippingFee;

        // Cập nhật giá trị phí vận chuyển vào trường ẩn
        phiVanChuyen.value = feeValue;

        updateTotalPrice();
    });

    // Hàm định dạng số thành tiền Việt Nam Đồng
    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }




    // Hàm cập nhật tổng tiền cho tất cả các sản phẩm
    function updateTotalPrice() {
        let totalPrice = 0;
        let shippingFee = 0;

        // Lấy giá trị phí vận chuyển từ phần tử có id="shippingFee"
        let shippingFeeText = document.getElementById("shippingFee").innerText;
        shippingFee = parseInt(shippingFeeText.replace(/[^\d]/g, ''));

        // Kiểm tra nếu phí vận chuyển hợp lệ
        if (isNaN(shippingFee)) {
            console.error("Phí vận chuyển không hợp lệ.");
            return;
        }

        // Lặp qua tất cả các ô nhập số lượng và tính tổng tiền
        document.querySelectorAll('.quantity-input').forEach(function(input) {
            const price = parseFloat(input.dataset.price); // Lấy giá bán từ thuộc tính data-price
            const quantity = parseInt(input.value); // Lấy số lượng

            // Kiểm tra nếu giá bán và số lượng hợp lệ
            if (isNaN(price) || isNaN(quantity)) {
                console.error("Giá bán hoặc số lượng không hợp lệ.");
                return;
            }

            // Tính tổng tiền cho mỗi sản phẩm và cộng dồn vào tổng tiền
            totalPrice += price * quantity;
        });

        // Tính tổng tiền thanh toán (bao gồm phí vận chuyển)
        const totalPayPrice = totalPrice + shippingFee;

        // Cập nhật giá trị tổng tiền vào input ẩn
        document.getElementById('totalPriceInput').value = totalPrice.toFixed(2);

        // Hiển thị tổng tiền hàng
        document.getElementById('total-price').textContent = formatCurrency(totalPrice);

        // Hiển thị tổng tiền thanh toán (bao gồm phí vận chuyển)
        document.getElementById('total-pay-price').textContent = formatCurrency(totalPayPrice);
    }

    // Gọi hàm khi giá trị số lượng thay đổi
    document.querySelectorAll('.quantity-input').forEach(function(input) {
        input.addEventListener('input', updateTotalPrice);
    });

    // Gọi hàm ngay khi tải trang để tính tổng ban đầu
    updateTotalPrice();

    // Hàm định dạng tiền tệ
    function formatCurrency(amount) {
        return amount.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
    }



    //     // Hàm cập nhật tổng tiền và gán vào input ẩn
    //     function updateTotalPrice() {
    //         const input = document.querySelector('.quantity-input');
    //         const price = parseFloat(input.dataset.price); // Lấy giá bán từ thuộc tính data-price
    //         const quantity = parseInt(input.value); // Lấy số lượng hiện tại
    //
    //         // Tính tổng tiền
    //         const total = price * quantity;
    // console.log(total);
    //         // Cập nhật tổng tiền trên giao diện
    //         document.getElementById('total-price').textContent = formatCurrency(total);
    //
    //         // Cập nhật giá trị tổng tiền vào input ẩn
    //         document.getElementById('totalPriceInput').value = total;
    //
    //     }
    //
    // Hàm định dạng tiền tệ
    function formatCurrency(amount) {
        return amount.toLocaleString() + '₫';
    }

    // Xử lý sự kiện tăng/giảm số lượng
    document.querySelectorAll('.quantity-btn').forEach(button => {
        button.addEventListener('click', function () {
            // Tìm input liên quan trong cùng dòng
            const input = this.parentElement.querySelector('.quantity-input');
            const price = parseFloat(input.getAttribute('data-price'));
            let quantity = parseInt(input.value);

            // Tăng hoặc giảm số lượng
            if (this.classList.contains('increase')) {
                quantity++;
            } else if (this.classList.contains('decrease')) {
                quantity = Math.max(1, quantity - 1); // Không giảm dưới 1
            }

            // Cập nhật giá trị input
            input.value = quantity;

            // Cập nhật tổng tiền (có thể thêm logic tổng tiền theo sản phẩm)
            updateTotalPrice();
        });
    });


    // //tăng giảm value
    // document.querySelectorAll('.quantity-btn').forEach(button => {
    //     button.addEventListener('click', function () {
    //         const input = this.parentElement.querySelector('input[name="soLuongBH"]');
    //         let currentValue = parseInt(input.value);
    //
    //         // Xử lý tăng/giảm giá trị
    //         if (this.classList.contains('increase')) {
    //             currentValue++;
    //         } else if (this.classList.contains('decrease')) {
    //             currentValue = Math.max(1, currentValue - 1); // Không cho giảm dưới 1
    //         }
    //
    //         // Cập nhật giá trị mới
    //         input.value = currentValue;
    //     });
    // });

    function toggleSummary() {
        const paymentMethod = document.getElementById("payment-method").value;
        const summarySection = document.querySelector(".summary-section");
        const vnpaySection = document.querySelector(".vnpay-section");
        const placeOrderButton = document.querySelector(".place-order-button");

        if (paymentMethod === "cash") {
            summarySection.style.display = "block";
            vnpaySection.style.display = "none";
            placeOrderButton.classList.add("show");
        } else if (paymentMethod === "vnpay") {
            summarySection.style.display = "none";
            vnpaySection.style.display = "block";
            placeOrderButton.classList.add("show");
        } else {
            summarySection.style.display = "none";
            vnpaySection.style.display = "none";
            placeOrderButton.classList.remove("show");
        }
    }
    function showVoucherModal() {
        document.getElementById("voucherModal").style.display = "flex";
    }

    function hideVoucherModal() {
        document.getElementById("voucherModal").style.display = "none";
    }

    function confirmVoucher() {
        const selectedVoucher = document.querySelector('input[name="voucher"]:checked');
        const selectedVoucherText = document.getElementById("selected-voucher");

        if (selectedVoucher) {
            const discount = parseInt(selectedVoucher.value, 10);

            if (discount === 0) {
                selectedVoucherText.textContent = "Bạn không sử dụng voucher.";
            } else {
                selectedVoucherText.textContent = `Bạn đã chọn voucher giảm ${discount.toLocaleString()}₫`;
            }

            updateTotalPayment(discount);
        }

        hideVoucherModal();
    }

    <%--function updateTotalPayment(discount) {--%>
    <%--    const totalAmount = 1800000; // Giá cố định, có thể thay bằng giá động từ server--%>
    <%--    const shippingFee = 30000;  // Phí vận chuyển--%>
    <%--    const finalAmount = totalAmount + shippingFee - discount;--%>

    <%--    // Hiển thị tổng thanh toán mới--%>
    <%--    document.querySelector(".total-payment").textContent = `₫${finalAmount.toLocaleString()}`;--%>
    <%--}--%>


</script>
</body>
</html>
