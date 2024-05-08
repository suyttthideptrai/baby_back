package com.backend.babysmile.repository.order;

import com.backend.babysmile.model.entities.Order;
import com.backend.babysmile.model.entities.OrderMaterial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrderMaterialRepository extends JpaRepository<OrderMaterial, String> {
    @Query("SELECT om FROM OrderMaterial om WHERE om.order.orderId LIKE %:orderId% ORDER BY om.orderMaterialId ASC")
    List<OrderMaterial> findAllAscendingSortedById(@Param("orderId")String orderId);

    @Query("SELECT om FROM OrderMaterial om WHERE om.order = :order AND om.material.materialId = :materialId")
     Optional<OrderMaterial> findByOrderAndMaterialId(@Param("order") Order order, @Param("materialId") String materialId);
}
