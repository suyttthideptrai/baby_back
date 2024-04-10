package com.backend.babysmile.service.vendor;


import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.request.vendor.UpdateVendorRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.Vendor;
//import com.backend.babysmile.model.entities.VendorMaterial;
//import com.backend.babysmile.repository.vendor.VendorMaterialRepository;
import com.backend.babysmile.model.entities.VendorMaterialType;
import com.backend.babysmile.repository.vendor.VendorRepository;
import com.backend.babysmile.service.material.MaterialMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import static com.backend.babysmile.service.vendor.VendorMapper.toVendor;

@Service
public class VendorService {
    @Autowired
    private VendorRepository repository;

//    @Autowired
//    private VendorMaterialType typeRepository;

    public ResponseEntity<MessageRespond> saveVendor(AddVendorRequest request){
        System.out.println(request);
        Vendor vendor = toVendor(request);
        System.out.println(vendor);
        repository.save(vendor);
        return ResponseEntity.status(200)
                .body(new
                        MessageRespond(false, "Successfully added vendor: " + request.vendor_name())
                );
    }

    public List<VendorListData> allVendors() {
        return repository.findAll()
                .stream()
                .map(VendorMapper::toVendorListData)
                .collect(Collectors.toList());
    }

    public List<Vendor> testVendor() {
        return  repository.findAll();
    }

    public List<VendorListData> findByName(String name) {
        List<Vendor> vendors = repository.findByVendorName(name);
        return vendors.stream()
                .map(VendorMapper::toVendorListData)
                .collect(Collectors.toList());
    }

    public List<VendorListData> findById(String id) {
        return repository.findById(id)
                .stream()
                .map(VendorMapper::toVendorListData)
                .collect(Collectors.toList());
    }

    public ResponseEntity<MessageRespond> updateVendor(UpdateVendorRequest updatedVendor) {
        Vendor existingVendor = repository.findById(updatedVendor.vendor_id()).orElse(null);
        if (existingVendor == null) {
            return ResponseEntity.status(200)
                    .body(new MessageRespond(true, "Vendor ID not found"));
        }
        existingVendor.setVendorName(updatedVendor.vendor_name());
        existingVendor.setVendorPhone(updatedVendor.vendor_phone());
        existingVendor.setVendorEmail(updatedVendor.vendor_email());
        existingVendor.setVendorAddress(updatedVendor.vendor_address());
        existingVendor.setVendorTaxCode(updatedVendor.vendor_tax_code());
        existingVendor.setVendorStatus(updatedVendor.vendor_status());
        repository.save(existingVendor);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(new MessageRespond(false, "Vendor with Id: " + updatedVendor.vendor_id() + " has been updated successfully"));
    }

    public ResponseEntity<MessageRespond> removeVendors(String[] vendorId) {
        try {
            Set<String> Ids = new HashSet<>(List.of(vendorId));
            repository.deleteAllById(Ids);
        }catch (Exception e){
            return ResponseEntity.status(500)
                    .body(new MessageRespond(true, "Delete failed"));
        }
        return ResponseEntity.status(200)
                .body(new MessageRespond(false, "Done deleting these items " + Arrays.toString(vendorId)));
    }

    public List<MaterialData> findMaterialsByVendorId(String vendorId){
        Optional<Vendor> vendor = repository.findById(vendorId);
        List<Material> materials;
        if(vendor.isPresent()){
            materials = vendor.get().getMaterials();
        }else{
            return null;
        }
        return materials
                .stream().map(MaterialMapper::toMaterialData)
                .collect(Collectors.toList());
    }
}
