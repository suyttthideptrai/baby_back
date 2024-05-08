package com.backend.babysmile.model.enums;

public enum OrderStatus {
    PENDING(0),
    APPROVED(1),
    DELIVERING(2),
    COMPLETED(3),
    REJECTED(4),
    SUSPENDING(5);

    OrderStatus(int value) {
    }
}
