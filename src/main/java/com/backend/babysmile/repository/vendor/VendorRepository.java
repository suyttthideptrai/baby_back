package com.backend.babysmile.repository.vendor;

import com.backend.babysmile.model.entities.Vendor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface VendorRepository extends JpaRepository<Vendor, String> {
    @Query("SELECT m FROM Vendor m WHERE m.vendorName LIKE %:vendorName%")
    List<Vendor> findByVendorName(String vendorName);

//    @Query("SELECT m FROM Vendor m WHERE m.vendorId = :vendorId AND m.vendorName = :vendorName")
//    List<Vendor> findByIdAndName(@Param("vendorId") String vendorId, @Param("vendorName") String vendorName);

    @Query("SELECT m FROM Vendor m WHERE m.vendorId LIKE %:vendorId%")
    List<Vendor> findByIdLike(@Param("vendorId") String vendorId);
}
