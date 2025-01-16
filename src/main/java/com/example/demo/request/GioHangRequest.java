package com.example.demo.request;

import com.example.demo.entity.KhachHang;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class GioHangRequest {
    private Integer id;

    private String ma;

    private String nguoiNhan;

    private String sdt;

    private String email;

    private String noiNhan;

    private KhachHang khachHang;
}
