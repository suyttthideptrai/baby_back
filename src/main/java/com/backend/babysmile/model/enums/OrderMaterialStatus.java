package com.backend.babysmile.model.enums;

import lombok.Getter;

@Getter
public enum OrderMaterialStatus {
    NOT_DELIVERED(0),
    PARTIALLY_DELIVERED(1),
    DELIVERED(2);

    private final int value;

    OrderMaterialStatus(int value) {
        this.value = value;
    }

}
