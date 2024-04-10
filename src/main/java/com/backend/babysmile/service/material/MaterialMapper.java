package com.backend.babysmile.service.material;

import com.backend.babysmile.dto.request.material.AddMaterialRequest;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.material.TypeData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.model.entities.Vendor;
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
        return Material.builder()
                .materialId(request.material_id())
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

    public static TypeData toTypesList(MaterialType materialType){
        return new TypeData(materialType.getTypeId()
                ,materialType.getTypeName());
    }
}
