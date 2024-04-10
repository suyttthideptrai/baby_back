package com.backend.babysmile.dto.respond.material;


import java.util.Date;

public record MaterialData(
        String material_id,
        String material_name,
        Long material_price,
        Integer material_quantity,
        String material_unit_of_measure,
        Date material_warehouse_date,
        Integer material_type,
        String material_vendor_name
) {

}
