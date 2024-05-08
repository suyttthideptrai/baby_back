package com.backend.babysmile.dto.respond.order;

import com.backend.babysmile.model.enums.OrderStatus;

import java.util.Date;

public record OrderListData(
          String order_id,
          String order_title,
          Date order_date,
          Date order_due_date,
          Long order_total_price,
          int order_status,
          String order_vendor_id,
          String order_user_name,
          Long order_user_id
) {
}
