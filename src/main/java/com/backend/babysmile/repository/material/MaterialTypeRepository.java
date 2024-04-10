package com.backend.babysmile.repository.material;

import com.backend.babysmile.model.entities.MaterialType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MaterialTypeRepository extends JpaRepository<MaterialType, Integer> {
//    @Query("select m.type_id, m.type_name from MaterialType m")
//    public List<MaterialType> findAllTypes();
}
