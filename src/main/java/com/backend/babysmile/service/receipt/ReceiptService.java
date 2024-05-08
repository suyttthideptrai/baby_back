package com.backend.babysmile.service.receipt;


import com.backend.babysmile.dto.request.receipt.NewReceiptRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.receipt.ReceiptData;
import com.backend.babysmile.model.entities.*;
import com.backend.babysmile.model.enums.OrderMaterialStatus;
import com.backend.babysmile.repository.material.MaterialRepository;
import com.backend.babysmile.repository.order.OrderMaterialRepository;
import com.backend.babysmile.repository.order.OrderRepository;
import com.backend.babysmile.repository.receipt.ReceiptItemRepository;
import com.backend.babysmile.repository.receipt.ReceiptRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.backend.babysmile.utils.LocalTime.getCurrentDate;

@Service
public class ReceiptService {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderMaterialRepository orderMaterialRepository;
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private ReceiptRepository receiptRepository;
    @Autowired
    private ReceiptItemRepository receiptItemRepository;

    @Transactional
    public ResponseEntity<MessageRespond> create(NewReceiptRequest request){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(authentication.getPrincipal());
        User user = (User) authentication.getPrincipal();
        System.out.println(user);

        Order existingOrder = orderRepository.findById(request.order_id()).orElse(null);
        if(existingOrder == null){
            return ResponseEntity.badRequest().body(new MessageRespond(true, "Order with ID " + request.order_id() + " not found"));
        }
        Receipt receipt = new Receipt();
        receipt.setOrder(existingOrder);
        receipt.setCreator(user);
        receipt.setCreatedAt(getCurrentDate());
        receiptRepository.save(receipt);


        for (String materialId : request.material_quantities().keySet()) {
            OrderMaterial orderMaterial = orderMaterialRepository.findByOrderAndMaterialId(existingOrder, materialId).orElse(null);
            if(request.material_quantities().get(materialId) < 0){
                    return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " quantity tampered"));
            }
            if(orderMaterial == null){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " not found in order"));
            }

            int totalQuantity = orderMaterial.getOrderMaterialQuantity();
            int additionalQuantity = request.material_quantities().get(materialId);
            int existingQuantity = orderMaterial.getOrderMaterialActualQuantity();
            int newQuantity = additionalQuantity + existingQuantity;
            orderMaterial.setOrderMaterialActualQuantity(newQuantity);

            if(newQuantity > totalQuantity){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " exceeds the quantity in order"));
            }else if(newQuantity < 0){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " quantity cannot be negative"));
            }else if(newQuantity == totalQuantity){
                orderMaterial.setOrderMaterialStatus(OrderMaterialStatus.DELIVERED);
            }else{
                orderMaterial.setOrderMaterialStatus(OrderMaterialStatus.PARTIALLY_DELIVERED);
            }

            receiptItemRepository.save(ReceiptItem.builder()
                    .orderMaterial(orderMaterial)
                    .receipt(receipt)
                    .quantity(additionalQuantity)
                    .build()
            );

            Material material = materialRepository.findByMaterialId(materialId).orElse(null);
            if(material == null) {
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " not found"));
            }
            int materialStockQuantity = material.getMaterialQuantity();
            if(materialStockQuantity < 0){
                material.setMaterialQuantity(additionalQuantity);
                materialRepository.save(material);
            }else{
                material.setMaterialQuantity(materialStockQuantity + additionalQuantity);
                materialRepository.save(material);
            }
        }
        return ResponseEntity.ok(new MessageRespond(false, "Receipt created successfully "));
    }

    public List<ReceiptData> allReceipts(){
        return receiptRepository.findAll().stream().map(ReceiptMapper::toReceiptData).collect(Collectors.toList());
    }

    public ResponseEntity<MessageRespond> removeReceipt(String[] receiptIds){
            for (String receiptId : receiptIds) {
               Receipt existingReceipt = receiptRepository.findById(receiptId).orElse(null);
               if(existingReceipt == null){
                     return ResponseEntity.badRequest().body(new MessageRespond(true, "Receipt with ID " + receiptId + " not found"));
               }
               receiptRepository.delete(existingReceipt);
            }
        return ResponseEntity.ok(new MessageRespond(false, "Receipts removed successfully"));
    }

    public List<ReceiptData> findReceiptsByOrderName(String query){
        return receiptRepository.findByOrderTitle(query).stream().map(ReceiptMapper::toReceiptData).collect(Collectors.toList());
    }
}
