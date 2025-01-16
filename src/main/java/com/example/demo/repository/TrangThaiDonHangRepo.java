package com.example.demo.repository;

import com.example.demo.entity.TrangThaiDonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrangThaiDonHangRepo extends JpaRepository<TrangThaiDonHang, Integer> {
}
