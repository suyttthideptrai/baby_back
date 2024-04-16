package com.backend.babysmile.controller;


import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.request.vendor.UpdateVendorRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
//import com.backend.babysmile.model.entities.VendorMaterial;
import com.backend.babysmile.model.entities.Vendor;
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
//    @GetMapping("/all")
//    public List<VendorListData> allVendors(){
//        return service.allVendors();
//    }
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
    public List<MaterialData> findMaterialsById(@PathVariable("vendor_id") String id){return service.findMaterialsByVendorId(id);}
}