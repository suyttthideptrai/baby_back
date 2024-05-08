package com.backend.babysmile.service.order;

import com.backend.babysmile.dto.request.order.NewOrderRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.order.OrderData;
import com.backend.babysmile.dto.respond.order.OrderListData;
import com.backend.babysmile.dto.respond.order.OrderMaterialData;
import com.backend.babysmile.model.entities.Order;
import com.backend.babysmile.model.entities.OrderMaterial;
import com.backend.babysmile.repository.material.MaterialRepository;
import com.backend.babysmile.repository.order.OrderMaterialRepository;
import com.backend.babysmile.repository.order.OrderRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
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


    @Transactional
    public ResponseEntity<MessageRespond> addOrder(NewOrderRequest request) {
        try {
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
            for (String orderId : orderIds) {
                orderRepository.deleteById(orderId);
            }
            return ResponseEntity.ok(new MessageRespond(false, "Orders deleted successfully"));
        } catch (Exception e) {
            System.err.println("Error occurred while deleting orders: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new MessageRespond(true, "Error occurred while deleting orders: " + e.getMessage()));
        }
    }

    public List<OrderListData> allOrders() {
        return orderRepository.findAll()
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
}