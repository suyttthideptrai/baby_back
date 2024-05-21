package com.backend.babysmile.model.entities;

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
@Table(name = "material_exports")
public class MaterialExport {
    @Id
    @GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
    @Column(nullable = false, name =  "export_id")
    Long id;

    @ManyToOne
    @JoinColumn(
               name = "export_material_id"
     )
    Material material;

    @Column(nullable = false, name = "export_quantity")
    Integer quantity;

    @Column(nullable = false, name = "export_date")
    Date exportDate;
}
