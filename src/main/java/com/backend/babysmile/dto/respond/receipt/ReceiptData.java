package com.backend.babysmile.dto.respond.receipt;


import java.util.Date;
import java.util.List;

public record ReceiptData(
        String receipt_id,
        Date receipt_create_date,
        Date receipt_order_created_date,
        Date receipt_order_due_date,
        String receipt_order_id,
        String receipt_order_title,
        long receipt_creator_id,
        String receipt_creator_name,
        String receipt_vendor_id,
        List<ReceiptItemData> receipt_items
) {
}
