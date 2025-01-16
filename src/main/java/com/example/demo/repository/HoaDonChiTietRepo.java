package com.example.demo.repository;

import com.example.demo.entity.HoaDon;
import com.example.demo.entity.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepo extends JpaRepository<HoaDonChiTiet, Integer> {
    @Query("""
    SELECT hdct FROM HoaDonChiTiet hdct WHERE id_hoa_don = :idHoaDon
""")
    List<HoaDonChiTiet> getAllChiTietHDByIdHoaDon(Integer idHoaDon);

}

