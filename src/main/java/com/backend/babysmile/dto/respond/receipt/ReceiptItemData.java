package com.backend.babysmile.dto.respond.receipt;

public record ReceiptItemData(
    String material_id,
    String material_name,
    int material_quantity,
    String material_unit_of_measure,
     long material_price_per_unit
) {
}
