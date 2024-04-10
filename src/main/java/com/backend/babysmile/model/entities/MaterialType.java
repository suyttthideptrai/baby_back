package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.entities.Material;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import  java.util.List;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "material_types")
public class MaterialType{
    public MaterialType(int typeId){
        this.typeId = typeId;
    }
    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int typeId;

    @Column(nullable = false, columnDefinition = "VARCHAR(50)")
    String typeName;

    @OneToMany(
            mappedBy = "materialType"
    )
    @JsonManagedReference
    List<Material> materials;

    @OneToMany(mappedBy = "materialType")
    List<VendorMaterialType> vendorMaterialTypes;
}
