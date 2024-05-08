package com.backend.babysmile.dto.respond.material;

public record MaterialSuggestData(
          String entity_id,
          String entity_name,
          String entity_unit_of_measure,
          int entity_quantity,
          long entity_price,
          int entity_type,
          String entity_vendor_id,
          String entity_vendor_name
) {
}
