package com.backend.babysmile.service.vendor;


import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.request.vendor.UpdateVendorRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.material.MaterialSuggestData;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.dto.respond.vendor.VendorQuerySuggestData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.enums.VendorStatus;
import com.backend.babysmile.repository.material.MaterialRepository;
import com.backend.babysmile.repository.order.OrderRepository;
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
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private OrderRepository orderRepository;

    public ResponseEntity<MessageRespond> saveVendor(AddVendorRequest request){
        try {
            Vendor vendor = toVendor(request);
            repository.save(vendor);
            return ResponseEntity.status(200)
                    .body(new
                            MessageRespond(false, "Successfully added vendor: " + request.vendor_name())
                    );
        }catch (Exception e){
            return ResponseEntity.status(200)
                    .body(new
                            MessageRespond(true, "Failed to add vendor: " + request.vendor_name() + " Please try again!")
                    );
        }
    }

    public List<VendorListData> allVendors() {
        return repository.findAll()
                .stream()
                .map(vendor -> {
                    Integer orderBudget = orderRepository.getOrderBudgetByVendorId(vendor.getVendorId());
                    return VendorMapper.toVendorListData(vendor, orderBudget != null ? orderBudget : 0);
                })
                .collect(Collectors.toList());
    }

    public List<VendorListData> findByName(String name) {
        List<Vendor> vendors = repository.findByVendorName(name);
        return vendors.stream()
                .map(vendor -> {
                    Integer orderBudget = orderRepository.getOrderBudgetByVendorId(vendor.getVendorId());
                    return VendorMapper.toVendorListData(vendor, orderBudget != null ? orderBudget : 0);
                })
                .collect(Collectors.toList());
    }

//    public List<VendorListData> findById(String id) {
//        return repository.findById(id)
//                .stream()
//                .map(VendorMapper::toVendorListData)
//                .collect(Collectors.toList());
//    }

    public List<VendorListData> findById(String id) {
        return repository.findById(id)
                .stream()
                .map(vendor -> {
                    Integer orderBudget = orderRepository.getOrderBudgetByVendorId(vendor.getVendorId());
                    return VendorMapper.toVendorListData(vendor, orderBudget != null ? orderBudget : 0);
                })
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
        existingVendor.setVendorStatus(VendorStatus.values()[updatedVendor.vendor_status()]);
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

    public List<MaterialSuggestData> findMaterialsByVendorId(String vendorId){
        Optional<Vendor> vendor = repository.findById(vendorId);
        List<Material> materials;
        if(vendor.isPresent()){
            materials = vendor.get().getMaterials();
        }else{
            return null;
        }
        return materials
                .stream().map(MaterialMapper::toMaterialVendorSuggestData)
                .collect(Collectors.toList());
    }

    public List<VendorQuerySuggestData> querySuggestName(String vendorName){
        List<Vendor> vendors = repository.findByVendorName(vendorName);
        return vendors.stream()
                .map(VendorMapper::toVendorQuerySuggestData)
                .collect(Collectors.toList());
    }

    public List<VendorQuerySuggestData> querySuggestID(String vendorId){
        List<Vendor> vendors = repository.findByIdLike(vendorId);
        return vendors.stream()
                .map(VendorMapper::toVendorQuerySuggestData)
                .collect(Collectors.toList());
    }

    public List<MaterialSuggestData> suggestVendorMaterials(String vendorId, String materialName) {
        return materialRepository.findByVendorIdAndMaterialNameLike(vendorId, materialName)
                .stream()
                .map(MaterialMapper::toMaterialVendorSuggestData)
                .collect(Collectors.toList());
    }
}
