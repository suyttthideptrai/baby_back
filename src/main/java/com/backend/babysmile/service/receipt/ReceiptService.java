package com.backend.babysmile.service.receipt;


import com.backend.babysmile.dto.request.receipt.NewReceiptRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.receipt.ReceiptData;
import com.backend.babysmile.model.entities.*;
import com.backend.babysmile.model.enums.HiddenStatus;
import com.backend.babysmile.model.enums.OrderMaterialStatus;
import com.backend.babysmile.model.enums.OrderStatus;
import com.backend.babysmile.repository.material.MaterialRepository;
import com.backend.babysmile.repository.order.OrderMaterialRepository;
import com.backend.babysmile.repository.order.OrderRepository;
import com.backend.babysmile.repository.receipt.ReceiptItemRepository;
import com.backend.babysmile.repository.receipt.ReceiptRepository;
import com.backend.babysmile.repository.vendor.VendorRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
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
        receipt.setHiddenStatus(HiddenStatus.FALSE);
        receiptRepository.save(receipt);

        OrderStatus orderStatus = existingOrder.getOrderStatus();
        if(orderStatus == OrderStatus.CANCELLED) {
            return ResponseEntity.ok(new MessageRespond(true, "Order with ID " + request.order_id() + " is cancelled"));
        }else if(orderStatus == OrderStatus.COMPLETED){
            return ResponseEntity.ok(new MessageRespond(true, "Order with ID " + request.order_id() + " is already completed"));
        }else{
            existingOrder.setOrderStatus(OrderStatus.PROCESSING);
        }

        int orderTotalQuantity = 0;
        int orderTotalActualQuantity = 0;

        for (String materialId : request.material_quantities().keySet()) {
            OrderMaterial orderMaterial = orderMaterialRepository.findByOrderAndMaterialId(existingOrder, materialId).orElse(null);
            if(request.material_quantities().get(materialId) < 0){
                    return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " quantity tampered"));
            }
            if(orderMaterial == null){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " not found in order"));
            }

            int additionalQuantity = request.material_quantities().get(materialId);

            if(additionalQuantity == 0){
                continue;
            }

            int totalQuantity = orderMaterial.getOrderMaterialQuantity();
            int existingQuantity = orderMaterial.getOrderMaterialActualQuantity();
            int newQuantity = additionalQuantity + existingQuantity;
            orderMaterial.setOrderMaterialActualQuantity(newQuantity);



            orderTotalQuantity += totalQuantity;
            orderTotalActualQuantity += newQuantity;

            if(newQuantity > totalQuantity){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " exceeds the quantity in order"));
            }else if(newQuantity < 0){
                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " quantity cannot be negative"));
            }else if(newQuantity == totalQuantity){
                orderMaterial.setOrderMaterialStatus(OrderMaterialStatus.DELIVERED);
            }else{
                orderMaterial.setOrderMaterialStatus(OrderMaterialStatus.PARTIALLY_DELIVERED);
            }


//            ReceiptItem rc = ReceiptItem.builder().orderMaterial(orderMaterial).build();
//            if(receiptItemRepository.(orderMaterial).isPresent()){
//                return ResponseEntity.ok(new MessageRespond(true, "Material with ID " + materialId + " already added to receipt"));
//            }

            receiptItemRepository.save(ReceiptItem.builder()
                    .orderMaterial(orderMaterial)
                    .receipt(receipt)
                    .quantity(additionalQuantity)
                    .build()
            );

//            if(orderTotalActualQuantity == orderTotalQuantity) {
//                existingOrder.setOrderStatus(OrderStatus.);
//            }

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

        if(orderTotalActualQuantity == orderTotalQuantity) {
           existingOrder.setOrderStatus(OrderStatus.COMPLETED);
        }
        orderRepository.save(existingOrder);

        return ResponseEntity.ok(new MessageRespond(false, "Receipt created successfully "));
    }

//    public List<ReceiptData> allReceipts(){
//        Sort sort = Sort.by(Sort.Direction.DESC, "createdAt");
//        return receiptRepository.findAll(sort).stream().map(ReceiptMapper::toReceiptData).collect(Collectors.toList());
//    }

    public List<ReceiptData> allReceipts() {
        Sort sort = Sort.by(Sort.Direction.DESC, "createdAt");
        return receiptRepository
                .findAllByHiddenStatus(HiddenStatus.FALSE, sort)
                .stream()
                .map(ReceiptMapper::toReceiptData)
                .collect(Collectors.toList());
    }
    public ResponseEntity<MessageRespond> removeReceipt(String[] receiptIds){
        Set<String> receiptIdSet = Set.of(receiptIds);
        receiptRepository.hideReceiptByIds(receiptIdSet);
        return ResponseEntity.ok(new MessageRespond(false, "Receipts removed successfully"));
    }

    public List<ReceiptData> findReceiptsByOrderName(String query){
        return receiptRepository.findByOrderTitle(query).stream().map(ReceiptMapper::toReceiptData).collect(Collectors.toList());
    }

    public ReceiptData getReceiptDetails(String id) {
        Receipt rc =  receiptRepository.findById(id).orElse(null);
        if(rc == null){
            return null;
        }else{
            return ReceiptMapper.toReceiptData(rc);
        }
    }
}
