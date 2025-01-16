package com.example.demo.controllers;

import com.example.demo.entity.KhachHang;
import com.example.demo.service.DangNhapService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/dang-nhap")
public class DangNhapController {

    @Autowired
    private DangNhapService dangNhapService;

    @GetMapping("/dang-ki")
    public String showRegistrationForm(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "dang-nhap/dang-ki";
    }

    @PostMapping("/dang-ki")
    public String registerUser(@ModelAttribute KhachHang khachHang) {
        dangNhapService.register(khachHang);
        return "redirect:/dang-nhap/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "dang-nhap/dang-nhap"; // back ve login.jsp
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email, @RequestParam String matKhau, Model model, HttpSession session) {
        if (dangNhapService.loginKH(email, matKhau)) {
            // Lưu thông tin vào session khi đăng nhập thành công
            session.setAttribute("userRole", "khachHang");
            session.setAttribute("userEmail", email);
            return "redirect:/trang-chu/trang-chu"; // chuyển sang trang chủ sau khi login thành công
        } else if (dangNhapService.loginNV(email, matKhau)) {
            // Lưu thông tin vào session khi đăng nhập thành công với vai trò nhân viên
            session.setAttribute("userRole", "nhanVien");
            session.setAttribute("userEmail", email);
            return "redirect:/ban-hang/ban-hang"; // chuyển sang trang bán hàng sau khi login thành công
        } else {
            // Nếu login không thành công, hiển thị lỗi
            model.addAttribute("error", "Email hoặc mật khẩu không đúng");
            return "dang-nhap/dang-nhap"; // back lại trang đăng nhập nếu không đúng
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Xóa tất cả thông tin trong session
        session.invalidate();
        // Chuyển về trang chủ
        return "redirect:/trang-chu/trang-chu";
    }
}