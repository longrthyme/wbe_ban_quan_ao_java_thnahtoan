package com.example.demo.repository;

import com.example.demo.entity.KhachHang;
import com.example.demo.entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepo extends JpaRepository<NhanVien, Integer> {
    NhanVien findByEmail(String email);
//    @Query("""
//    SELECT kh FROM KhachHang kh WHERE id = :idKhachHang
//""")
//    NhanVien findByIdKH(Integer idKhachHang);
//
//    @Query("SELECT k FROM KhachHang k WHERE sdt = :sdt")
//    List<NhanVien> findBySdt(@Param("sdt") String sdt);
//
//    @Override
//    List<KhachHang> findAll();
//    // -- Tìm kiếm --
//    List<KhachHang> findByMaKhachHangContaining(String maKhachHang);
//    // Check trùng mã khách hàng
//    boolean existsByMaKhachHang(String maKhachHang);
}
