package com.backend.babysmile.dto.request.material;

import java.util.Date;

public record AddMaterialRequest(
        String material_id,
        String material_name,
        Long material_price,
        String material_unit_of_measure,
        Date material_warehouse_date,
        Integer material_type_id,
        String material_vendor_id
) {
}
