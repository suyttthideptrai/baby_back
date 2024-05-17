package com.backend.babysmile.model.enums;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Permission {
    ADMIN_READ("admin:read"),
    ADMIN_UPDATE("admin:update"),
    ADMIN_CREATE("admin:create"),
    ADMIN_DELETE("admin:delete"),
    MANAGER_READ("management:read"),
    MANAGER_UPDATE("management:update"),
    MANAGER_CREATE("management:create"),
    MANAGER_DELETE("management:delete"),
    PRD_CREATE("prd:create"),
    PRD_READ("prd:read"),
    PRD_UPDATE("prd:update"),
    IND_READ("ind:read"),
    IND_UPDATE("ind:update"),
    IND_DELETE("ind:delete"),
     IND_CREATE("ind:create");
    private final String permission;
}

