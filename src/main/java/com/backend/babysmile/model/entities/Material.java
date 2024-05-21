package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.HiddenStatus;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
@Table(name = "materials")
public class Material {
    @Id
    @GeneratedValue(generator = "material-id-generator")
    @GenericGenerator(name = "material-id-generator", type = com.backend.babysmile.service.material.MaterialIdGenerator.class)
    @Column(nullable = false, columnDefinition = "CHAR(15)", length = 15, unique = true)
    private String materialId;
    @Column(nullable = false, columnDefinition = "CHAR(50)", length = 50)
    private String materialName;
    @Column(nullable = false, columnDefinition = "INTEGER(11)")
    private Long materialPrice;
    @Column(nullable = false)
    private int materialQuantity;
    @Column(nullable = false, columnDefinition = "CHAR(10)", length = 10)
    private String materialUnitOfMeasure;
    @Column(nullable = false, columnDefinition = "DATE")
    private Date materialWarehouseDate;
    @ManyToOne
    @JoinColumn(
            name = "type_id"
    )
    @JsonBackReference
    private MaterialType materialType;

    @ManyToOne
    @JoinColumn(
            name = "material_vendor_id"
    )
    @JsonManagedReference
    Vendor vendor;

    @OneToMany(mappedBy = "material")
    @JsonBackReference
    List<OrderMaterial> orderMaterials;

    @OneToMany(mappedBy = "material")
    List<MaterialExport> materialExports;

    @Column(nullable = false, name = "hidden_status")
    @Enumerated(EnumType.ORDINAL)
    HiddenStatus hiddenStatus = HiddenStatus.FALSE;

    public Material(String id) {
        this.materialId = id;
    }
}
