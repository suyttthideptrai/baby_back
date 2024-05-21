package com.backend.babysmile.model.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "material_exports")
public class MaterialExport {
    @Id
    @GeneratedValue(generator = "export-id-generator")
    @GenericGenerator(name = "export-id-generator",  type = com.backend.babysmile.service.material.ExportIdGenerator.class)
    @Column(nullable = false, name =  "export_id", columnDefinition =  "CHAR(15)", unique = true, length = 15)
    String id;

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
