package com.backend.babysmile.dto.request.material;

public record BulkDeleteRequest(
        String[] selected_ids
) {
}
