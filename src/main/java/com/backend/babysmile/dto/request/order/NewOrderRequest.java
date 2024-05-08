package com.backend.babysmile.dto.request.order;

import java.util.Date;
import java.util.Map;

public record NewOrderRequest(
        String order_title,
        Long order_creator_id,
        Date order_delivery_date,
        String order_vendor_id,
        Map<String, Integer> order_materials_quantities
) {

}
