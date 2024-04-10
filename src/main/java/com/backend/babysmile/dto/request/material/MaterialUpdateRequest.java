package com.backend.babysmile.dto.request.material;

import java.util.Date;

public record MaterialUpdateRequest(
        String material_id,
        String material_name,
        Integer material_quantity,
        String material_unit_of_measure,
        Date material_warehouse_date,
        Integer material_type
) {
}
