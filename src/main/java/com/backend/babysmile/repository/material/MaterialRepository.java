package com.backend.babysmile.repository.material;

import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.enums.HiddenStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;


public interface MaterialRepository extends JpaRepository<Material, String> {
    Optional<Material> findByMaterialId(String materialId);

    @Query("SELECT m FROM Material m WHERE m.materialName LIKE %:materialName% AND m.hiddenStatus = 0")
    List<Material> findAllByMaterialNameLike(@Param("materialName") String materialName);

    @Query("SELECT m FROM Material m WHERE m.materialId LIKE %:id% AND m.hiddenStatus = 0")
    List<Material> findSuggestionById(@Param("id") String id);

    @Query("SELECT m.materialPrice FROM Material m WHERE m.materialId = :id")
    Long findMaterialPriceByMaterialId(@Param("id") String materialId);

    @Query("SELECT m FROM Material m WHERE m.vendor.vendorId = :vendorId AND m.hiddenStatus = 0")
    List<Material> findAllByVendorId(@Param("vendorId") String vendorId);  // Corrected query

    @Query("SELECT m FROM Material m WHERE m.vendor.vendorId = :vendor_id AND m.materialName LIKE %:material_name% AND m.hiddenStatus = 0")
    List<Material> findByVendorIdAndMaterialNameLike(@Param("vendor_id")String vendorId,@Param("material_name") String materialName);

    @Modifying
    @Transactional
    @Query("UPDATE Material m SET m.hiddenStatus = 1 WHERE m.id IN :ids")
    void hideAllById(@Param("ids") Set<String> ids);

    List<Material> findAllByHiddenStatus(HiddenStatus hiddenStatus);
}


