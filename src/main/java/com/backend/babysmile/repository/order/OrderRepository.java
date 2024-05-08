package com.backend.babysmile.repository.order;

import com.backend.babysmile.model.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, String> {

}
