package com.example.demo.service;

import com.example.demo.entity.KhachHang;
import com.example.demo.entity.NhanVien;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.repository.NhanVienRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class DangNhapService {
    @Autowired
    private NhanVienRepo nhanVienRepo;

    @Autowired
    private KhachHangRepository khachHangRepository;

    public void register(KhachHang khachHang) {
        khachHang.setMaKhachHang(generateMaKh());
        khachHang.setTrangThai(0); //
        khachHangRepository.save(khachHang);
    }

    public boolean loginKH(String email, String matKhau) {
        KhachHang khachHang = khachHangRepository.findByEmail(email);
        return khachHang != null && khachHang.getMatKhau().equals(matKhau);
    }

    public boolean loginNV(String email, String matKhau) {
        NhanVien nhanVien = nhanVienRepo.findByEmail(email);
        return nhanVien != null && nhanVien.getMat_khau().equals(matKhau);
    }

    private String generateMaKh() {
        Optional<KhachHang> lastKhachHang = khachHangRepository.findTopByOrderByIdDesc();
        if (lastKhachHang.isPresent()) {
            String lastMaKh = lastKhachHang.get().getMaKhachHang();
            int nextId = Integer.parseInt(lastMaKh.substring(2)) + 1; // Lấy so sau 'KH'
            return String.format("KH%03d", nextId); // Định dạng lại theo makh KH001, ....
        } else {
            return "KH001";
        }
    }
}