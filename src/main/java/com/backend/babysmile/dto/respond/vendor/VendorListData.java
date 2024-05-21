package com.backend.babysmile.dto.respond.vendor;

import com.backend.babysmile.model.enums.VendorStatus;

import java.util.List;

public record VendorListData(
        String vendor_id,
        String vendor_name,
        String vendor_phone,
        String vendor_email,
        String vendor_address,
        String vendor_tax_code,
        int vendor_status,
        Integer vendor_order_budget,
        List<String> vendor_supplied_types
) {
}
