package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.OrderStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    Long orderId;

    @Column(name = "order_issued_date", nullable = false)
    Date orderIssuedDate;

    @Column(name = "order_title", nullable = false, length = 50)
    String orderTitle;

    @Column(name = "order_quantity", nullable = false)
    Integer quantity;

    @Column(name = "order_total_price", nullable = false)
    Long orderTotalPrice;

    @Enumerated(EnumType.STRING)
    @Column(name = "order_status", nullable = false)
    OrderStatus orderStatus;

    @Column(name = "order_delivery_date", nullable = false)
    Date orderDeliveryDate;

    @Column(name = "order_note", length = 100)
    String orderNote;

    @ManyToOne
    @JoinColumn(name = "order_user_id", nullable = false)
    User user;

    @ManyToOne
    @JoinColumn(name = "order_vendor_id", nullable = false)
    Vendor vendor;

    @ManyToOne
    @JoinColumn(name = "order_material_id", nullable = false)
    Material material;

    @OneToOne
    @JoinColumn(name = "order_receipt_id")
    Receipt receipt;
}
