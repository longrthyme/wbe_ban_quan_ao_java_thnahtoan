package com.example.demo.repository;
import com.example.demo.entity.MauSac;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MauSacRepo extends JpaRepository<MauSac, Integer> {
    @Query("SELECT k FROM MauSac k WHERE " +
            "(:tenMS IS NULL OR k.tenMS LIKE %:tenMS%)")
    Page<MauSac> searchMauSac(
            @Param("tenMS") String tenMS,
            Pageable pageable);
    boolean existsByTenMS(String tenMS);

}
