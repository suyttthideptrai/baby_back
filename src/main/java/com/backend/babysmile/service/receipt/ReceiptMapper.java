package com.backend.babysmile.service.receipt;

import com.backend.babysmile.dto.respond.receipt.ReceiptData;
import com.backend.babysmile.dto.respond.receipt.ReceiptItemData;
import com.backend.babysmile.model.entities.Receipt;
import com.backend.babysmile.model.entities.ReceiptItem;

public class ReceiptMapper {
    public static ReceiptData toReceiptData(Receipt receipt){
        return new ReceiptData(
                receipt.getReceiptId(),
                receipt.getCreatedAt(),
                receipt.getOrder().getOrderIssuedDate(),
                receipt.getOrder().getOrderDeliveryDate(),
                receipt.getOrder().getOrderId(),
                receipt.getOrder().getOrderTitle(),
                receipt.getCreator().getUser_id(),
                receipt.getCreator().getUser_real_name(),
                receipt.getOrder().getVendor().getVendorId(),
                receipt.getReceiptItems().stream().map(ReceiptMapper::toReceiptItemData).toList()
        );
    }

    public static ReceiptItemData toReceiptItemData(ReceiptItem receiptItem){
        return new ReceiptItemData(
                receiptItem.getOrderMaterial().getMaterial().getMaterialId(),
                receiptItem.getOrderMaterial().getMaterial().getMaterialName(),
                receiptItem.getQuantity(),
                receiptItem.getOrderMaterial().getMaterial().getMaterialUnitOfMeasure(),
                receiptItem.getOrderMaterial().getOrderMaterialPricePerUnit()
        );
    }

//    public List<ReceiptItemData> getReceiptItems(List<ReceiptItem> receiptItems){
//            return receiptItems.stream().map(ReceiptMapper::toReceiptItemData).toList();
//    }
}
