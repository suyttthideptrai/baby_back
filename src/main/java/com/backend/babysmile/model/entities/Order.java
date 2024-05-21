package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.OrderStatus;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(generator = "custom_order_id_gen")
    @GenericGenerator(name= "custom_order_id_gen", type=com.backend.babysmile.service.order.OrderIDGenerator.class)
    @Column(name = "order_id", nullable = false, columnDefinition =  "CHAR(8)")
    String orderId;

    @Column(name = "order_issued_date", nullable = false)
    Date orderIssuedDate;

    @Column(name = "order_approved_date")
    Date orderApprovedDate;

    @Column(name = "order_delivery_date")
    Date orderDeliveryDate;

    @Column(name = "order_title", length = 100)
    String orderTitle;

    @OneToMany(mappedBy = "order",  cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    Set<OrderMaterial> orderMaterials;

    @Column(name = "order_total_price")
    Long orderTotalPrice;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "order_status", nullable = false)
    OrderStatus orderStatus;

    @ManyToOne
    @JoinColumn(name = "order_user_id", nullable = false)
    @JsonManagedReference
    User user;

    @ManyToOne
    @JoinColumn(name = "order_vendor_id", nullable = false)
    @JsonManagedReference
    Vendor vendor;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    List<Receipt> receipt;
}
