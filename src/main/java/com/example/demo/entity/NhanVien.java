package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "nhan_vien")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_nhan_vien")
    private Integer id_nhan_vien;
    @Column(name = "ma_nv")
    private String ma_nv;
    @Column(name = "ten_nv")
    private String ten_nv;
    @Column(name = "ngay_sinh")
    private Date ngay_sinh;
    @Column(name = "gioi_tinh")
    private String gioi_tinh;
    @Column(name = "sdt")
    private String sdt;
    @Column(name = "dia_chi")
    private String dia_chi;
    @Column(name = "email")
    private String email;
    @Column(name = "mat_khau")
    private String mat_khau;
    @Column(name = "anh_dai_dien")
    private String anh_dai_dien;
    @Column(name = "chuc_vu")
    private String chuc_vu;
    @Column(name = "trang_thai")
    private Integer trang_thai;

}
