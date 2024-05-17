package com.backend.babysmile.dto.respond.user;

import com.backend.babysmile.model.enums.Role;

public record UserData(
        long user_id,
        String user_name,
        String user_real_name,
        String user_phone_number,
        String user_address,
        String user_email,
        Role role
) {
}
