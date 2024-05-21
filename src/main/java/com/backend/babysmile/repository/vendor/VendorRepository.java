package com.backend.babysmile.repository.vendor;

import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.enums.HiddenStatus;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface VendorRepository extends JpaRepository<Vendor, String> {
    @Query("SELECT m FROM Vendor m WHERE m.vendorName LIKE %:vendorName% AND m.hiddenStatus = 0")
    List<Vendor> findByVendorName(String vendorName);

//    @Query("SELECT m FROM Vendor m WHERE m.vendorId = :vendorId AND m.vendorName = :vendorName")
//    List<Vendor> findByIdAndName(@Param("vendorId") String vendorId, @Param("vendorName") String vendorName);

    @Query("SELECT m FROM Vendor m WHERE m.vendorId LIKE %:vendorId%")
    List<Vendor> findByIdLike(@Param("vendorId") String vendorId);

    @Transactional
    @Modifying
    @Query("UPDATE Vendor v SET v.hiddenStatus = 1 WHERE v.id IN :ids")
    void hideAllByIds(Set<String> ids);

    List<Vendor> findAllByHiddenStatus(HiddenStatus hiddenStatus);
}
