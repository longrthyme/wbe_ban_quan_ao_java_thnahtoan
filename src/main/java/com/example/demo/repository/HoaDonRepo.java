package com.example.demo.repository;

import com.example.demo.entity.HoaDon;
import com.example.demo.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, Integer> {
    @Query("""
    SELECT hd
        FROM HoaDon hd
        WHERE hd.id_hoa_don = :idHoaDon
    """)
    HoaDon findByIdHD(Integer idHoaDon);

    @Query("""
    SELECT hd
    FROM HoaDon hd
    WHERE hd.id_thanh_toan = 2 AND hd.id_loai_hoa_don = 1
""")

    List<HoaDon> allHoaDonCho();

    @Query("""
        SELECT hd
        FROM HoaDon hd
        WHERE hd.ma_hd = :ma_hd
""")
    List<HoaDon> findByMaHD(@Param("ma_hd") String ma_hd);

    @Query("""
        SELECT h FROM HoaDon h WHERE h.khachHang.email = :email
""")
    List<HoaDon> findLstHoaDon(@Param("email") String email);

    @Query("SELECT COALESCE(SUM(hd.tong_tien), 0) " +  // COALESCE sẽ trả về 0 nếu kết quả là null
            "FROM HoaDon hd " +
            "WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 5 " +
            "AND FUNCTION('MONTH', hd.ngay_tao) = :month")
    BigDecimal findTotalAmountByTrangThaiAndMonth(@Param("month") int month);

//tìm kiếm hóa đơn có trạng thái đã hoàn thành trong năm
@Query("SELECT SUM(hd.tong_tien) FROM HoaDon hd WHERE FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE) AND hd.trangThaiDonHang.id_trang_thai_don_hang = 5")
BigDecimal getTotalSumForCurrentYear();

    // Truy vấn đếm số lượng hóa đơn có trạng thái đơn hàng = 5
    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 5 " +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangHoanThanh();

    // Truy vấn đếm số lượng hóa đơn có trạng thái đơn hàng = 3
    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 3" +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangDangGiao();

    // Truy vấn đếm số lượng hóa đơn có trạng thái đơn hàng = 6
    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 6" +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangBiHuy();

    @Query("SELECT SUM(h.tong_tien) FROM HoaDon h WHERE FUNCTION('DAY', h.ngay_tao) = :day AND h.trangThaiDonHang.id_trang_thai_don_hang = 5")
    Double findTotalAmountByDayAndStatus(int day);

    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 5 " +
            "AND FUNCTION('MONTH', hd.ngay_tao) = :month " +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangHoanThanhThang(@Param("month") int month);

    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 3 " +
            "AND FUNCTION('MONTH', hd.ngay_tao) = :month " +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangDangGiaoThang(@Param("month") int month);

    @Query("SELECT COUNT(hd) FROM HoaDon hd WHERE hd.trangThaiDonHang.id_trang_thai_don_hang = 6 " +
            "AND FUNCTION('MONTH', hd.ngay_tao) = :month " +
            "AND FUNCTION('YEAR', hd.ngay_tao) = FUNCTION('YEAR', CURRENT_DATE)")
    long donHangBiHuyThang(@Param("month") int month);

    @Query("SELECT SUM(h.tong_tien) FROM HoaDon h WHERE h.trangThaiDonHang.id_trang_thai_don_hang = 5 AND h.ngay_tao = CURRENT_DATE")
    Double findTongTienHomNay();

}