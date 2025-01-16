package com.example.demo.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GioHangResponse {
    private Integer id;

    private String ma;

    private String nguoiNhan;

    private String sdt;

    private String email;

    private String noiNhan;

    private String tenKhachHang;

}
