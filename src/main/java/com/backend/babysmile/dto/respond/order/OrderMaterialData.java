package com.backend.babysmile.dto.respond.order;

import com.backend.babysmile.model.enums.OrderMaterialStatus;
import lombok.Builder;

@Builder
public record OrderMaterialData(
        String material_id,
        String material_name,
        String material_unit_of_measure,
        int material_actual_quantity,
        int material_quantity,
        Long material_price_per_unit,
        int material_status
) {

}
