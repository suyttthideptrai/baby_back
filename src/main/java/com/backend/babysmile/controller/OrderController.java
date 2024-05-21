package com.backend.babysmile.controller;

import com.backend.babysmile.dto.request.order.DeleteOrdersRequest;
import com.backend.babysmile.dto.request.order.NewOrderRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.order.OrderData;
import com.backend.babysmile.dto.respond.order.OrderListData;
import com.backend.babysmile.model.entities.Order;
import com.backend.babysmile.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/crud/order")
public class OrderController {

    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

  @GetMapping("/all")
  public List<OrderListData> allOrders() {
      return orderService.allOrders();
  }


@GetMapping("/id/{order_id}")
public ResponseEntity<OrderData> findOrderById(@PathVariable("order_id") String orderId) {
    return orderService.findOrderById(orderId);
}
    @PostMapping("/add")
    public ResponseEntity<MessageRespond> addOrder(@RequestBody NewOrderRequest request) {
        return orderService.addOrder(request);
    }

    @PostMapping("/delete")
    public ResponseEntity<MessageRespond> deleteOrders(@RequestBody String[] orderIds) {
        return orderService.deleteOrders(orderIds);
    }

    @GetMapping("/order_budget/{vendor_id}")
     public int findOrdersByVendorId(@PathVariable("vendor_id") String vendorId) {
          return orderService.getOrderBudgetByVendorId(vendorId);
     }
}