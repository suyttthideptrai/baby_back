package com.backend.babysmile.service.order;

import com.backend.babysmile.dto.request.order.NewOrderRequest;
import com.backend.babysmile.dto.respond.order.OrderData;
import com.backend.babysmile.dto.respond.order.OrderListData;
import com.backend.babysmile.dto.respond.order.OrderMaterialData;
import com.backend.babysmile.model.entities.*;
import com.backend.babysmile.model.enums.HiddenStatus;
import com.backend.babysmile.model.enums.OrderStatus;
import com.backend.babysmile.model.enums.OrderMaterialStatus;

import java.util.ArrayList;
import java.util.Date;

public class OrderMapper {

        public static OrderListData mapToOrderListData(Order order) {
            return new OrderListData(
                    order.getOrderId(),
                    order.getOrderTitle(),
                    order.getOrderIssuedDate(),
                    order.getOrderDeliveryDate(),
                    order.getOrderTotalPrice(),
                    order.getOrderStatus().ordinal(),
                    order.getVendor().getVendorId(),
                    order.getUser().getUsername(),
                    order.getUser().getUser_id()
            );
        }
          public static Order mapToEmptyOrder(NewOrderRequest request) {
              Order emptyOrder = new Order();
              emptyOrder.setOrderIssuedDate(new Date());
              emptyOrder.setOrderDeliveryDate(request.order_delivery_date());
              emptyOrder.setOrderStatus(OrderStatus.UNPROCESSED);
              emptyOrder.setOrderTitle(request.order_title());
              emptyOrder.setUser(new User(request.order_creator_id()));
              emptyOrder.setVendor(new Vendor(request.order_vendor_id()));
              emptyOrder.setHiddenStatus(HiddenStatus.FALSE);
              return emptyOrder;
          }

          public static OrderMaterial mapToOrderMaterial(String materialId, Integer quantity) {
              OrderMaterial orderMaterial = new OrderMaterial();
              orderMaterial.setMaterial(new Material(materialId));
              orderMaterial.setOrderMaterialQuantity(quantity);
              orderMaterial.setOrderMaterialStatus(OrderMaterialStatus.NOT_DELIVERED);
              return orderMaterial;
          }

          public static OrderData mapToOrderData(Order order){
              return OrderData.builder()
                      .order_id(order.getOrderId())
                      .order_issued_date(order.getOrderIssuedDate())
                      .order_approved_date(order.getOrderApprovedDate())
                      .order_delivery_date(order.getOrderDeliveryDate())
                      .order_title(order.getOrderTitle())
                      .order_total_price(order.getOrderTotalPrice())
                      .order_status(order.getOrderStatus().ordinal())
                      .order_user_id(order.getUser().getUser_id())
                      .order_user_name(order.getUser().getUsername())
                      .order_vendor_id(order.getVendor().getVendorId())
                      .order_vendor_name(order.getVendor().getVendorName())
                      .order_materials(new ArrayList<>())
                      .build();
          }

          public static OrderMaterialData toOrderMaterialData(OrderMaterial orderMaterial){
              return OrderMaterialData.builder()
                      .material_id(orderMaterial.getMaterial().getMaterialId())
                      .material_name(orderMaterial.getMaterial().getMaterialName())
                      .material_unit_of_measure(orderMaterial.getMaterial().getMaterialUnitOfMeasure())
                      .material_actual_quantity(orderMaterial.getOrderMaterialActualQuantity())
                      .material_quantity(orderMaterial.getOrderMaterialQuantity())
                      .material_price_per_unit(orderMaterial.getOrderMaterialPricePerUnit())
                      .material_status(orderMaterial.getOrderMaterialStatus().ordinal())
                      .build();
          }

}
