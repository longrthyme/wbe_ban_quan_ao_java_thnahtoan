package com.example.demo.service;

import com.example.demo.dto.SanPhamCTDTO;
import com.example.demo.entity.MauSac;
import com.example.demo.entity.SanPham;
import com.example.demo.entity.SanPhamChiTiet;

import com.example.demo.repository.MauSacRepo;
import com.example.demo.repository.SanPhamChiTietRepo;
import com.example.demo.repository.SanPhamRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SanPhamCTService {
//    @Autowired
//    private SanPhamRepository sanPhamRepository;

    @Autowired
    private SanPhamChiTietRepo sanPhamCTRepository;




    @Autowired
    private SanPhamRepository spRepo;

    @Autowired
    private MauSacRepo mauSacRepo;

    @Transactional
    public void updateStatus(Integer id, Boolean newStatus) {
        Optional<SanPhamChiTiet> optionalSanPhamCT = sanPhamCTRepository.findById(id);
        if (optionalSanPhamCT.isPresent()) {
            SanPhamChiTiet sanPhamCT = optionalSanPhamCT.get();
            sanPhamCT.setTrang_thai(newStatus ? 0: 1);  // Update the status
            sanPhamCTRepository.save(sanPhamCT); // Save the updated entity
        } else {
            throw new IllegalArgumentException("SanPhamCT with ID " + id + " not found.");
        }
    }

    public SanPhamChiTiet createSanPhamCT(SanPhamCTDTO request) {
        // Create a new instance of SanPhamCT
        SanPhamChiTiet sanPhamCT = new SanPhamChiTiet();

        MauSac mauSac =mauSacRepo.findById(request.getIdMauSac()).get();

        SanPham existSP = spRepo.findById(request.getIdSanPham()).get();
        // Map DTO properties to the entity
        sanPhamCT.setMauSac(mauSac);
        sanPhamCT.setIdThuongHieu(request.getIdThuongHieu());
        sanPhamCT.setSize(request.getKichCo());
        sanPhamCT.setSo_luong_ton(request.getSoLuong());
        sanPhamCT.setId_san_pham_ct(request.getIdSanPham());
        sanPhamCT.setTrang_thai(0); // Default to active status

        Integer maxId = sanPhamCTRepository.findMaxId(); // Custom query to get the max id
        String newMaSpct = "SPCT" + String.format("%03d", (maxId != null ? maxId + 1 : 1));
        sanPhamCT.setMaSpct(newMaSpct);

        // Optionally set default price
        sanPhamCT.setGia_ban(Double.valueOf("150000.00")); // Example default price

        sanPhamCT.setSanPham(existSP);
        // Save to the database
        return sanPhamCTRepository.save(sanPhamCT);
    }

}

