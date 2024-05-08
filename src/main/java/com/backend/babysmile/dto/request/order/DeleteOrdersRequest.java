package com.backend.babysmile.dto.request.order;

public record DeleteOrdersRequest(
        String[] orderIds
) {
}
