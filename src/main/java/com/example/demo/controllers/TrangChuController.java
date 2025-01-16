package com.example.demo.controllers;

import com.example.demo.entity.*;
import com.example.demo.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("trang-chu")
public class TrangChuController {
    @Autowired
    private HoaDonRepo hoaDonRepo;

    @Autowired
    private HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamChiTietRepo sanPhamChiTietRepo;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private TrangThaiDonHangRepo trangThaiDonHangRepo;


    @GetMapping("/trang-chu")
    public String TrangChu(HttpSession session, Model model) {
        List<String> loai = sanPhamRepository.findDistinctLoai();
        model.addAttribute("loai", loai);

        List<SanPham> sanPham = sanPhamRepository.findByTrangThaiFalse();
        model.addAttribute("sanPham", sanPham);

        String email = (String) session.getAttribute("userEmail");

        if (email != null) {
            KhachHang khachHang = khachHangRepository.findByEmail(email);
            if (khachHang != null) {
                model.addAttribute("customerName", khachHang.getTenKhachHang());
                model.addAttribute("isLoggedIn", true); // Indicate that the user is logged in
            } else {
                model.addAttribute("customerName", "Bạn chưa đăng nhập");
                model.addAttribute("isLoggedIn", false); // Indicate that the user is not logged in
            }
        } else {
            model.addAttribute("customerName", "Bạn chưa đăng nhập");
            model.addAttribute("isLoggedIn", false); // Indicate that the user is not logged in
        }

        return "/trang-chu/trang-chu";
    }

    @GetMapping("/san-pham-chi-tiet")
    public String timKiemSanPhamChiTiet(@RequestParam("idSanPham") Integer idSanPham, Model model) {

            // lấy danh sách sản phẩm
            List<SanPham> sanPham = sanPhamRepository.findByTrangThaiFalse();
            model.addAttribute("sanPham", sanPham);

            // lấy danh sách sản phẩm chi tiết
            List<SanPhamChiTiet> danhSachSanPhamChiTiet = sanPhamChiTietRepo.findBySanPhamId(idSanPham);
            model.addAttribute("danhSachSanPhamChiTiet", danhSachSanPhamChiTiet);

            System.out.println("Số lượng sản phẩm chi tiết: " + danhSachSanPhamChiTiet.size());
            return "/trang-chu/trang-chu-spct"; // Tên file JSP hiển thị kết quả

    }

    @GetMapping("/loc")
    public String listLoai(@RequestParam String loaiSP, Model model) {
        List<String> loai = sanPhamRepository.findDistinctLoai();
        model.addAttribute("loai", loai);

        List<SanPham> sanPham = sanPhamRepository.findByLoaiSP(loaiSP);
        model.addAttribute("sanPham", sanPham);
        return "trang-chu/trang-chu";
    }

    @GetMapping("/gio-hang")
    public String gioHang(HttpSession session, Model model) {
        // Lấy email từ session
        String email = (String) session.getAttribute("userEmail");

        // Tìm khách hàng theo email
        KhachHang khachHang = khachHangRepository.findByEmail(email);
        Integer khachHangID = khachHang.getId();

        if (khachHang == null) {
            model.addAttribute("error", "Không tìm thấy khách hàng.");
            return "error-page"; // Thay thế bằng trang lỗi của bạn
        }

        // Lấy danh sách giỏ hàng theo ID khách hàng
        List<GioHang> gioHangs = gioHangRepository.findByKhachHang_Id(khachHangID);

        // Đưa danh sách giỏ hàng vào model để hiển thị trên view
        model.addAttribute("gioHangs", gioHangs);

        double total = 0;
        for (GioHang gh : gioHangs) {
            total += gh.getSanPhamChiTiet().getGia_ban();
        }

        // Đưa tổng thanh toán vào model
        model.addAttribute("totalPayment", total);

        return "trang-chu/gio-hang"; // Tên file view
    }

    @PostMapping("/gio-hang/add")
    public String addGioHang(@RequestParam("idSanPhamChiTiet") Integer idSanPhamChiTiet,
                             @RequestParam("idSanPham") Integer idSanPham,
                             HttpSession session, Model model) {

        String email = (String) session.getAttribute("userEmail");

        // Tìm khách hàng dựa vào email
        KhachHang khachHang = khachHangRepository.findByEmail(email);
        if (khachHang == null) {
            model.addAttribute("error", "Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng!");
            return "redirect:/dang-nhap/login";
        }

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng của khách hàng hay chưa
        GioHang gioHangExisting = gioHangRepository.findByKhachHangAndSanPhamChiTiet(khachHang.getId(), idSanPhamChiTiet);

        if (gioHangExisting != null) {
            // Nếu sản phẩm đã tồn tại, thêm thông báo vào model
            model.addAttribute("message", "Sản phẩm này đã có trong giỏ hàng của bạn!");
            return "redirect:/trang-chu/san-pham-chi-tiet?idSanPham=" + idSanPham;
        }

        // Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
        SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();
        sanPhamChiTiet.setId_san_pham_ct(idSanPhamChiTiet);

        GioHang gioHang = new GioHang();
        gioHang.setMa_gh(taoMaGioHang());
        gioHang.setSanPhamChiTiet(sanPhamChiTiet);
        gioHang.setKhachHang(khachHang);

        // Lưu giỏ hàng mới
        GioHang gioHangNew = gioHangRepository.save(gioHang);
        model.addAttribute("gioHang", gioHangNew);

        // Thêm thông báo thành công
        model.addAttribute("message", "Thêm sản phẩm vào giỏ hàng thành công!");

        return "redirect:/trang-chu/san-pham-chi-tiet?idSanPham=" + idSanPham;
    }

    @GetMapping("/thanh-toan-mua-ngay")
    public String ThanhToanNow(@RequestParam Integer idSanPhamChiTiet,
                            Model model, HttpSession session) {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (session.getAttribute("userEmail") == null) {
            // Nếu chưa đăng nhập, hiển thị thông báo và chuyển hướng sang trang đăng nhập
            model.addAttribute("redirectMessage", "Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.");
            return "trang-chu/trang-chu"; // Chuyển đến file JSP để hiển thị thông báo
        } else {
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepo.findBySanPhamChiTietId(idSanPhamChiTiet);
//        SanPham sanPham = sanPhamRepository.findById(idSanPhamChiTiet).orElse(null);
//        sanPhamChiTiet.setSo_luong_ton();
        model.addAttribute("sanPhamChiTiet",sanPhamChiTiet);
        return "thanh_toan/tt";
        }
    }

    @GetMapping("/thanh-toan-gio-hang")
    public String ThanhToanGH(@RequestParam("idGioHang") List<Integer> idGioHang,
                              Model model, HttpSession session) {
        if (idGioHang == null) {
            // Xử lý khi không có sản phẩm nào được chọn
            model.addAttribute("error", "Bạn chưa chọn sản phẩm nào để thanh toán.");
            return "redirect:/gio-hang"; // Chuyển hướng lại trang giỏ hàng
        }

        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (session.getAttribute("userEmail") == null) {
            // Nếu chưa đăng nhập, hiển thị thông báo và chuyển hướng sang trang đăng nhập
            model.addAttribute("redirectMessage", "Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.");
            return "trang-chu/trang-chu"; // Chuyển đến file JSP để hiển thị thông báo
        } else {

            String email = (String) session.getAttribute("userEmail");

            KhachHang khachHang = khachHangRepository.findByEmail(email);

            Integer idKhachHang = khachHang.getId();

            List<GioHang> gioHang = gioHangRepository.findByIdGioHangAndIdKhachHangIn(idKhachHang, idGioHang);

            model.addAttribute("gioHang", gioHang);

//            SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepo.findBySanPhamChiTietId(idSanPhamChiTiet);
//        SanPham sanPham = sanPhamRepository.findById(idSanPhamChiTiet).orElse(null);
//        sanPhamChiTiet.setSo_luong_ton();
//            model.addAttribute("sanPhamChiTiet",sanPhamChiTiet);
            return "thanh_toan/ttgh";
        }
    }

    @PostMapping("/add-mua-ngay")
    public String taoHoaDonNow(@RequestParam("tenNguoiNhan") String tenNguoiNhan,
                            @RequestParam("soDienThoai") String soDienThoai,
                            @RequestParam("email") String emaill,
                            @RequestParam("diaChi") String diaChi,
                            @RequestParam("tinhThanhPho") String tinhThanhPho,
                            @RequestParam("idSanPhamChiTiet") Integer idSanPhamChiTiet,
                            @RequestParam("soLuongBH") Integer soLuongBH,
                            @RequestParam("phiVanChuyen") Double phiVanChuyen,
                            @RequestParam("totalPrice") Double totalPrice,
                            Model model, HttpSession session) {

        String email = (String) session.getAttribute("userEmail");

        KhachHang khachHang = khachHangRepository.findByEmail(email);
        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        trangThaiDonHang.setId_trang_thai_don_hang(1);

        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietRepo.findBySanPhamChiTietId(idSanPhamChiTiet);
        // Tạo và thiết lập đối tượng HoaDon
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa_hd(taoMaHoaDon());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setId_thanh_toan(2);
        hoaDon.setTen_nguoi_nhan(tenNguoiNhan);
        hoaDon.setId_loai_hoa_don(2);
        hoaDon.setTong_tien(0.0);
        hoaDon.setNgay_tao(Date.valueOf(LocalDate.now()));
        hoaDon.setThanh_pho(tinhThanhPho);
        hoaDon.setDiachi(diaChi);
        hoaDon.setEmail(emaill);
        hoaDon.setSdt(soDienThoai);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);
        hoaDon.setTrangThai(0);
        hoaDon.setTong_tien(totalPrice);
        hoaDon.setPhi_van_chuyen(phiVanChuyen);
        sanPhamChiTiet.setSo_luong_ton(sanPhamChiTiet.getSo_luong_ton()-1);

        // Gán idSanPhamChiTiet vào đối tượng HoaDon
//        hoaDon.setSanPhamChiTiet(sanPhamChiTiet);

        // Lưu vào database
        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);


        SanPhamChiTiet sanPhamChiTietHDCT = sanPhamChiTietRepo.findBySanPhamChiTietId(idSanPhamChiTiet);

        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
        hoaDonChiTiet.setMa_hdct(taoMaHoaDonChiTiet());
        hoaDonChiTiet.setId_hoa_don(hoadonNew.getId_hoa_don());
        hoaDonChiTiet.setSanPhamChiTiet(sanPhamChiTietHDCT);
        hoaDonChiTiet.setSoluong(soLuongBH);
        hoaDonChiTiet.setDon_gia(sanPhamChiTietHDCT.getGia_ban());
        hoaDonChiTiet.setThanh_tien(totalPrice);

        HoaDonChiTiet hoaDonChiTietNew = hoaDonChiTietRepo.save(hoaDonChiTiet);

        // Truyền dữ liệu và thông báo thành công
        model.addAttribute("hoadonNew", hoadonNew);
        model.addAttribute("hoaDonChiTietNew", hoaDonChiTietNew);
        return "redirect:/trang-chu/trang-chu";
    }

    @GetMapping("/thong-tin-khach-hang")
    public String thongTinKhachHang(HttpSession session, Model model) {

        String email = (String) session.getAttribute("userEmail");
        KhachHang khachHang = khachHangRepository.findByEmail(email);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = khachHang.getNgaySinh() != null ? dateFormat.format(khachHang.getNgaySinh()) : "";
        model.addAttribute("formattedNgaySinh", formattedDate);

        model.addAttribute("khachHang", khachHang);

        return "trang-chu/thong-tin-khach-hang";
    }



    @GetMapping("/hoa-don-khach-hang")
    public String hoaDonKhachHang(HttpSession session, Model model) {
        String email = (String) session.getAttribute("userEmail");
        KhachHang khachHang = khachHangRepository.findByEmail(email);

        List<HoaDon> hoaDons = hoaDonRepo.findLstHoaDon(email);

        model.addAttribute("hoaDons", hoaDons);

        return "trang-chu/hoa-don-khach-hang";
    }

//    @GetMapping("/hoa-don-chi-tiet-khach-hang")
////    public String hoaDonKhachHang(HttpSession session, Model model) {
//        String email = (String) session.getAttribute("userEmail");
//        KhachHang khachHang = khachHangRepository.findByEmail(email);
//
//        List<HoaDon> hoaDons = hoaDonRepo.findLstHoaDon(email);
//
//        model.addAttribute("hoaDons", hoaDons);
//
//        return "trang-chu/hoa-don-khach-hang";
//    }

    @GetMapping("/sua-thong-tin")
    public String suaThongTinKhachHang(HttpSession session, Model model) {

        String email = (String) session.getAttribute("userEmail");
        KhachHang khachHang = khachHangRepository.findByEmail(email);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = khachHang.getNgaySinh() != null ? dateFormat.format(khachHang.getNgaySinh()) : "";
        model.addAttribute("formattedNgaySinh", formattedDate);

        model.addAttribute("khachHang", khachHang);

        return "trang-chu/sua-thong-tin-khach-hang";
    }

    @PostMapping("/sua")
    public String sua(@RequestParam String tenKhachHang,
                      @RequestParam Date ngaySinh,
                      @RequestParam String gioiTinh,
                      @RequestParam String sdt,
                      @RequestParam String diaChi,
//                      @RequestParam String email,
                      @RequestParam String matKhau,
                      
                      HttpSession session, Model model) {

        String email = (String) session.getAttribute("userEmail");
        KhachHang khachHang = khachHangRepository.findByEmail(email);
        khachHang.setTenKhachHang(tenKhachHang);
        khachHang.setNgaySinh(ngaySinh);
        khachHang.setGioiTinh(gioiTinh);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
//        khachHang.setEmail(emaill);
        khachHang.setMatKhau(matKhau);


        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = khachHang.getNgaySinh() != null ? dateFormat.format(khachHang.getNgaySinh()) : "";
        model.addAttribute("formattedNgaySinh", formattedDate);

        model.addAttribute("khachHang", khachHang);
        
        
        
        
        return "trang-chu/sua-thong-tin-khach-hang";
    }



    @PostMapping("/add-mua-gio-hang")
    public String taoHoaDonGH(
            @RequestParam("tenNguoiNhan") String tenNguoiNhan,
            @RequestParam("soDienThoai") String soDienThoai,
            @RequestParam("email") String emaill,
            @RequestParam("diaChi") String diaChi,
            @RequestParam("tinhThanhPho") String tinhThanhPho,
            @RequestParam("idSanPhamChiTiet") List<Integer> idSanPhamChiTiet,
            @RequestParam Map<String, String> requestParams, // Lấy tất cả request param
            @RequestParam("phiVanChuyen") Double phiVanChuyen,
            @RequestParam("totalPrice") Double totalPrice,
            Model model, HttpSession session) {

        // Lấy email user từ session
        String email = (String) session.getAttribute("userEmail");
        KhachHang khachHang = khachHangRepository.findByEmail(email);

        // Kiểm tra và lấy số lượng từng sản phẩm
        Map<Integer, Integer> sanPhamSoLuongMap = new HashMap<>();
        for (Integer idSanPham : idSanPhamChiTiet) {
            String key = "soLuongBH_" + idSanPham;
            System.out.println("aaaaaa" +key);
            if (requestParams.containsKey(key)) {
                Integer soLuong = Integer.parseInt(requestParams.get(key));
                sanPhamSoLuongMap.put(idSanPham, soLuong);
            }
        }
        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        trangThaiDonHang.setId_trang_thai_don_hang(1);
        // Tạo hóa đơn và xử lý chi tiết
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa_hd(taoMaHoaDon());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setId_thanh_toan(2);
        hoaDon.setTen_nguoi_nhan(tenNguoiNhan);
        hoaDon.setId_loai_hoa_don(2);
        hoaDon.setTong_tien(0.0);
        hoaDon.setNgay_tao(Date.valueOf(LocalDate.now()));
        hoaDon.setThanh_pho(tinhThanhPho);
        hoaDon.setDiachi(diaChi);
        hoaDon.setEmail(emaill);
        hoaDon.setSdt(soDienThoai);
        hoaDon.setTrangThai(0);
        hoaDon.setTong_tien(totalPrice);
        hoaDon.setPhi_van_chuyen(phiVanChuyen);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);

        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);

        // Xử lý từng sản phẩm chi tiết
        for (Integer idSanPham : sanPhamSoLuongMap.keySet()) {
            SanPhamChiTiet spct = sanPhamChiTietRepo.findBySanPhamChiTietId(idSanPham);
            Integer soLuong = sanPhamSoLuongMap.get(idSanPham);

            System.out.println("bbbbbb" +soLuong);
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setMa_hdct(taoMaHoaDonChiTiet());
            hoaDonChiTiet.setId_hoa_don(hoadonNew.getId_hoa_don());
            hoaDonChiTiet.setSanPhamChiTiet(spct);
            hoaDonChiTiet.setSoluong(soLuong);
            hoaDonChiTiet.setDon_gia(spct.getGia_ban());
            hoaDonChiTiet.setThanh_tien(spct.getGia_ban() * soLuong);

            spct.setSo_luong_ton(spct.getSo_luong_ton() - soLuong);
            hoaDonChiTietRepo.save(hoaDonChiTiet);
        }

        model.addAttribute("hoadonNew", hoadonNew);
        return "redirect:/trang-chu/trang-chu";
    }


    @PostMapping("/bo-chon")
    public String deleteGioHang(@RequestParam("idGioHang") Integer idGioHang, Model model) {
        // Kiểm tra xem giỏ hàng với idGioHang có tồn tại không
        Optional<GioHang> optionalGioHang = gioHangRepository.findById(idGioHang);

        if (optionalGioHang.isPresent()) {
            // Xóa giỏ hàng
            gioHangRepository.deleteById(idGioHang);
            model.addAttribute("message", "Xóa giỏ hàng thành công!");
        } else {
            // Nếu không tồn tại, thêm thông báo lỗi
            model.addAttribute("error", "Giỏ hàng không tồn tại!");
        }

        // Chuyển hướng về trang danh sách giỏ hàng hoặc trang chủ
        return "redirect:/trang-chu/gio-hang";
    }


    //tạo mã hóa đơn
    public String taoMaHoaDon() {
        String prefix = "HD";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }
    //tạo mã hóa đơn chi tiết
    public String taoMaHoaDonChiTiet() {
        String prefix = "HDCT";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }

    //tạo mã giỏ hàng
    public String taoMaGioHang() {
        String prefix = "GH";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }
//    @GetMapping("/trang-chu")
//    public String trangChu(HttpSession session) {
//        String userRole = (String) session.getAttribute("userRole");
//        String userEmail = (String) session.getAttribute("userEmail");
//
//        if (userEmail == null) {
//            return "redirect:/dang-nhap/login"; // Chuyển đến trang đăng nhập nếu không tìm thấy email trong session
//        }
//
//        // Sử dụng userRole và userEmail để xử lý logic cho trang chủ
//        return "trang-chu"; // Trả về trang chủ nếu người dùng đã đăng nhập
//    }

}
