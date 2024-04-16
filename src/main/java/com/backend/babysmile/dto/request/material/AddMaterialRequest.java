package com.backend.babysmile.dto.request.material;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public record AddMaterialRequest(
        @NotBlank(message = "Material name is required and cannot be empty.")
        String material_name,

        @NotNull(message = "Material price is required.")
        @Positive(message = "Material price must be greater than zero.")
        Long material_price,

        @NotBlank(message = "Unit of measure is required and cannot be empty.")
        String material_unit_of_measure,

        @NotNull(message = "Warehouse date is required.")
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        Date material_warehouse_date,

        @NotNull(message = "Material type ID is required.")
        @Positive(message = "Material type ID must be a positive integer.")
        Integer material_type_id,

        @NotBlank(message = "Vendor ID is required and cannot be empty.")
        String material_vendor_id
) {
}
