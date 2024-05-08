package com.backend.babysmile.model.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "receipts")
public class Receipt {

    @Id
    @GeneratedValue(generator = "receipt_id_generator")
    @GenericGenerator(name = "receipt_id_generator", type = com.backend.babysmile.service.receipt.ReceiptIDGenerator.class)
    @Column(nullable = false, columnDefinition = "CHAR(8)")
    String receiptId;

    @Column(nullable = false, columnDefinition = "DATETIME")
    Date createdAt;

    @ManyToOne
    @JoinColumn(
            nullable = false, name = "receipt_creator_id", columnDefinition = "INTEGER(10)"
    )
    User creator;

    @ManyToOne
    @JoinColumn(
            nullable = false, name = "receipt_order_id", columnDefinition = "CHAR(8)"
    )
    Order order;

    @OneToMany(mappedBy = "receipt")
//    @Column(nullable = false, name = "receipt_item")
    List<ReceiptItem> receiptItems;
}
