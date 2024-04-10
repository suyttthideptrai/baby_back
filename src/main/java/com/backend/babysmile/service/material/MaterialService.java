package com.backend.babysmile.service.material;

import com.backend.babysmile.dto.request.material.AddMaterialRequest;
import com.backend.babysmile.dto.request.material.MaterialUpdateRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.entities.VendorMaterialType;
import com.backend.babysmile.repository.material.MaterialRepository;
//import com.backend.babysmile.repository.vendor.VendorMaterialRepository;
//import com.backend.babysmile.service.vendor.VendorMapper;
import com.backend.babysmile.repository.material.MaterialTypeRepository;
import com.backend.babysmile.repository.vendor.VendorTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import static com.backend.babysmile.service.material.MaterialMapper.*;

@Service
public class MaterialService {
    @Autowired
    private MaterialRepository materialRepository;

    @Autowired
    private VendorTypeRepository vendorMaterialTypeRepository;

//    @Autowired
//    private VendorMaterialRepository vendorMaterialRepository;
    public ResponseEntity<MessageRespond> updateMaterial(MaterialUpdateRequest updatedMaterial) {
        Material existingMaterial = materialRepository.findById(updatedMaterial.material_id()).orElse(null);

        if (existingMaterial == null) {
            return ResponseEntity.status(200)
                    .body(new MessageRespond(true, "Material ID not found"));
        }
        existingMaterial.setMaterialName(updatedMaterial.material_name());
//        existingMaterial.setMaterialQuantity(updatedMaterial.material_quantity());
        existingMaterial.setMaterialUnitOfMeasure(updatedMaterial.material_unit_of_measure());
        existingMaterial.setMaterialType(new MaterialType(updatedMaterial.material_type()));
        existingMaterial.setMaterialWarehouseDate(updatedMaterial.material_warehouse_date());
        materialRepository.save(existingMaterial);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(new MessageRespond(false, "Material updated successfully"));
    }

    public ResponseEntity<MessageRespond> addMaterial(AddMaterialRequest request){
        //Check for existing material ID
        if(materialRepository.findByMaterialId(request.material_id()).isEmpty()){
            //Check for existing relationship
            Vendor vendor = new Vendor(request.material_vendor_id());
            MaterialType materialType = new MaterialType(request.material_type_id());
            if(vendorMaterialTypeRepository
                    .findExistingVendorMaterialType(vendor, materialType).isEmpty()){
                vendorMaterialTypeRepository.save(VendorMaterialType.builder().materialType(materialType).vendor(vendor).build());
            }
            materialRepository.save(mapAddRequestToMaterial(request));
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new MessageRespond(false
                            , "Successfully added Material: " + request.material_name() + " for Vendor ID: " + request.material_vendor_id()));
        }else{
            return ResponseEntity.status(HttpStatus.OK)
                    .body(new MessageRespond(true
                            , "Cannot add new material, material with ID " + request.material_id() + " already exists!"));
        }
    }

    public ResponseEntity<MessageRespond> deleteMaterials(String[] selectedIds) {
        try {
            Set<String> Ids = new HashSet<>(List.of(selectedIds));
            materialRepository.deleteAllById(Ids);
        }catch (Exception e){
            return ResponseEntity.status(500)
                    .body(new MessageRespond(true, "Delete failed"));
        }
        return ResponseEntity.status(200)
                .body(new MessageRespond(false, "Done deleting these items " + Arrays.toString(selectedIds)));
    }

    public List<MaterialData> findAllMaterials() {
        return materialRepository
                .findAll()
                .stream()
                .map(MaterialMapper::toMaterialData)
                .collect(Collectors.toList());
    }

    public Optional<Material> findByMaterialId(String id) {
        return materialRepository.findById(id);
    }

//    public ResponseEntity<MessageRespond> deleteById(String id) {
//        try{
//            materialRepository.deleteById(id);
//        }catch (Exception e){
//            return ResponseEntity.status(200).body(new MessageRespond(true, "Error deleting item with ID: " + id + " " + e.getMessage()));
//        }
//        return  ResponseEntity.status(200).body(new MessageRespond(false, "Delete item success!"));
//    }

    public List<MaterialData> findAllByMaterialNameLike(String name) {
        return materialRepository.findAllByMaterialNameLike(name)
                .stream()
                .map(MaterialMapper::toMaterialData)
                .collect(Collectors.toList());
    }

//    public List<VendorListData> getVendorsByMaterialId(String materialId) {
//        return vendorMaterialRepository
//                .getVendorsByMaterialId(Material
//                        .builder()
//                        .materialId(materialId)
//                        .build())
//                .stream()
//                .map(VendorMapper::toVendorListDataFromVendorMaterial)
//                .collect(Collectors.toList());
//    }

    public List<MaterialData> findSuggestsById(String id) {
        return materialRepository.findSuggestionById(id)
                .stream()
                .map(MaterialMapper::toMaterialData)
                .collect(Collectors.toList());
    }
}

