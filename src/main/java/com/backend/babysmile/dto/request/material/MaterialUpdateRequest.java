package com.backend.babysmile.dto.request.material;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public record MaterialUpdateRequest(
        @NotBlank(message = "Material ID is required and cannot be empty.")
        String material_id,

        @NotBlank(message = "Material name is required and cannot be empty.")
        String material_name,

        @NotNull(message = "Material quantity is required.")
        @Min(value = 0, message = "Material quantity must be zero or greater.")
        Integer material_quantity,

        @NotBlank(message = "Unit of measure is required and cannot be empty.")
        String material_unit_of_measure,

        @NotNull(message = "Warehouse date is required.")
        @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
        Date material_warehouse_date,

        @NotNull(message = "Material type is required.")
        @Positive(message = "Invalid material type ID")
        Integer material_type
) {
}
