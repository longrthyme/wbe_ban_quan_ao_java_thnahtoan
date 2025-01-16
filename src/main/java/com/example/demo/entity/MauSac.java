package com.example.demo.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

import java.util.Date;

@Entity
@Data
@Table(name = "mau_sac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_mau_sac")
    private Integer idMS;
    @Column(name="ten_mau_sac")
    private String tenMS;
//    @Column(name = "NgayThem", updatable = false, insertable = false)
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date ngayThem;
}
