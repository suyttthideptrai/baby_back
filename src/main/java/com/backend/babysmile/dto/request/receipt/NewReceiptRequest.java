package com.backend.babysmile.dto.request.receipt;

import java.util.Map;

public record NewReceiptRequest(
        String order_id,
        Map<String, Integer> material_quantities
) {
}
