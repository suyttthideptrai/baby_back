package com.backend.babysmile.model.enums;

import lombok.Getter;

@Getter
public enum HiddenStatus {
     FALSE(0),
     TRUE(1);

     private final int value;

     HiddenStatus(int value) {
          this.value = value;
     }

}
