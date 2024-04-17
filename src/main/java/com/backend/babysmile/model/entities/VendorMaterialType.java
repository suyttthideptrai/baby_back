package com.backend.babysmile.model.entities;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vendor_supplied_types")
public class VendorMaterialType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    Long id;

    @ManyToOne
    @JoinColumn(name = "vendor_id", columnDefinition = "CHAR(15)", nullable = false)
    @JsonManagedReference
    Vendor vendor;

    @ManyToOne
    @JoinColumn(name = "material_type_id", nullable = false)
//    @JsonManagedReference
    MaterialType materialType;
}
