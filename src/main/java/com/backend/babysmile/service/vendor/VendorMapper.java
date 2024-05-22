package com.backend.babysmile.service.vendor;

import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.dto.respond.vendor.VendorQuerySuggestData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.enums.HiddenStatus;
import com.backend.babysmile.model.enums.VendorStatus;

import java.time.Instant;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
//import com.backend.babysmile.model.entities.VendorMaterial;

public class VendorMapper {
//    public static String buildMaterialID(String materialName){
//        if (materialName.isEmpty()) {
//            throw new IllegalArgumentException("Material name cannot be empty");
//        }
//        materialName = materialName.trim();
//        String[] words = materialName.split("\\s+");
//        String id;
//        if (words.length == 1) {
//            id =  words[0].substring(0, Math.min(words[0].length(), 2)).toUpperCase();
//        }else{
//            id = (words[0].substring(0, Math.min(words[0].length(), 1)).toUpperCase()+ words[1].substring(0, Math.min(words[1].length(), 1)).toUpperCase());
//        }
//        long timestamp = Instant.now().getEpochSecond();
//        return id + timestamp;
//    }
    public static Vendor toVendor(AddVendorRequest data){
        //String generatedId = buildMaterialID(data.vendor_name());
       return Vendor.builder()
               //.vendorId(generatedId)
               .vendorName(data.vendor_name())
               .vendorPhone(data.vendor_phone())
               .vendorEmail(data.vendor_email())
               .vendorAddress(data.vendor_address())
               .vendorTaxCode(data.vendor_tax_code())
               .vendorStatus(VendorStatus.INACTIVE)
               .vendorOrderBudget(0)
               .hiddenStatus(HiddenStatus.FALSE)
               .build();
    }

    public static VendorListData toVendorListData(Vendor vendor, int orderBudget) {
        List<String> suppliedTypes = vendor.getVendorMaterialTypes()
                .stream()
                .map(vendorMaterialType -> vendorMaterialType.getMaterialType().getTypeName())
                .collect(Collectors.toList());
        return new VendorListData(
                vendor.getVendorId(),
                vendor.getVendorName(),
                vendor.getVendorPhone(),
                vendor.getVendorEmail(),
                vendor.getVendorAddress(),
                vendor.getVendorTaxCode(),
                vendor.getVendorStatus().ordinal(),
                orderBudget,
                suppliedTypes
        );
    }

    public static VendorQuerySuggestData toVendorQuerySuggestData(Vendor vendor) {
        return new VendorQuerySuggestData(
                        vendor.getVendorId(),
                        vendor.getVendorName()
        );
    }
}
