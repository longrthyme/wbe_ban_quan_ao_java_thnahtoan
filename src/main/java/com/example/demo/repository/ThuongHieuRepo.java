package com.example.demo.repository;

import com.example.demo.entity.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ThuongHieuRepo extends JpaRepository<ThuongHieu, Integer> {
    @Query("SELECT k FROM ThuongHieu k WHERE " +
            "(:tenTH IS NULL OR k.tenTH LIKE %:tenTH%)")
    Page<ThuongHieu> searchThuongHieu(
            @Param("tenTH") String tenTH,
            Pageable pageable);
    boolean existsByTenTH(String tenTH);
}
