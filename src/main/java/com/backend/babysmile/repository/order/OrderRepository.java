package com.backend.babysmile.repository.order;

import com.backend.babysmile.model.entities.Order;
import com.backend.babysmile.model.enums.HiddenStatus;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface OrderRepository extends JpaRepository<Order, String> {
    @Query("SELECT SUM(o.orderTotalPrice) FROM Order o WHERE o.vendor.vendorId = :vendorId")
    Integer getOrderBudgetByVendorId(@Param("vendorId") String vendorId);

    @Modifying
    @Transactional
    @Query("UPDATE Order o SET o.hiddenStatus = 1 WHERE o.id IN :ids")
    void hideAllById(Set<String> ids);

    List<Order> findAllByHiddenStatus(HiddenStatus hiddenStatus, Sort sort);

    @Query("SELECT o FROM Order o WHERE o.vendor.vendorId = :vendorId")
    List<Order> findByVendorId(@Param("vendorId") String vendorId);
}
