package com.backend.babysmile.model.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static com.backend.babysmile.model.enums.Permission.*;

@RequiredArgsConstructor
public enum Role {
    ADM(
            Set.of(
                    ADMIN_READ,
                    ADMIN_UPDATE,
                    ADMIN_DELETE,
                    ADMIN_CREATE,
                    MANAGER_READ,
                    MANAGER_UPDATE,
                    MANAGER_DELETE,
                    MANAGER_CREATE
            )
    ),
    //NON_STAFF(Collections.emptySet()),
//    PRD(Set.of(
//                    PRD_READ,
//                    PRD_UPDATE,
//                    PRD_CREATE
//    )), // ben san xuat: create/ update request purchase order
    IND(Set.of(
                    IND_READ,
                    IND_UPDATE,
                    IND_DELETE,
                    IND_CREATE
    )), // ben nhan kho. update order
    PUD(
            Set.of(
                    MANAGER_READ,
                    MANAGER_UPDATE,
                    MANAGER_DELETE,
                    MANAGER_CREATE
            )
    ) // supervisor: create/ update/ delete (validate )

    ;

    @Getter
    private final Set<Permission> permissions;

    public List<SimpleGrantedAuthority> getAuthorities() {
        var authorities = getPermissions()
                .stream()
                .map(permission -> new SimpleGrantedAuthority(permission.getPermission()))
                .collect(Collectors.toList());
        authorities.add(new SimpleGrantedAuthority("ROLE_" + this.name()));
        return authorities;
    }
}
