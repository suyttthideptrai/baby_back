package com.backend.babysmile.dto.respond.order;

import com.backend.babysmile.model.enums.OrderStatus;
import lombok.Builder;

import java.util.Date;
import java.util.List;

@Builder
public record OrderData(
        String order_id,
        Date order_issued_date,
        Date order_approved_date,
        Date order_delivery_date,
        String order_title,
        Long order_total_price,
        int order_status,
        Long order_user_id,
        String order_user_name,
        String order_vendor_id,
        String order_vendor_name,
        List<OrderMaterialData> order_materials
) {
}
