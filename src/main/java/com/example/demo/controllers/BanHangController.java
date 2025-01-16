package com.example.demo.controllers;

import com.example.demo.entity.*;
import com.example.demo.repository.*;
import jakarta.persistence.Id;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("ban-hang")
public class BanHangController {
    @Autowired
    private NhanVienRepo nhanVienRepo;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private HoaDonRepo hoaDonRepo;

    @Autowired
    private HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    private SanPhamChiTietRepo sanPhamChiTietRepo;

    @GetMapping("ban-hang")
    public String BanHang(Model model){
        List<HoaDon> hoadon = hoaDonRepo.allHoaDonCho();
        model.addAttribute("hoadon", hoadon);

        List<KhachHang> khachHang = khachHangRepository.findAll();
        model.addAttribute("khachHang", khachHang);
        return "ban-hang/sell";
    }

    @GetMapping("hoa-don")
    public String BanHang(@RequestParam Integer idHoaDon, Model model) {
        // Lấy danh sách hóa đơn
        List<HoaDon> hoadon = hoaDonRepo.allHoaDonCho();
        model.addAttribute("hoadon", hoadon);

        // Lấy danh sách sản phẩm chi tiết
        List<SanPhamChiTiet> sanphamct = sanPhamChiTietRepo.findAllSP();
        model.addAttribute("sanphamct", sanphamct);

        // Lấy danh sách chi tiết hóa đơn
        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
        model.addAttribute("hoadonct", hoadonct);

        model.addAttribute("idHoaDon", idHoaDon);

        HoaDon hoadonNew = hoaDonRepo.findByIdHD(idHoaDon);
        model.addAttribute("maHoaDon", hoadonNew.getMa_hd());

        List<KhachHang> khachHang = khachHangRepository.findAll();
        model.addAttribute("khachHang", khachHang);

        // Lấy tổng tiền
        double tongTien = hoadonct.stream()
                .mapToDouble(hoaDonChiTiet -> hoaDonChiTiet.getThanh_tien())
                .sum();
        model.addAttribute("tongTien", tongTien);


        // Lấy tên khách hàng từ hóa đơn
        KhachHang khachHangg = hoadonNew.getKhachHang();
        String tenKhachHang = (khachHangg != null) ? khachHangg.getTenKhachHang() : "Chưa chọn khách hàng";
        model.addAttribute("tenKhachHang", tenKhachHang);

        System.out.println("Tổng Tiền: " + tongTien);
        return "ban-hang/sell";
    }

    @PostMapping("/add")
    public String taoHoaDon(Model model, RedirectAttributes redirectAttributes, HttpSession session) {
        // Lấy email từ session
        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng đăng nhập trước khi tạo hóa đơn.");
            return "redirect:/dang-nhap/login";
        }

        // Tìm nhân viên theo email
        NhanVien nhanVien = nhanVienRepo.findByEmail(email);
        if (nhanVien == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy nhân viên với email: " + email);
            return "redirect:/dang-nhap/login";
        }

        // Kiểm tra số lượng hóa đơn chờ
        List<HoaDon> soLuongHoaDon = hoaDonRepo.allHoaDonCho();
        if (soLuongHoaDon.size() >= 5) {
            redirectAttributes.addFlashAttribute("errorMessage", "Tối đa 5 hóa đơn chờ thanh toán.");
            return "redirect:/ban-hang/ban-hang";
        }

        // Tạo mới hóa đơn
        HoaDon hoaDon = new HoaDon();
        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        trangThaiDonHang.setId_trang_thai_don_hang(1);

        hoaDon.setMa_hd(taoMaHoaDon());
        hoaDon.setId_thanh_toan(2);
        hoaDon.setId_loai_hoa_don(1);
        hoaDon.setTong_tien(0.0);
        hoaDon.setDiachi("...");
        hoaDon.setEmail("...");
        hoaDon.setSdt("...");
        hoaDon.setNgay_tao(Date.valueOf(LocalDate.now()));
        hoaDon.setTrangThai(0);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);

        // Gán nhân viên vào hóa đơn
        hoaDon.setNhanVien(nhanVien); // Gán đối tượng NhanVien vào hóa đơn

        // Lưu hóa đơn
        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);

        model.addAttribute("hoadonNew", hoadonNew);
        return "redirect:/ban-hang/ban-hang";
    }


    @PostMapping("/add-khach-hang")
    public String addKhachHang(
            @RequestParam Integer idHoaDon,
            @RequestParam(required = false) Integer idKhachHang,
            Model model) {
        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);

        if (hoaDon == null) {
            return "error"; // Có thể trả về trang lỗi nếu hóa đơn không tồn tại
        }

        KhachHang khachHang;

        if (idKhachHang != null) {
            khachHang = khachHangRepository.findByIdKH(idKhachHang);
        } else {
            khachHang = null;
        }

        if (khachHang == null) {
            // Tạo khách hàng mặc định là "khách lẻ"
            khachHang = new KhachHang();
            khachHang.setMaKhachHang("KHLE");
            khachHang.setTenKhachHang("Khách Lẻ");
            khachHang.setTrangThai(1); // Giá trị trạng thái mặc định, tùy ý
        }

        hoaDon.setKhachHang(khachHang);

        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);

        model.addAttribute("hoadonNew", hoadonNew);

        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }

    @PostMapping("/add-khach-hang-le")
    public String addKhachHangLe(
            @RequestParam Integer idHoaDon,
            @RequestParam(required = false) Integer idKhachHang,
            Model model) {
        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);

        if (hoaDon == null) {
            return "error"; // Có thể trả về trang lỗi nếu hóa đơn không tồn tại
        }

        hoaDon.setKhachHang(khachHangRepository.findByIdKH(21));

        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);

        model.addAttribute("hoadonNew", hoadonNew);

        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }

    @PostMapping("/xac-nhan-mua-hang")
    public String xacNhanMuaHang(
            @RequestParam Integer idHoaDon,
            @RequestParam Double tongTien,
            @RequestParam Double phiVanChuyen,
            @RequestParam Boolean isShippingSelected,
            @RequestParam String diaChi,
            @RequestParam String email,
            @RequestParam String sdt,
            @RequestParam String thanhPho,
            @RequestParam String tenNguoiNhan,
            RedirectAttributes redirectAttributes) {

        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
        if (hoaDon == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy hóa đơn!");
            return "redirect:/ban-hang/ban-hang";
        }

        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        trangThaiDonHang.setId_trang_thai_don_hang(5);

        hoaDon.setDiachi(diaChi);
        hoaDon.setEmail(email);
        hoaDon.setSdt(sdt);
        hoaDon.setId_thanh_toan(1);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);
        hoaDon.setThanh_pho(thanhPho);
        hoaDon.setTen_nguoi_nhan(tenNguoiNhan);
        if (isShippingSelected) {
            hoaDon.setPhi_van_chuyen(phiVanChuyen);
            hoaDon.setTong_tien(tongTien - phiVanChuyen);
        } else {
            hoaDon.setPhi_van_chuyen(0.0);
            hoaDon.setTong_tien(tongTien);
        }

        hoaDonRepo.save(hoaDon);

        // Thêm thông báo thành công
        redirectAttributes.addFlashAttribute("successMessage", "Thanh toán thành công!");
        return "redirect:/ban-hang/ban-hang";
    }



    @PostMapping("/xoa-cthd")
    public String xoaChiTietHoaDon(@RequestParam Integer idHoaDonChiTiet,
                                   @RequestParam Integer idHoaDon,
                                   @RequestParam Integer idSanPhamCT,
                                   Model model) {


        // Tìm chi tiết hóa đơn theo id
        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepo.findById(idHoaDonChiTiet).orElse(null);

        SanPhamChiTiet sanPhamct = sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);
        sanPhamct.setSo_luong_ton(sanPhamct.getSo_luong_ton() + hoaDonChiTiet.getSoluong());
        if (hoaDonChiTiet != null) {
            // Xóa chi tiết hóa đơn
            hoaDonChiTietRepo.delete(hoaDonChiTiet);
        }

        // Lấy danh sách hóa đơn
        List<HoaDon> hoadon = hoaDonRepo.allHoaDonCho();
        model.addAttribute("hoadon", hoadon);

        // Lấy danh sách sản phẩm chi tiết
        List<SanPhamChiTiet> sanphamct = sanPhamChiTietRepo.findAllSP();
        model.addAttribute("sanphamct", sanphamct);

        List<KhachHang> khachHang = khachHangRepository.findAll();
        model.addAttribute("khachHang", khachHang);

        // Chuyển hướng về trang chi tiết hóa đơn sau khi xóa thành công
        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }

    @PostMapping("/them-san-pham")
    public String themSanPham(@RequestParam Integer idSanPhamCT,
                              @RequestParam Integer idHoaDon, Model model) {

        // Lấy danh sách hóa đơn
        List<HoaDon> hoadon = hoaDonRepo.allHoaDonCho();
        model.addAttribute("hoadon", hoadon);

        // Lấy danh sách sản phẩm chi tiết
        List<SanPhamChiTiet> sanphamct = sanPhamChiTietRepo.findAllSP();
        model.addAttribute("sanphamct", sanphamct);


        // Lấy chi tiết hóa đơn theo idHoaDon
        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
        model.addAttribute("hoadonct", hoadonct);

        // Tìm sản phẩm chi tiết theo id
        SanPhamChiTiet sanPhamct = sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);

        // Kiểm tra sản phẩm chi tiết đã tồn tại trong hóa đơn hay chưa
        HoaDonChiTiet existingHoaDonChiTiet = hoadonct.stream()
                .filter(ct -> ct.getSanPhamChiTiet().getId_san_pham_ct().equals(idSanPhamCT))
                .findFirst()
                .orElse(null);

        if (existingHoaDonChiTiet != null) {
            // Nếu sản phẩm đã tồn tại, tăng số lượng
            existingHoaDonChiTiet.setSoluong(existingHoaDonChiTiet.getSoluong() + 1);
            sanPhamct.setSo_luong_ton(sanPhamct.getSo_luong_ton()-1);
            existingHoaDonChiTiet.setThanh_tien(existingHoaDonChiTiet.getSoluong() * existingHoaDonChiTiet.getDon_gia());
            hoaDonChiTietRepo.save(existingHoaDonChiTiet);
        } else {
            // Nếu sản phẩm chưa tồn tại, tạo mới chi tiết hóa đơn
            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
            hoaDonChiTiet.setMa_hdct(taoMaHoaDonChiTiet()); // Tạo mã hóa đơn chi tiết mới
            hoaDonChiTiet.setSanPhamChiTiet(sanPhamct);
            hoaDonChiTiet.setId_hoa_don(idHoaDon);
            hoaDonChiTiet.setSoluong(1); // Số lượng mặc định là 1
            hoaDonChiTiet.setDon_gia(sanPhamct.getGia_ban()); // Lấy giá bán từ sản phẩm
            hoaDonChiTiet.setThanh_tien(hoaDonChiTiet.getSoluong() * hoaDonChiTiet.getDon_gia());
            sanPhamct.setSo_luong_ton(sanPhamct.getSo_luong_ton()-1);
            // Lưu chi tiết hóa đơn vào cơ sở dữ liệu
            hoaDonChiTietRepo.save(hoaDonChiTiet);
        }

        // Tính tổng tiền
        double tongTien = hoadonct.stream()
                .mapToDouble(hoaDonChiTiet -> hoaDonChiTiet.getThanh_tien())
                .sum();

        // Gửi tổng tiền vào model để hiển thị
        model.addAttribute("tongTien", tongTien);
        System.out.println("Tổng Tiền: " + tongTien);

        // Chuyển hướng về trang danh sách hóa đơn chi tiết với idHoaDon
        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }

//    @GetMapping("/hoa-don/tim-kiem-khach-hang")
//    public String timKiemKhachHang(@RequestParam(value = "sdt", required = false) String sdt,
//                                   @RequestParam(value = "idHoaDon", required = false) Integer idHoaDon,
//                                   Model model) {
//        // Kiểm tra giá trị sdt
//        if (sdt != null && !sdt.isEmpty()) {
//            // Xử lý tìm kiếm khách hàng theo số điện thoại
//            KhachHang khachHang = khachHangRepository.findBySdt(sdt);
//            model.addAttribute("khachHang", khachHang); // Truyền danh sách khách hàng sang JSP
//        } else {
//            model.addAttribute("khachHang", new ArrayList<>()); // Nếu không nhập gì, trả về danh sách rỗng
//        }
//
//        // Truyền thêm idHoaDon để xử lý nếu cần
//        model.addAttribute("idHoaDon", idHoaDon);
//        model.addAttribute("sdt", sdt); // Truyền lại số điện thoại đã nhập để hiển thị trong form
//        model.addAttribute("showModal", true);      // Truyền flag để hiển thị modal
//
//        return "ban-hang/hoa-don?idHoaDon=" + idHoaDon;
//    }
@GetMapping("/hoa-don/tim-kiem-khach-hang")
public String timKiemKhachHang(@RequestParam(value = "sdt", required = false) String sdt,
                               @RequestParam(value = "idHoaDon", required = false) Integer idHoaDon,
                               Model model) {
    List<KhachHang> khachHang = khachHangRepository.findAll(); // Lấy tất cả khách hàng mặc định

    if (sdt != null && !sdt.isEmpty()) {
        KhachHang khachHangsdt = khachHangRepository.findBySdt(sdt); // Tìm khách hàng theo số điện thoại
        if (khachHangsdt != null) {
            model.addAttribute("khachHang", List.of(khachHangsdt)); // Trả về danh sách chỉ có khách hàng tìm thấy
        } else {
            model.addAttribute("khachHang", khachHang); // Trả về danh sách rỗng nếu không tìm thấy
            model.addAttribute("errorMessages", "Số điện thoại không tồn tại"); // Thêm thông báo lỗi
        }
    } else {
        model.addAttribute("khachHang", khachHang); // Nếu không nhập số điện thoại, trả về tất cả khách hàng
    }

    List<HoaDon> hoadon = hoaDonRepo.allHoaDonCho(); // Lấy tất cả hóa đơn
    model.addAttribute("hoadon", hoadon);
    model.addAttribute("idHoaDon", idHoaDon);
    model.addAttribute("sdt", sdt);
    model.addAttribute("showModal", true); // Cờ để hiển thị modal

    return "ban-hang/sell"; // Trả về trang JSP tương ứng
}




//    @GetMapping("/hoa-don/tim-kiem-khach-hang")
//    @ResponseBody
//    public ResponseEntity<KhachHang> timKiemKhachHang(@RequestParam String sdt) {
//        KhachHang khachHang = khachHangRepository.findBySdt(sdt);
//        if (khachHang == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
//        }
//        return ResponseEntity.ok(khachHang);
//    }


    //    @GetMapping("/tim-kiem-khach-hang")
//    public String timKiemKhachHang(@RequestParam(value = "idHoaDon", required = false) Integer idHoaDon,
//                                   @RequestParam(value = "sdt", required = false) String sdt, Model model) {
//        List<KhachHang> khachHang;
//
//        if (sdt != null && !sdt.isEmpty()) {
//            khachHang = khachHangRepository.findBySdt(sdt);  // Tìm kiếm theo số điện thoại
//            model.addAttribute("khachHang", khachHang);
//            System.out.println("khachHang"+khachHang);
//        } else {
//            khachHang = null;
//            System.out.println("ko");// Không tìm kiếm, hiển thị tất cả
//        }
////
////        model.addAttribute("khachHang", khachHangs);  // Gửi danh sách khách hàng đến JSP
//
//        // Nếu idHoaDon null, trả về trang mặc định
//        if (sdt == null) {
//            return null;
//        }
//        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
//    }
    @PostMapping("/tang-so-luong")
    public String tangSoLuong(@RequestParam Integer idSanPhamCT,
                              @RequestParam Integer idHoaDon, Model model,
                              HttpServletRequest request) {
        // Lấy danh sách chi tiết hóa đơn theo idHoaDon
        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);

        SanPhamChiTiet sanPhamct = sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);
        sanPhamct.setSo_luong_ton(sanPhamct.getSo_luong_ton()-1);

        // Tìm sản phẩm chi tiết theo idSanPhamCT trong hóa đơn
        HoaDonChiTiet existingHoaDonChiTiet = hoadonct.stream()
                .filter(ct -> ct.getSanPhamChiTiet().getId_san_pham_ct().equals(idSanPhamCT))
                .findFirst()
                .orElse(null);

        if (existingHoaDonChiTiet != null) {
            // Tăng số lượng sản phẩm
            existingHoaDonChiTiet.setSoluong(existingHoaDonChiTiet.getSoluong() + 1);

            // Cập nhật thành tiền
            existingHoaDonChiTiet.setThanh_tien(existingHoaDonChiTiet.getSoluong() * existingHoaDonChiTiet.getDon_gia());

            // Lưu lại thay đổi
            hoaDonChiTietRepo.save(existingHoaDonChiTiet);
        }

        // Tính tổng tiền mới
        double tongTien = hoadonct.stream()
                .mapToDouble(hoaDonChiTiet -> hoaDonChiTiet.getThanh_tien())
                .sum();

        // Gửi tổng tiền vào model để hiển thị nếu cần
        model.addAttribute("tongTien", tongTien);
        System.out.println("Tổng Tiền: " + tongTien);

        // Chuyển hướng về trang danh sách hóa đơn
        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }
    @PostMapping("/giam-so-luong")
    public String giamSoLuong(@RequestParam Integer idSanPhamCT,
                              @RequestParam Integer idHoaDon, Model model,
                              HttpServletRequest request) {
        // Lấy danh sách chi tiết hóa đơn theo idHoaDon
        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);


        SanPhamChiTiet sanPhamct = sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);
        sanPhamct.setSo_luong_ton(sanPhamct.getSo_luong_ton()+1);

        // Tìm sản phẩm chi tiết theo idSanPhamCT trong hóa đơn
        HoaDonChiTiet existingHoaDonChiTiet = hoadonct.stream()
                .filter(ct -> ct.getSanPhamChiTiet().getId_san_pham_ct().equals(idSanPhamCT))
                .findFirst()
                .orElse(null);

        if (existingHoaDonChiTiet != null) {
            // Tăng số lượng sản phẩm
            existingHoaDonChiTiet.setSoluong(existingHoaDonChiTiet.getSoluong() - 1);

            // Cập nhật thành tiền
            existingHoaDonChiTiet.setThanh_tien(existingHoaDonChiTiet.getSoluong() * existingHoaDonChiTiet.getDon_gia());

            // Lưu lại thay đổi
            hoaDonChiTietRepo.save(existingHoaDonChiTiet);
        }

        // Tính tổng tiền mới
        double tongTien = hoadonct.stream()
                .mapToDouble(hoaDonChiTiet -> hoaDonChiTiet.getThanh_tien())
                .sum();

        // Gửi tổng tiền vào model để hiển thị nếu cần
        model.addAttribute("tongTien", tongTien);
        System.out.println("Tổng Tiền: " + tongTien);

        // Chuyển hướng về trang danh sách hóa đơn
        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
    }


    //    @PostMapping("/them-khach-hang")
//    public String themKhachHang(@RequestParam Integer idSanPhamCT,
//                                @RequestParam Integer idHoaDon, Model model) {
//        // Lấy danh sách hóa đơn
//        List<HoaDon> hoadon = hoaDonRepo.findAll();
//        model.addAttribute("hoadon", hoadon);
//
//        List<KhachHang> khachHang = khachHangRepository.findAll();
//        model.addAttribute("khachHang", khachHang);
//
//        // Lấy chi tiết hóa đơn theo idHoaDon
//        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
//        model.addAttribute("hoadonct", hoadonct);
//
//        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
//    }
//@GetMapping("/them-khach-hang")
//public String themKhachHang(@RequestParam Integer idHoaDon, Model model) {
//    // Lấy danh sách khách hàng
//    List<KhachHang> khachHang = khachHangRepository.findAll();
//    model.addAttribute("khachHang", khachHang);
//
//    // Truyền idHoaDon để sử dụng trong giao diện
//    model.addAttribute("idHoaDon", idHoaDon);
//
//    // Trả về view hiển thị modal thêm khách hàng
//    return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
//}


//    @PostMapping("/them-san-pham")
//    public String themSanPham(@RequestParam Integer idSanPhamCT,
//                              @RequestParam Integer idHoaDon, Model model) {
//
//        // Lấy danh sách hóa đơn
//        List<HoaDon> hoadon = hoaDonRepo.findAll();
//        model.addAttribute("hoadon", hoadon);
//
//        // Lấy danh sách sản phẩm chi tiết
//        List<SanPhamChiTiet> sanphamct = sanPhamChiTietRepo.findAll();
//        model.addAttribute("sanphamct", sanphamct);
//
//        // Lấy chi tiết hóa đơn theo idHoaDon
//        List<HoaDonChiTiet> hoadonct = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
//        model.addAttribute("hoadonct", hoadonct);
//
//        // Tìm sản phẩm chi tiết theo id
//        SanPhamChiTiet sanPhamct = sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);
//
//        // Kiểm tra sản phẩm chi tiết đã tồn tại trong hóa đơn hay chưa
//        boolean isExists = hoadonct.stream()
//                .anyMatch(ct -> ct.getSanPhamChiTiet().getId_san_pham_ct().equals(idSanPhamCT));
//
//        if (isExists) {
//            // Hiển thị thông báo nếu sản phẩm đã tồn tại
//            model.addAttribute("message", "Sản phẩm chi tiết đã tồn tại trong hóa đơn.");
//            return "hoaDonChiTietView"; // Tên view hiển thị danh sách hóa đơn chi tiết
//        }
//        else{
//            // Tạo mới chi tiết hóa đơn
//            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//            hoaDonChiTiet.setMa_hdct(taoMaHoaDonChiTiet()); // Tạo mã hóa đơn chi tiết mới
//            hoaDonChiTiet.setSanPhamChiTiet(sanPhamct); //
//            hoaDonChiTiet.setId_hoa_don(idHoaDon);
//            hoaDonChiTiet.setSoluong(1); // Số lượng là 1
//            hoaDonChiTiet.setDon_gia(sanPhamct.getGia_ban()); // Lấy giá bán từ sản phẩm
//            hoaDonChiTiet.setThanh_tien(hoaDonChiTiet.getSoluong()*hoaDonChiTiet.getDon_gia());
//
//            // Lưu chi tiết hóa đơn vào cơ sở dữ liệu
//            hoaDonChiTietRepo.save(hoaDonChiTiet);
//        }
//
//        // Chuyển hướng về trang danh sách hóa đơn chi tiết với idHoaDon
//        return "redirect:/ban-hang/hoa-don?idHoaDon=" + idHoaDon;
//    }



    public String taoMaHoaDon() {
        String prefix = "HD";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }

    public String taoMaHoaDonChiTiet() {
        String prefix = "HDCT";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }
}
