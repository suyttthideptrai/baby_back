package com.backend.babysmile.dto.request.material;

import java.util.Map;

public record ExportMaterialRequest(
        Map<String, Integer> material_quantities
) {
}
