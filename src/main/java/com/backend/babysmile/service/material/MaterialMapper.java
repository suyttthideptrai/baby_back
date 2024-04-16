package com.backend.babysmile.service.material;

import com.backend.babysmile.dto.request.material.AddMaterialRequest;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.material.TypeData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.model.entities.Vendor;

import java.time.Instant;
//import com.backend.babysmile.model.entities.VendorMaterial;

public class MaterialMapper {
    public static MaterialData toMaterialData(Material material){
        return new MaterialData(
                material.getMaterialId()
                ,material.getMaterialName()
                , material.getMaterialPrice()
                ,material.getMaterialQuantity()
                ,material.getMaterialUnitOfMeasure()
                ,material.getMaterialWarehouseDate()
                ,material.getMaterialType().getTypeId()
                ,material.getVendor().getVendorName()
                );
    }

//    public static MaterialData toMaterialDataFromVendorMaterial(VendorMaterial vm){
//        return toMaterialData(vm.getMaterial());
//    }

    public static Material mapAddRequestToMaterial(AddMaterialRequest request) {
        String generatedId = buildMaterialID(request.material_name());
        System.out.println(generatedId);
        return Material.builder()
                .materialId(generatedId)
                .materialName(request.material_name())
                .materialPrice((request.material_price()))
                .materialQuantity(-1)
                .materialUnitOfMeasure(request.material_unit_of_measure())
                .materialWarehouseDate(request.material_warehouse_date())
                .materialType(
                        new MaterialType(request.material_type_id())
                )
                .vendor(
                        new Vendor(request.material_vendor_id())
                )
                .build();
    }

    public static String buildMaterialID(String materialName){
        if (materialName.isEmpty()) {
            throw new IllegalArgumentException("Material name cannot be empty");
        }
        materialName = materialName.trim();
        String[] words = materialName.split("\\s+");
        String id;
        if (words.length == 1) {
            id =  words[0].substring(0, Math.min(words[0].length(), 2)).toUpperCase();
        }else{
            id = (words[0].substring(0, Math.min(words[0].length(), 1)).toUpperCase()+ words[1].substring(0, Math.min(words[1].length(), 1)).toUpperCase());
        }
        long timestamp = Instant.now().getEpochSecond();
        return id + timestamp;
    }

    public static TypeData toTypesList(MaterialType materialType){
        return new TypeData(materialType.getTypeId()
                ,materialType.getTypeName());
    }
}
