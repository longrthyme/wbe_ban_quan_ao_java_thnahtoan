package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hoa_don_ct")
public class HoaDonChiTiet {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id_hoa_don_ct")
        private Integer id_hoa_don_ct;
        @Column(name = "ma_hdct")
        private String ma_hdct;
//        @Column(name = "id_san_pham_ct")
//        private Integer id_san_pham_ct;
        @Column(name = "id_hoa_don")
        private Integer id_hoa_don;

        @Column(name = "soluong")
        private Integer soluong;

        @Column(name = "don_gia")
        private Double don_gia;

        @Column(name = "thanh_tien")
        private Double thanh_tien;

        @Column(name = "trang_thai")
        private int trang_thai;


        @ManyToOne
        @JoinColumn(name = "id_san_pham_ct", referencedColumnName = "id_san_pham_ct")
        private SanPhamChiTiet sanPhamChiTiet;


//        @Column(name = "diachi")
//        private String diachi;
//
//
//        @Column(name = "email")
//        private String email;
//
//        @Column(name = "sdt")
//        private String sdt;
//        @Column(name = "trang_thai_don_hang")
//        private String trang_thai_don_hang;
//
//        @Column(name = "trang_thai")
//        private int trangThai;


//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
    }


