package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Entity
//@Table(name = "san_pham_ct")
//public class SanPhamChiTiet {
//        @Id
//        @GeneratedValue(strategy = GenerationType.IDENTITY)
//        @Column(name = "id_san_pham_ct")
//        private Integer id_san_pham_ct;
//        @Column(name = "ma_spct")
//        private String ma_spct;
//
////        @Column(name = "id_san_pham")
////        private Integer id_san_pham;
////
////        @Column(name = "id_mau_sac")
////        private Integer id_mau_sac;
//
////        @Column(name = "id_thuong_hieu")
////        private Integer id_thuong_hieu;
//
//        @Column(name = "size")
//        private String size;
//
//        @Column(name = "so_luong_ton")
//        private Integer so_luong_ton;
//
//        @Column(name = "gia_ban")
//        private Double gia_ban;
//
//        @Column(name = "trang_thai")
//        private int trang_thai;
////        @Column(name = "diachi")
////        private String diachi;
////
////
////        @Column(name = "email")
////        private String email;
////
////        @Column(name = "sdt")
////        private String sdt;
////        @Column(name = "trang_thai_don_hang")
////        private String trang_thai_don_hang;
////
////        @Column(name = "trang_thai")
////        private int trangThai;
//
//
//        @ManyToOne
//        @JoinColumn(name = "id_san_pham", referencedColumnName = "id_san_pham")
//        private SanPham sanPham;
//
//        @ManyToOne
//        @JoinColumn(name = "id_mau_sac", referencedColumnName = "id_mau_sac")
//        private MauSac mauSac;
//
//        @ManyToOne
//        @JoinColumn(name = "id_thuong_hieu", referencedColumnName = "id_thuong_hieu")
//        private ThuongHieu thuongHieu;
////    @ManyToOne
////    @JoinColumn(name = "id")
////    private KhachHang khachHang;
////    @ManyToOne
////    @JoinColumn(name = "id")
////    private KhachHang khachHang;
////    @ManyToOne
////    @JoinColumn(name = "id")
////    private KhachHang khachHang;
//
//
//
//
//
//}






import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "san_pham_ct")
@Data
public class SanPhamChiTiet {
//        @Id
//        @GeneratedValue(strategy = GenerationType.IDENTITY)
//        @Column(name = "id_san_pham_ct")
//        private Integer id;
//
//        @Column(name = "ma_spct")
//        private String maSpct;
//
//        @Column(name = "id_san_pham")
//        private Integer idSanPham;
//
//        @Column(name = "id_mau_sac")
//        private Integer idMauSac;
//
//        @Column(name = "id_thuong_hieu")
//        private Integer idThuongHieu;
//
//        @Column(name = "size")
//        private Integer kichCo;
//
//        @Column(name = "gia_ban")
//        private String gia;
//
//        @Column(name = "so_luong_ton")
//        private Integer soLuongTon;
//
//        @Column(name = "trang_thai")
//        private Boolean trangThai;

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_san_pham_ct")
        private Integer id_san_pham_ct;
//        @Column(name = "ma_spct")
//        private String ma_spct;


        @Column(name = "ma_spct")
        private String maSpct;

        @Column(name = "size")
        private String size;

        @Column(name = "so_luong_ton")
        private Integer so_luong_ton;

        @Column(name = "gia_ban")
        private Double gia_ban;

        @Column(name = "trang_thai")
        private int trang_thai;


        @Column(name = "id_thuong_hieu")
        private Integer idThuongHieu;

        @ManyToOne
        @JoinColumn(name = "id_san_pham", referencedColumnName = "id_san_pham")
        private SanPham sanPham;

        @ManyToOne
        @JoinColumn(name = "id_mau_sac", referencedColumnName = "id_mau_sac")
        private MauSac mauSac;


}
// Getters and Setters
