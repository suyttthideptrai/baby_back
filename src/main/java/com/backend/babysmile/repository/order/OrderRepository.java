package com.backend.babysmile.repository.order;

import com.backend.babysmile.model.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<Order, String> {
    @Query("SELECT SUM(o.orderTotalPrice) FROM Order o WHERE o.vendor.vendorId = :vendorId")
    Integer getOrderBudgetByVendorId(@Param("vendorId") String vendorId);
}
