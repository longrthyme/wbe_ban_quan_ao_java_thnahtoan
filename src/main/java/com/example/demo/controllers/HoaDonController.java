package com.example.demo.controllers;

import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import com.example.demo.entity.TrangThaiDonHang;
import com.example.demo.repository.HoaDonChiTietRepo;
import com.example.demo.repository.HoaDonRepo;
import com.example.demo.repository.TrangThaiDonHangRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {

    @Autowired
    private HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    private HoaDonRepo hoaDonRepo;

    @Autowired
    private TrangThaiDonHangRepo trangThaiDonHangRepo;

    @GetMapping("/hoa-don")
    public String ListHoaDon(Model model) {
        List<HoaDon> hoaDon = hoaDonRepo.findAll();
        model.addAttribute("hoaDon", hoaDon);
        return "hoa-don/hoa-don";
    }


    @GetMapping("/hoa-don-chi-tiet")
    public String ListHDCT(@RequestParam("idHoaDon") Integer idHoaDon, Model model) {
        // Lấy danh sách chi tiết hóa đơn dựa trên id_hoa_don
        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getAllChiTietHDByIdHoaDon(idHoaDon);
        // Đưa danh sách vào Model để hiển thị trên JSP
        model.addAttribute("hoaDonChiTiet", hoaDonChiTiet);

        List<TrangThaiDonHang> trangThaiDonHang = trangThaiDonHangRepo.findAll();
        model.addAttribute("trangThaiDonHang", trangThaiDonHang);

        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
        model.addAttribute("hoaDon", hoaDon);

        // Trả về trang JSP hiển thị chi tiết hóa đơn
        return "hoa-don/hoa-don-chi-tiet";
    }

    @GetMapping("/tim-kiem-hoa-don")
    public String timKiemHoaDon(
            @RequestParam("ma_hd") String ma_hd,
            Model model) {
        // Kiểm tra nếu mã hóa đơn không được cung cấp
        if (ma_hd == null || ma_hd.trim().isEmpty()) {
            model.addAttribute("errorMessage", "Vui lòng nhập mã hóa đơn.");
            return "hoa-don/tim-hoa-don";
        }

        // Tìm hóa đơn theo mã
        List<HoaDon> hoaDon = hoaDonRepo.findByMaHD(ma_hd);

        // Nếu không tìm thấy hóa đơn, hiển thị thông báo lỗi
        if (hoaDon == null) {
            model.addAttribute("errorMessage", "Không tìm thấy hóa đơn phù hợp.");
            return "hoa-don/tim-kiem";
        }

        // Nếu tìm thấy, thêm thông tin hóa đơn vào model
        model.addAttribute("hoaDon", hoaDon);
        return "hoa-don/tim-hoa-don"; // Trả về trang hiển thị kết quả
    }


    @PostMapping("/tang-trang-thai")
    public String tangTrangThai(@RequestParam("idHoaDon") Integer idHoaDon,
                                  @RequestParam("idTrangThai") Integer idTrangThai,
                                  Model model) {

        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
        trangThaiDonHang.setId_trang_thai_don_hang(idTrangThai+1);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);

        hoaDonRepo.save(hoaDon);

        return "redirect:/hoa-don/hoa-don";
    }
   @PostMapping("/giam-trang-thai")
    public String giamTrangThai(@RequestParam("idHoaDon") Integer idHoaDon,
                                  @RequestParam("idTrangThai") Integer idTrangThai,
                                  Model model) {

        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
        trangThaiDonHang.setId_trang_thai_don_hang(idTrangThai-1);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);

        hoaDonRepo.save(hoaDon);

        return "redirect:/hoa-don/hoa-don";
    }
    @PostMapping("/huy-trang-thai")
    public String huyTrangThai(@RequestParam("idHoaDon") Integer idHoaDon,
                                @RequestParam("idTrangThai") Integer idTrangThai,
                                Model model) {

        TrangThaiDonHang trangThaiDonHang = new TrangThaiDonHang();
        HoaDon hoaDon = hoaDonRepo.findByIdHD(idHoaDon);
        trangThaiDonHang.setId_trang_thai_don_hang(6);
        hoaDon.setTrangThaiDonHang(trangThaiDonHang);

        hoaDonRepo.save(hoaDon);

        return "redirect:/hoa-don/hoa-don";
    }



    //        HoaDon hoaDon = new HoaDon();
    //        hoaDon.setMa_hd(taoMaHoaDon());
    //        hoaDon.setId_thanh_toan(2);
    //        hoaDon.setId_loai_hoa_don(1);
    //        hoaDon.setTong_tien(0.0);
    //        hoaDon.setDiachi("...");
    //        hoaDon.setEmail("...");
    //        hoaDon.setSdt("...");
    //        hoaDon.setNgay_tao(Date.valueOf(LocalDate.now()));
    //        hoaDon.setTrangThai(0);
    //
    //        // Gán nhân viên vào hóa đơn
    //        hoaDon.setNhanVien(nhanVien); // Gán đối tượng NhanVien vào hóa đơn
    //
    //        // Lưu hóa đơn
    //        HoaDon hoadonNew = hoaDonRepo.save(hoaDon);
//          HoaDonChiTiet hdct = hdct.set
}
