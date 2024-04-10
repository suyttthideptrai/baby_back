package com.backend.babysmile.repository.vendor;

import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.Vendor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VendorRepository extends JpaRepository<Vendor, String> {
    @Query("SELECT m FROM Vendor m WHERE m.vendorName LIKE %:vendorName%")
    List<Vendor> findByVendorName(String vendorName);

}
