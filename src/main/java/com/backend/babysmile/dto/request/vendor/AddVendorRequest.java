package com.backend.babysmile.dto.request.vendor;


import jakarta.validation.constraints.*;

public record AddVendorRequest(
        @NotBlank(message = "Vendor name is required and cannot be empty.")
        String vendor_name,

        @NotBlank(message = "Vendor phone is required and cannot be empty.")
        @Pattern(regexp = "\\+?[0-9.-]{10,15}", message = "Invalid phone number format.")
        String vendor_phone,

        @NotBlank(message = "Vendor email is required and cannot be empty.")
        @Email(message = "Invalid email format.")
        String vendor_email,

        @NotBlank(message = "Vendor address is required and cannot be empty.")
        String vendor_address,

        @Size(min = 10, max = 15, message = "Vendor tax code must be between 10 and 15 characters long.")
        String vendor_tax_code
) {
}
