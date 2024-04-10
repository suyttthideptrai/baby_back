package com.backend.babysmile.service.vendor;

import com.backend.babysmile.dto.request.vendor.AddVendorRequest;
import com.backend.babysmile.dto.respond.vendor.VendorListData;
import com.backend.babysmile.model.entities.Material;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.enums.VendorStatus;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
//import com.backend.babysmile.model.entities.VendorMaterial;

public class VendorMapper {
    public static Vendor toVendor(AddVendorRequest data){
       return Vendor.builder()
               .vendorId(data.vendor_id())
               .vendorName(data.vendor_name())
               .vendorPhone(data.vendor_phone())
               .vendorEmail(data.vendor_email())
               .vendorAddress(data.vendor_address())
               .vendorTaxCode(data.vendor_tax_code())
               .vendorStatus(VendorStatus.INACTIVE)
               .vendorOrderBudget(0)
               .build();
    }

    public static VendorListData toVendorListData(Vendor vendor) {
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
                vendor.getVendorStatus(),
                vendor.getVendorOrderBudget(),
                suppliedTypes
        );
    }
}
