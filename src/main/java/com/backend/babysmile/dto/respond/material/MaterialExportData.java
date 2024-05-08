package com.backend.babysmile.dto.respond.material;

import java.util.Date;

public record MaterialExportData(
        String material_id,
        String material_name,
        int material_quantity,
        Date material_export_date
) {
}
