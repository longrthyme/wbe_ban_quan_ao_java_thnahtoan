package com.example.demo.repository;

import com.example.demo.entity.GioHang;
import com.example.demo.response.GioHangResponse;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, Integer> {
        List<GioHang> findAll();

        List<GioHang> findByKhachHang_Id(Integer idKhachHang);

        // Query để lấy giỏ hàng theo id_gio_hang và id_khach_hang
        @Query("SELECT gh FROM GioHang gh WHERE gh.khachHang.id = :idKhachHang AND gh.id_gio_hang IN :idGioHang")
        List<GioHang> findByIdGioHangAndIdKhachHangIn(Integer idKhachHang, List<Integer> idGioHang);

        @Query("SELECT g FROM GioHang g WHERE g.khachHang.id = :khachHangId AND g.sanPhamChiTiet.id_san_pham_ct = :sanPhamChiTietId")
        GioHang findByKhachHangAndSanPhamChiTiet(@Param("khachHangId") Integer khachHangId,
                                                 @Param("sanPhamChiTietId") Integer sanPhamChiTietId);

//    @Query("""
//    Select new com.example.demo.response.GioHangResponse(gh.id,gh.ma,gh.nguoiNhan,gh.sdt,gh.email,gh.noiNhan,gh.khachHang.tenKhachHang)
//    From GioHang gh
//    """)
//    List<GioHangResponse> getAll();
//
//    @Transactional
//    @Modifying
//    @Query(value = """
//        DELETE FROM GioHang where id = :id
//    """, nativeQuery = true)
//    void delete(Integer id);
}
