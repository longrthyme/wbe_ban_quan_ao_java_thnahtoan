package com.example.demo.dto;


public class SanPhamChiTietDTO {

    private Integer idSanPhamCT;
    private String maSpct;
    private String size;
    private Integer soLuongTon;
    private Double giaBan;
    private Integer trangThai;
    private String tenThuongHieu;  // Add this field to hold the name of the ThuongHieu.

    // Constructor
    public SanPhamChiTietDTO(Integer idSanPhamCT, String maSpct, String size, Integer soLuongTon, Double giaBan, Integer trangThai, String tenThuongHieu) {
        this.idSanPhamCT = idSanPhamCT;
        this.maSpct = maSpct;
        this.size = size;
        this.soLuongTon = soLuongTon;
        this.giaBan = giaBan;
        this.trangThai = trangThai;
        this.tenThuongHieu = tenThuongHieu;
    }

    // Getters and Setters
    public Integer getIdSanPhamCT() {
        return idSanPhamCT;
    }

    public void setIdSanPhamCT(Integer idSanPhamCT) {
        this.idSanPhamCT = idSanPhamCT;
    }

    public String getMaSpct() {
        return maSpct;
    }

    public void setMaSpct(String maSpct) {
        this.maSpct = maSpct;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Integer getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(Integer soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public Double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(Double giaBan) {
        this.giaBan = giaBan;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    public String getTenThuongHieu() {
        return tenThuongHieu;
    }

    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }
}
