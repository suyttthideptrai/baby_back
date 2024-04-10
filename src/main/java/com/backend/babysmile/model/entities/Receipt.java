package com.backend.babysmile.model.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "receipts")
public class Receipt {
    @Id
    @Column(nullable = false, columnDefinition = "VARCHAR(15)" ,length = 15, unique = true)
    String receiptId;
    @Column(nullable = false, columnDefinition = "DATETIME")
    Date createdAt;
    @ManyToOne
    @JoinColumn(
            nullable = false, name = "receipt_order_id"
    )
    Order order;
}
