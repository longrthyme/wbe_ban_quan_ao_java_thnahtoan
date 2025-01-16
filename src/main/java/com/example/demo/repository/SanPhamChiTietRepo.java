package com.example.demo.repository;
import com.example.demo.dto.SanPhamChiTietDTO;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.example.demo.entity.SanPham;
import com.example.demo.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamChiTietRepo
//        extends JpaRepository<SanPhamChiTiet, Integer> {
//    @Query("""
//    SELECT spct FROM SanPhamChiTiet spct
//    	JOIN SanPham sp on spct.sanPham.id = sp.id
//    	WHERE  sp.trangThai = FALSE AND spct.trang_thai = 0
//""")
//    List<SanPhamChiTiet> findAllSP();
//
//    @Query("""
//SELECT spct FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :idSanPham and spct.trang_thai = 0
//""")
//    List<SanPhamChiTiet> findBySanPhamId(@Param("idSanPham") Integer idSanPham);
//
//    @Query("""
//SELECT spct FROM SanPhamChiTiet spct WHERE spct.id_san_pham_ct = :idSanPhamChiTiet
//""")
//    SanPhamChiTiet findBySanPhamChiTietId(@Param("idSanPhamChiTiet") Integer idSanPhamChiTiet);
//
//    @Query("""
//        SELECT spct FROM SanPhamChiTiet spct WHERE spct.id_san_pham_ct IN :idSanPhamChiTiet
//""")
//    List<SanPhamChiTiet> findBySanPhamChiTietIds(@Param("idSanPhamChiTiet") List<Integer> idSanPhamChiTiet);
//
//}

        extends JpaRepository<SanPhamChiTiet, Integer> {
//    @Query("SELECT MAX(s.id) FROM SanPhamChiTiet s")
//    Integer findMaxId();
//
//    @Query(value = "SELECT * FROM san_pham_ct WHERE id_san_pham = ?1", nativeQuery = true)
//    List<SanPhamChiTiet> findByIdSanPhamNative(Integer idSanPham);
//
//    List<SanPhamChiTiet> findByIdSanPham(Integer idSanPham);

    List<SanPhamChiTiet> findByMaSpct(String maSpct);

    @Query(value = "SELECT * FROM san_pham_ct WHERE id_san_pham_ct = ?1", nativeQuery = true)
    List<SanPhamChiTiet> findByIdSanPhamNative(Integer idSanPham);

    @Query(value = "SELECT MAX(id_san_pham_ct) FROM san_pham_ct", nativeQuery = true)
    Integer findMaxId();

    @Query("""
    SELECT spct FROM SanPhamChiTiet spct
    	JOIN SanPham sp on spct.sanPham.id = sp.id
    	WHERE  sp.trangThai = FALSE AND spct.trang_thai = 0
""")
    List<SanPhamChiTiet> findAllSP();

    @Query("""
SELECT spct FROM SanPhamChiTiet spct WHERE spct.sanPham.id = :idSanPham and spct.trang_thai = 0
""")
    List<SanPhamChiTiet> findBySanPhamId(@Param("idSanPham") Integer idSanPham);

    @Query("""
SELECT spct FROM SanPhamChiTiet spct WHERE spct.id_san_pham_ct = :idSanPhamChiTiet
""")
    SanPhamChiTiet findBySanPhamChiTietId(@Param("idSanPhamChiTiet") Integer idSanPhamChiTiet);

    @Query("""
        SELECT spct FROM SanPhamChiTiet spct WHERE spct.id_san_pham_ct IN :idSanPhamChiTiet
""")
    List<SanPhamChiTiet> findBySanPhamChiTietIds(@Param("idSanPhamChiTiet") List<Integer> idSanPhamChiTiet);
//
//    @Query("SELECT new com.example.demo.dto.SanPhamChiTietDTO(" +
//            "spct.id_san_pham_ct, spct.maSpct, spct.size, spct.so_luong_ton, spct.gia_ban, spct.trang_thai, thuongHieu.tenTH) " +
//            "FROM SanPhamChiTiet spct " +
//            "LEFT JOIN ThuongHieu thuongHieu ON spct.idThuongHieu = thuongHieu.id")
//    List<SanPhamChiTietDTO> findSanPhamChiTietWithThuongHieu();

    @Query("SELECT new com.example.demo.dto.SanPhamChiTietDTO(" +
            "spct.id_san_pham_ct, spct.maSpct, spct.size, spct.so_luong_ton, spct.gia_ban, spct.trang_thai, thuongHieu.tenTH) " +
            "FROM SanPhamChiTiet spct " +
            "LEFT JOIN ThuongHieu thuongHieu ON spct.idThuongHieu = thuongHieu.id " +
            "WHERE spct.sanPham.id = :idSanPham")
    List<SanPhamChiTietDTO> findSanPhamChiTietWithThuongHieuBySanPhamId(@Param("idSanPham") Integer idSanPham);

}

