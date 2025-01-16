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
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "khach_hang")
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_khach_hang")
    private Integer id;
    @Column(name = "ma_kh")
    private String maKhachHang;
    @Column(name = "ten_kh")

    private String tenKhachHang;


    @Column(name = "ngay_sinh")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngaySinh;

    @Column(name = "gioi_tinh")
    private String gioiTinh;
    @Column(name = "sdt")
    private String sdt;
    @Column(name = "dia_chi")
    private String diaChi;
    @Column(name = "email")
    private String email;
    @Column(name = "mat_khau")
    private String matKhau;
    @Column(name = "trang_thai")
    private int trangThai;

}
