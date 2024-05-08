package com.backend.babysmile.controller;


import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.request.vendor.UpdateVendorRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialSuggestData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
//import com.backend.babysmile.model.entities.VendorMaterial;
import com.backend.babysmile.dto.respond.vendor.VendorQuerySuggestData;
import com.backend.babysmile.service.vendor.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/crud/vendor")
public class VendorController {
    @Autowired
    private VendorService service;

    @PostMapping("/add")
    public ResponseEntity<MessageRespond> addVendor(@RequestBody AddVendorRequest request){return service.saveVendor(request);}
    @PutMapping("/update")
    public ResponseEntity<MessageRespond> updateVendor(@RequestBody UpdateVendorRequest request){return service.updateVendor(request);}
    @GetMapping("/all")
    public List<VendorListData> allVendors(){
        return service.allVendors();
    }
    @GetMapping("/query/name/{vendor_name}")
    public List<VendorListData> findVendorsByName(@PathVariable("vendor_name") String name){return service.findByName(name);}
    @GetMapping("/query/id/{vendor_id}")
    public List<VendorListData> findVendorsById(@PathVariable("vendor_id") String id){
        return service.findById(id);
    }
    @PostMapping("/delete/bulk")
    public ResponseEntity<MessageRespond> removeVendors(@RequestBody String[] vendorIds){return service.removeVendors(vendorIds);}
    @GetMapping("/material/{vendor_id}")
    public List<MaterialSuggestData> findMaterialsById(@PathVariable("vendor_id") String id){return service.findMaterialsByVendorId(id);}
    @GetMapping("/query/{vendor_id}/{material_name}")
    public List<MaterialSuggestData> suggestVendorsMaterial(@PathVariable("vendor_id") String vendor_id, @PathVariable("material_name") String material_name){
        return service.suggestVendorMaterials(vendor_id, material_name);
    }
    @GetMapping("/query/suggest/name/{vendor_name}")
    public List<VendorQuerySuggestData> suggestVendorsByName(@PathVariable("vendor_name") String vendor_name){
        return service.querySuggestName(vendor_name);
    }
    @GetMapping("/query/suggest/id/{vendor_id}")
    public List<VendorQuerySuggestData> suggestVendorsByID(@PathVariable("vendor_id") String vendor_id){
        return service.querySuggestID(vendor_id);
    }

//    @GetMapping("/query/suggest//{vendor_id}")
//    public List<VendorQuerySuggestData> suggestVendorsByID(@PathVariable("vendor_id") String vendor_id){
//        return service.querySuggest(vendor_id, null);
//    }
}