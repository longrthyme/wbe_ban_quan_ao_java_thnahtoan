package com.example.demo.controllers;

import com.example.demo.entity.*;
import com.example.demo.repository.*;
import org.eclipse.tags.shaded.org.apache.regexp.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("ban-hang")
public class BanHangRest {
    @Autowired
    private HoaDonRepo hoaDonRepo;

    @Autowired
    private HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    private SanPhamChiTietRepo sanPhamChiTietRepo;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("view")
    public ResponseEntity<List<HoaDonChiTiet>> BanHang(@RequestParam Integer idHoaDon){
        List<HoaDonChiTiet> hoadon = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
        return ResponseEntity.ok(hoadon);
    }

    @GetMapping("view12")
    public ResponseEntity<List<SanPham>> spct(@RequestParam String loaiSP){
        List<SanPham> sanPhamChiTiets = sanPhamRepository.findByLoaiSP(loaiSP);
        return ResponseEntity.ok(sanPhamChiTiets);
    }

//    @PostMapping("/them-san-pham")
//    public ResponseEntity<HoaDonChiTiet> themsanpham(@RequestParam Integer idSanPhamCT,
//                                                     @RequestParam Integer idHoaDon){
//        SanPhamChiTiet sanPhamct = (SanPhamChiTiet) sanPhamChiTietRepo.findById(idSanPhamCT).orElse(null);
//
//        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
//        hoaDonChiTiet.setMa_hdct(taoMaHoaDonChiTiet()); // Tạo mã hóa đơn chi tiết mới
//        hoaDonChiTiet.setId_san_pham_ct(idSanPhamCT);
//        hoaDonChiTiet.setId_hoa_don(idHoaDon);
//        hoaDonChiTiet.setSoluong(1);
//        hoaDonChiTiet.setDon_gia(sanPhamct.getGia_ban()); //chỉ hiển thị là giá
//
//        HoaDonChiTiet hdct = hoaDonChiTietRepo.save(hoaDonChiTiet);
//
//        return ResponseEntity.ok(hdct);
//    }

    public String taoMaHoaDon() {
        String prefix = "HD";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp; // Ví dụ: HD20241115123045
    }

//    public String taoMaHoaDonChiTiet() {
//        String prefix = "HDCT";
//        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
//        return prefix + timestamp; // Ví dụ: HD20241115123045
//    }

//    @PutMapping("/add-khach-hang1")
//    public ResponseEntity<HoaDon> addKhachHang(@RequestParam Integer idHoaDon,
//                                               @RequestParam Integer idKhachHang,
//                                               Model model){
//        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
//
//        if(hoaDon == null){
//            return null;
//        }
//
//        KhachHang khachHang = khachHangRepository.findByIdKH(idKhachHang);
//
//        if(khachHang == null){
//            return null;
//        }
//
//        hoaDon.setKhachHang(khachHang);
//
//        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);  // Lưu vào CSDL
//
//        model.addAttribute("hoadonNew", hoadonNew);  // Thêm đối tượng HoaDon vào mô hình để có thể sử dụng trong view
//        return ResponseEntity.ok(hoadonNew);
//        //0 là đang giao 1 là đã giao
//    }

//    @PostMapping("/xac-nhan-mua-hang")
//    public ResponseEntity<HoaDon> taoHoaDon(Integer idHoaDon,Double tongTien, String diaChi, String email, String sdt, Model model){
//
//        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
//        if(hoaDon == null){
//            return null;
//        }
//
//        hoaDon.setDiachi(diaChi);
//        hoaDon.setEmail(email);
//        hoaDon.setSdt(sdt);
//        hoaDon.setTong_tien(tongTien);
//        hoaDon.setTrang_thai_don_hang("Đã thanh toán"); // đã mua hàng
//
//        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);  // Lưu vào CSDL
//
//        model.addAttribute("hoadonNew", hoadonNew);  // Thêm đối tượng HoaDon vào mô hình để có thể sử dụng trong view
//        return ResponseEntity.ok(hoaDon);
//        //0 là đang giao 1 là đã giao
//    }
}
