package com.backend.babysmile.dto.request.vendor;

import com.backend.babysmile.model.enums.VendorStatus;

public record AddVendorRequest(
        String vendor_id,
        String vendor_name,
        String vendor_phone,
        String vendor_email,
        String vendor_address,
        String vendor_tax_code
//        ,VendorStatus vendor_status
) {
}
