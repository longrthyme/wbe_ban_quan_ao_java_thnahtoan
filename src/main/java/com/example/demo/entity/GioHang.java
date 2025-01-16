package com.example.demo.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "gio_hang")
public class GioHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_gio_hang")
    private Integer id_gio_hang;

    @Column(name = "ma_gh")
    private String ma_gh;

    @Column(name = "nguoi_nhan")
    private String nguoi_nhan;

    @Column(name = "sdt_gh")
    private String sdt_gh;

    @Column(name = "email_gh")
    private String email_gh;

    @Column(name = "noi_nhan")
    private String noi_nhan;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang", referencedColumnName = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_san_pham_ct", referencedColumnName = "id_san_pham_ct")
    private SanPhamChiTiet sanPhamChiTiet;

//    @ManyToOne
//    @JoinColumn(name = "id")
//    private KhachHang khachHang;
}
