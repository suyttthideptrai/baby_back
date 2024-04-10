package com.backend.babysmile.repository.vendor;

import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.entities.VendorMaterialType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface VendorTypeRepository extends JpaRepository<VendorMaterialType, Long> {

    @Query("SELECT vm FROM VendorMaterialType vm WHERE vm.vendor = ?1 AND vm.materialType = ?2")
    Optional<VendorMaterialType> findExistingVendorMaterialType(Vendor vendorId, MaterialType materialId);

    @Query("SELECT vm FROM VendorMaterialType vm WHERE vm.vendor = ?1")
    List<VendorMaterialType> findAllMaterialTypesByVendorId(Vendor vendor);
}
