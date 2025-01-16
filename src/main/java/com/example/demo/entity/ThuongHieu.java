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

@Data
@Entity
@Table(name = "thuong_hieu")
public class ThuongHieu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "id_thuong_hieu")
    private Integer id;

    @Column(name = "ten_thuong_hieu")
    private String tenTH;

//    @Column(name = "NgayThem", updatable = false, insertable = false)
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date ngayThem;
}
