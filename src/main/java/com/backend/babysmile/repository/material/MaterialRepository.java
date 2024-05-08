package com.backend.babysmile.repository.material;

import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.model.entities.Material;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;
import java.util.Optional;


public interface MaterialRepository extends JpaRepository<Material, String> {
    Optional<Material> findByMaterialId(String materialId);

    @Query("SELECT m FROM Material m WHERE m.materialName LIKE %:materialName%")
    List<Material> findAllByMaterialNameLike(@Param("materialName") String materialName);

    @Query("SELECT m FROM Material m WHERE m.materialId LIKE %:id%")
    List<Material> findSuggestionById(@Param("id") String id);

    @Query("SELECT m.materialPrice FROM Material m WHERE m.materialId = :id")
    Long findMaterialPriceByMaterialId(@Param("id") String materialId);

    @Query("SELECT m FROM Material m WHERE m.vendor.vendorId = :vendor_id AND m.materialName LIKE %:material_name%")
    List<Material> findByVendorIdAndMaterialNameLike(@Param("vendor_id")String vendorId,@Param("material_name") String materialName);
}


