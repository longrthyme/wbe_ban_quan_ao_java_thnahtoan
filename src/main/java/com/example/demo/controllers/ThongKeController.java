package com.example.demo.controllers;

import com.example.demo.entity.HoaDon;
import com.example.demo.repository.HoaDonRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequestMapping("/thong-ke")
public class ThongKeController {

    @Autowired
    HoaDonRepo hoaDonRepo;
//    @GetMapping("/thong-ke")
//    public String thongKe() {
//
//
//
//        return "thong-ke/thong-ke";
//    }

    @GetMapping("/thong-ke")
    public String getThongKe(Model model) {
        List<String> tongTienTheoThang = new ArrayList<>();

        // Lấy tổng tiền cho từng tháng
        for (int month = 1; month <= 12; month++) {
            BigDecimal tongTien = hoaDonRepo.findTotalAmountByTrangThaiAndMonth(month);
            // Format BigDecimal thành chuỗi số không có dấu phẩy, thay thế null thành "0"
            tongTienTheoThang.add(tongTien != null ? tongTien.toPlainString() : "0");
        }

        Integer currentYear = LocalDate.now().getYear();
        model.addAttribute("currentYear", currentYear);

        BigDecimal tongTienTheoNam = hoaDonRepo.getTotalSumForCurrentYear();
        model.addAttribute("tongTienTheoNam", tongTienTheoNam);
        System.out.println("aaaaaa" + tongTienTheoNam);

        long donHangHoanThanh = hoaDonRepo.donHangHoanThanh();
        model.addAttribute("donHangHoanThanh", donHangHoanThanh);

        long donHangDangGiao = hoaDonRepo.donHangDangGiao();
        model.addAttribute("donHangDangGiao", donHangDangGiao);

        long donHangBiHuy = hoaDonRepo.donHangBiHuy();
        model.addAttribute("donHangBiHuy", donHangBiHuy);

        // In dữ liệu ra console để kiểm tra
        System.out.println("Tổng tiền theo tháng: " + tongTienTheoThang);

        // Truyền dữ liệu sang view
        model.addAttribute("tongTienTheoThang", tongTienTheoThang);

        return "thong-ke/thong-ke"; // Tên file HTML
    }

    @GetMapping("/thang-nay")
    public String getThangNay(@RequestParam("month") Integer month, Model model) {
        // Lấy năm hiện tại
        int year = java.time.Year.now().getValue();


        BigDecimal tongTien = hoaDonRepo.findTotalAmountByTrangThaiAndMonth(month);

        // Xác định số ngày trong tháng
        YearMonth yearMonth = YearMonth.of(year, month);
        int daysInMonth = yearMonth.lengthOfMonth();

        // Tạo danh sách các ngày trong tháng
        var days = IntStream.rangeClosed(1, daysInMonth).boxed().collect(Collectors.toList());

        // Khởi tạo danh sách tổng tiền theo ngày
        List<Double> totalAmounts = new ArrayList<>();

        // Lặp qua các ngày và lấy tổng tiền theo từng ngày
        for (int day : days) {
            Double totalAmount = hoaDonRepo.findTotalAmountByDayAndStatus(day);
            totalAmounts.add(totalAmount != null ? totalAmount : 0.0); // Nếu không có kết quả, gán 0
        }

        long donHangHoanThanh = hoaDonRepo.donHangHoanThanhThang(month);
        model.addAttribute("donHangHoanThanh", donHangHoanThanh);

        long donHangDangGiao = hoaDonRepo.donHangDangGiaoThang(month);
        model.addAttribute("donHangDangGiao", donHangDangGiao);

        long donHangBiHuy = hoaDonRepo.donHangBiHuyThang(month);
        model.addAttribute("donHangBiHuy", donHangBiHuy);

        // Đưa thông tin vào Model
        model.addAttribute("month", month);
        model.addAttribute("days", days);
        model.addAttribute("totalAmounts", totalAmounts);
        model.addAttribute("tongTien", tongTien);

        return "thong-ke/thong-ke-thang"; // Tên file JSP trả về
    }

    @GetMapping("/hom-nay")
    public String getDoanhThuHomNay(Model model) {
        // Lấy ngày hôm nay
        LocalDate currentDate = LocalDate.now();

        // Lấy tổng tiền hôm nay
        Double todayMoney = hoaDonRepo.findTongTienHomNay();
        model.addAttribute("todayMoney", todayMoney);

        // Định dạng ngày theo định dạng bạn muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentDate.format(formatter);

        // Thêm ngày hôm nay vào model
        model.addAttribute("today", formattedDate);

        return "thong-ke/thong-ke-hom-nay"; // Trả về trang JSP
    }
}


