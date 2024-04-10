package com.backend.babysmile.controller;

import com.backend.babysmile.dto.request.material.AddMaterialRequest;
import com.backend.babysmile.dto.request.material.BulkDeleteRequest;
import com.backend.babysmile.dto.request.material.MaterialUpdateRequest;
import com.backend.babysmile.dto.request.material.NewMaterialType;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.material.TypeData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.service.material.MaterialService;
import com.backend.babysmile.service.material.MaterialTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/crud/material")
public class MaterialController {

    @Autowired
    private MaterialTypeService materialTypeService;

    @Autowired
    private MaterialService materialService;

    public MaterialController(MaterialService materialService) {
        this.materialService = materialService;
    }

    @PostMapping("/add")
    public ResponseEntity<MessageRespond> saveMaterial(
            @RequestBody AddMaterialRequest request
            ){
        System.out.println(request);
        return materialService.addMaterial(request);
    }
    /*
     * FIND/SUGGEST MATERIAL
     */
    @GetMapping("/all")
    public List<MaterialData> findAllMaterial(){
        return materialService.findAllMaterials();
    }

    @GetMapping("/query/id/{material_id}")
    public Material findMaterialById(
            @PathVariable("material_id") String id
    ){
        return materialService.findByMaterialId(id)
                .orElse(null);
    }

    @GetMapping("/query/suggest/id/{material_id}")
    public List<MaterialData> suggestMaterialById(
            @PathVariable("material_id") String id
    ){
        return materialService.findSuggestsById(id);
    }

    @GetMapping("/query/name/{material_name}")
    public List<MaterialData> findMaterialByName(
            @PathVariable("material_name") String id
    ){
        return materialService.findAllByMaterialNameLike(id);
    }

    @PutMapping("/update")
    public ResponseEntity<MessageRespond> updateMaterial(@RequestBody MaterialUpdateRequest material) {
        return materialService.updateMaterial(material);
    }

//    @DeleteMapping("/delete/{material_id}")
//    public ResponseEntity<MessageRespond> delete(
//            @PathVariable("material_id") String id
//    ){
//        return materialService.deleteById(id);
//    }

    @PostMapping("/delete/bulk")
    public ResponseEntity<MessageRespond> bulkDelete(
            @RequestBody BulkDeleteRequest request
            ){
        return materialService.deleteMaterials(request.selected_ids());
    }
    /*
     * MATERIAL TYPE
     */
    @PostMapping("/type/add")
    public MaterialType addMaterialType(@RequestBody NewMaterialType request) {
        return materialTypeService.addMaterialType(request.material_type_name());
    }

    @GetMapping("/type/all")
    public List<TypeData> getAllMaterialTypes() {
        return materialTypeService.findAll();
    }

    @DeleteMapping("/type/delete/{typeId}")
    public void deleteMaterialType(@PathVariable int typeId) {
        materialTypeService.deleteMaterialType(typeId);
    }
    /*
     * VENDOR_MATERIALS
     */
}
