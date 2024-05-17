package com.backend.babysmile.model.enums;

public enum OrderStatus {
    UNPROCESSED(0),
    PROCESSING(1),
    COMPLETED(2),
    CANCELLED(3);

    OrderStatus(int value) {
    }
}
