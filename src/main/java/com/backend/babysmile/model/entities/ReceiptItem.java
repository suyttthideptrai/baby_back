package com.backend.babysmile.model.entities;

import jakarta.persistence.*;
import lombok.*;

@Data
@Getter
@Setter
@Entity
@Table(name = "receipt_items")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReceiptItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long receiptItemId;

    @ManyToOne
    @JoinColumn(name = "receipt_id", nullable = false)
    Receipt receipt;

    @OneToOne
    @JoinColumn(name = "order_material_id", nullable = false, referencedColumnName = "order_material_id")
    OrderMaterial orderMaterial;

    @Column(nullable = false, name = "receipt_item_quantity")
    Integer quantity;
}
