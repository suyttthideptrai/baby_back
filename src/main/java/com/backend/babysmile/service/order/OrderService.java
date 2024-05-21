package com.backend.babysmile.service.order;

import com.backend.babysmile.dto.request.order.NewOrderRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.order.OrderData;
import com.backend.babysmile.dto.respond.order.OrderListData;
import com.backend.babysmile.dto.respond.order.OrderMaterialData;
import com.backend.babysmile.model.entities.Order;
import com.backend.babysmile.model.entities.OrderMaterial;
import com.backend.babysmile.model.entities.Vendor;
import com.backend.babysmile.model.enums.HiddenStatus;
import com.backend.babysmile.model.enums.VendorStatus;
import com.backend.babysmile.repository.material.MaterialRepository;
import com.backend.babysmile.repository.order.OrderMaterialRepository;
import com.backend.babysmile.repository.order.OrderRepository;
import com.backend.babysmile.repository.vendor.VendorRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static com.backend.babysmile.service.order.OrderMapper.mapToEmptyOrder;
import static com.backend.babysmile.service.order.OrderMapper.mapToOrderMaterial;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private MaterialRepository materialRepository;
    @Autowired
    private OrderMaterialRepository orderMaterialRepository;
    @Autowired
    private VendorRepository vendorRepository;

    @Transactional
    public ResponseEntity<MessageRespond> addOrder(NewOrderRequest request) {
        try {
            Vendor orderVendor = vendorRepository.findById(request.order_vendor_id()).orElse(null);
            if (orderVendor == null){
                    return ResponseEntity.badRequest().body(new MessageRespond(true, "Vendor with ID " + request.order_vendor_id() + " not found"));
            }
            orderVendor.setVendorStatus(VendorStatus.INORDER);
            vendorRepository.save(orderVendor);

            Order savedOrder = orderRepository.save(mapToEmptyOrder(request));
            long totalPrice = 0L;
            for (String materialId : request.order_materials_quantities().keySet()) {
                OrderMaterial orderMaterial = mapToOrderMaterial(
                        materialId,
                        request.order_materials_quantities().get(materialId));
                orderMaterial.setOrder(savedOrder);
                Long materialPrice = materialRepository.findMaterialPriceByMaterialId(materialId);
                totalPrice += materialPrice * request.order_materials_quantities().get(materialId);
                orderMaterial.setOrderMaterialPricePerUnit(materialPrice);
                orderMaterialRepository.save(orderMaterial);
            }
            savedOrder.setOrderTotalPrice(totalPrice);
            orderRepository.save(savedOrder);
            return ResponseEntity.ok(new MessageRespond(false, "Order added successfully"));
        } catch (Exception e) {
            System.err.println("Error occurred while adding order: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageRespond(true, "Error occurred while adding order: " + e.getMessage()));
        }
    }
    public ResponseEntity<MessageRespond> deleteOrders(String[] orderIds) {
        try {
            Set<String> ids = new HashSet<>(List.of(orderIds));
            orderRepository.hideAllById(ids);
            return ResponseEntity.ok(new MessageRespond(false, "Orders deleted successfully"));
        } catch (Exception e) {
            System.err.println("Error occurred while deleting orders: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageRespond(true, "Error occurred while deleting orders: " + e.getMessage()));
        }
    }

    public List<OrderListData> allOrders() {
        Sort sort = Sort.by(Sort.Direction.DESC, "orderIssuedDate");
        return orderRepository.findAllByHiddenStatus(HiddenStatus.FALSE, sort)
                .stream().map(OrderMapper::mapToOrderListData)
                .collect(Collectors.toList())
                ;
    }

    public ResponseEntity<OrderData> findOrderById(String orderId) {
        OrderData orderData = orderRepository.findById(orderId)
                .map(OrderMapper::mapToOrderData)
                .orElse(null);
        if (orderData == null) {
            return ResponseEntity.notFound().build();
        }else{
            List<OrderMaterialData> orderMaterials = findOrderMaterialsByOrderId(orderId);
            if(!orderMaterials.isEmpty()) {
                orderData.order_materials().addAll(orderMaterials);
            }
            return ResponseEntity.ok(orderData);
        }
    }

    public List<OrderMaterialData> findOrderMaterialsByOrderId(String orderId) {
        return orderMaterialRepository.findAllAscendingSortedById(orderId)
                .stream().map(OrderMapper::toOrderMaterialData)
                .collect(Collectors.toList());
    }

    public Integer getOrderBudgetByVendorId(String vendorId) {
        return orderRepository.getOrderBudgetByVendorId(vendorId);
    }
}