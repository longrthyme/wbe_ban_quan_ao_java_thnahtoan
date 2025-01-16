package com.example.demo.controllers;

import com.example.demo.entity.Home;
import com.example.demo.repository.HomeRepository;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;
import java.util.Map;

// Trang chủ: home/index
// Giỏ hàng(trang chủ): home/cart | thanh-toan
// Khách hàng: khach-hang/index | add | detail/{id} | delete/{id} | search?maKhachHang={maKhachHang}
// Sản phẩm: san-pham/index | them | xoa/{id} | cap-nhat/{id} | tim-kiem
// Giỏ hàng: hien-thi | add | update | delete/{id}

@Controller
@RequestMapping("home")
public class HomeController {

    @Autowired
    private HomeRepository homeRepository;


    @GetMapping("/index")
    public String index(Model model) {
        List<Home> homes = homeRepository.findAll();
        model.addAttribute("homes", homes);
        return "trang-chu/home";
    }


    @GetMapping("/cart")
    public String showCart() {
        return "gio_hang/cart";
    }
    @GetMapping("/thanh-toan")
    public String ThanhToan() {
        return "thanh_toan/tt";
    }
//    @GetMapping("/home/vnpay")
//    public String vnpayReturn(@RequestParam Map<String, String> allParams, Model model) {
//        boolean isValid = VnPayUtils.validateResponse(allParams, "YOUR_VNP_HASH_SECRET");
//        if (isValid && "00".equals(allParams.get("vnp_ResponseCode"))) {
//            model.addAttribute("message", "Thanh toán thành công!");
//        } else {
//            model.addAttribute("message", "Thanh toán thất bại!");
//        }
//        return "payment_result";
//    }
}
