package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.VendorStatus;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "vendors")
public class Vendor {
    @Id
    @GeneratedValue(generator = "vendor-id-generator")
    @GenericGenerator(name = "vendor-id-generator", type=com.backend.babysmile.service.vendor.VendorIdGenerator.class )
    @Column(name = "vendor_id", nullable = false, columnDefinition="CHAR(15)", length = 15, unique = true)
    private String vendorId;

    @Column(name = "vendor_name", nullable = false, length = 50)
    private String vendorName;

    @Column(name = "vendor_phone", nullable = false, columnDefinition="VARCHAR(10)")
    private String vendorPhone;

    @Column(name = "vendor_email", nullable = false, columnDefinition="VARCHAR(255)")
    private String vendorEmail;

    @Column(name = "vendor_address", nullable = false, columnDefinition="VARCHAR(255)")
    private String vendorAddress;

    @Column(name = "vendor_tax_code", length = 15)
    private String vendorTaxCode;

    @Column(name = "vendor_status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private VendorStatus vendorStatus;

    @Column(name = "vendor_order_budget", nullable = false ,columnDefinition = "INT DEFAULT 0")
    private Integer vendorOrderBudget;

    @Getter
    @OneToMany(mappedBy = "vendor", cascade = CascadeType.REMOVE, orphanRemoval = true)
    @JsonBackReference
    List<Material> materials;

    @OneToMany(mappedBy = "vendor", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    List<VendorMaterialType> vendorMaterialTypes;

    @OneToMany(mappedBy = "vendor")
    @JsonBackReference
    List<Order> orders;

    public Vendor(String id) {
        this.vendorId = id;
    }

    @Override
    public String toString() {
        return "Vendor{" +
                "vendorId=" + vendorId +
                ", vendorName='" + vendorName + '\'' +
                ", vendorPhone='" + vendorPhone + '\'' +
                ", vendorAddress='" + vendorAddress + '\'' +
                ", vendorTaxCode='" + vendorTaxCode + '\'' +
                ", vendorStatus=" + vendorStatus +
                ", vendorOrderBudget=" + vendorOrderBudget +
                '}';
    }
}
