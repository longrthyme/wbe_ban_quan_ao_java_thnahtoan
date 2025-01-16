package com.example.demo.controllers;

import com.example.demo.entity.GioHang;
import com.example.demo.entity.KhachHang;
import com.example.demo.repository.GioHangRepository;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.request.GioHangRequest;
import com.example.demo.response.GioHangResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GioHangController {

    @Autowired
    KhachHangRepository khachHangRepository;

//    @Autowired
//    GioHangRepository gioHangRepository;

//    @GetMapping("/hien-thi")
//    public List<GioHangResponse> getAll(){
//        return gioHangRepository.getAll();
//    }

//    @PostMapping("/add")
//    public String add(@RequestBody GioHangRequest request) {
//        if (request == null) {
//            return "Dữ liệu không hợp lệ.";
//        }
//
//        if (request.getMa() == null || request.getSdt() == null || request.getKhachHang() == null) {
//            return "Thiếu dữ liệu bắt buộc.";
//        }
//
//        GioHang ghang = new GioHang();
//        ghang.setId(request.getId());
//        ghang.setMa(request.getMa());
//        ghang.setNguoiNhan(request.getNguoiNhan());
//        ghang.setSdt(request.getSdt());
//        ghang.setEmail(request.getEmail());
//        ghang.setNoiNhan(request.getNoiNhan());
//
//        KhachHang khachHang = khachHangRepository.findById(request.getKhachHang().getId())
//                .orElseThrow(() -> new RuntimeException("Khách hàng không tồn tại."));
//        ghang.setKhachHang(khachHang);
//
//        GioHang gioHang = gioHangRepository.save(ghang);
//        return "Thêm thành công với ID: " + gioHang.getId();
//    }
//
//    @PutMapping("/update")
//    public String update(@RequestBody GioHangRequest gioHangRequest){
//        GioHang n = new GioHang();
//        n.setId(gioHangRequest.getId());
//        n.setMa(gioHangRequest.getMa());
//        n.setNguoiNhan(gioHangRequest.getNguoiNhan());
//        n.setSdt(gioHangRequest.getSdt());
//        n.setEmail(gioHangRequest.getEmail());
//        n.setNoiNhan(gioHangRequest.getNoiNhan());
//        n.setKhachHang(gioHangRequest.getKhachHang());
//        GioHang gioHang = gioHangRepository.save(n);
//        if (n == null){
//            return "Sua khong thanh cong";
//        }
//        return "Sua thanh cong";
//    }
//
//    @DeleteMapping("/delete/{id}")
//    public String delete(@PathVariable("id") Integer id){
//        try{
//            gioHangRepository.delete(id);
//            return "xoa thanh cong";
//        }catch (Exception e){
//            e.printStackTrace();
//            return "Xoa khong thanh cong";
//        }
//    }
}
