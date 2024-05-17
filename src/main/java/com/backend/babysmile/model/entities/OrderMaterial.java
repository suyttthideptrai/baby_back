package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.OrderMaterialStatus;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.proxy.HibernateProxy;

import java.util.List;
import java.util.Objects;


@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "order_materials")
public class OrderMaterial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_material_id", nullable = false)
    private Long orderMaterialId;

    @ManyToOne
    @JoinColumn(name = "order_id", columnDefinition = "CHAR(8)" ,nullable = false)
    @JsonBackReference
    private Order order;

    @ManyToOne
    @JoinColumn(name = "material_id", nullable = false)
    @JsonManagedReference
    private Material material;

    @Column(name = "order_material_quantity", nullable = false)
    private Integer orderMaterialQuantity;

    @Column(name = "order_material_actual_quantity", nullable = false)
    private int orderMaterialActualQuantity;

    @Column(name = "order_material_price_per_unit", nullable = false)
    private Long orderMaterialPricePerUnit;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "order_material_status", nullable = false)
    private OrderMaterialStatus OrderMaterialStatus;

    @OneToMany(mappedBy = "orderMaterial")
    private List<ReceiptItem> receiptItems;

    @Override
    public final boolean equals(Object object) {
        if (this == object) return true;
        if (object == null) return false;
        Class<?> oEffectiveClass = object instanceof HibernateProxy ? ((HibernateProxy) object).getHibernateLazyInitializer().getPersistentClass() : object.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        OrderMaterial that = (OrderMaterial) object;
        return getOrderMaterialId() != null && Objects.equals(getOrderMaterialId(), that.getOrderMaterialId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }
}
