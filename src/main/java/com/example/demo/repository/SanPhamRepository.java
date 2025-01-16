package com.example.demo.repository;

import com.example.demo.entity.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//@Repository
//public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
//
//    List<SanPham> findByMaContainingAndTrangThai(String ma, Boolean trangThai);
//
//    List<SanPham> findByTenContainingAndTrangThai(String ten, Boolean trangThai);
//
//    List<SanPham> findByTrangThai(Boolean trangThai);
//
//    // Tìm kiếm sản phẩm theo tên có phân trang
//    Page<SanPham> findByTenContaining(String ten, Pageable pageable);
//
//     // Lấy tất cả sản phẩm có trạng thái = 0 (trạng thái là false)
//     List<SanPham> findByTrangThaiFalse();
//
//    @Query("""
//    SELECT DISTINCT sp.loai
//    FROM SanPham sp
//    ORDER BY sp.loai
//""")
//    List<String> findDistinctLoai();
//
//    @Query("""
//    SELECT sp
//    FROM SanPham sp
//    WHERE sp.loai = :loaiSP AND sp.trangThai = FALSE
//    """)
//    List<SanPham> findByLoaiSP(@Param("loaiSP") String loaiSP);
//}


@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query("SELECT k FROM SanPham k WHERE " +
            "(:maSP IS NULL OR k.maSP LIKE %:maSP%) AND " +
            "(:trangThai IS NULL OR k.trangThai = :trangThai)")
    Page<SanPham> searchSanPham(
            @Param("maSP") String maSP,
            @Param("trangThai") Boolean trangThai,
            Pageable pageable);

    boolean existsByMaSP(String maSP);

    @Query("SELECT sp FROM SanPham sp WHERE sp.id = :productId")
    List<SanPham> findDetailsByProductId(@Param("productId") Integer productId);


//    List<SanPham> findByMaContainingAndTrangThai(String ma, Boolean trangThai);

    List<SanPham> findByMaSPContainingAndTrangThai(String maSP, Boolean trangThai);


//    List<SanPham> findByTenContainingAndTrangThai(String ten, Boolean trangThai);

    List<SanPham> findByTrangThai(Boolean trangThai);

    // Tìm kiếm sản phẩm theo tên có phân trang
//    Page<SanPham> findByTenSPContaining(String ten, Pageable pageable);

    // Lấy tất cả sản phẩm có trạng thái = 0 (trạng thái là false)
    List<SanPham> findByTrangThaiFalse();

    @Query("""
    SELECT DISTINCT sp.loai
    FROM SanPham sp
    ORDER BY sp.loai
""")
    List<String> findDistinctLoai();

    @Query("""
    SELECT sp
    FROM SanPham sp
    WHERE sp.loai = :loaiSP AND sp.trangThai = FALSE
    """)
    List<SanPham> findByLoaiSP(@Param("loaiSP") String loaiSP);
}
