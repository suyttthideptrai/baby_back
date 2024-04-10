//package com.backend.babysmile.model.entities;
//
//import com.fasterxml.jackson.annotation.JsonManagedReference;
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@Builder
//@NoArgsConstructor
//@AllArgsConstructor
//@Entity
//@Table(name = "vendor_material")
//public class VendorMaterial {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "vendor_material_id", nullable = false)
//    Long id;
//
//    @ManyToOne
//    @JoinColumn(name = "vendor_id", nullable = false)
//    @JsonManagedReference
//    Vendor vendor;
//
//    @ManyToOne
//    @JoinColumn(name = "material_id", nullable = false)
//    @JsonManagedReference
//    Material material;
//
//    @Column(name = "vendor_material_price")
//    Long price;
//}
