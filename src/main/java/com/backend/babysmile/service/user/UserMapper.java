package com.backend.babysmile.service.user;

import com.backend.babysmile.dto.respond.user.UserData;
import com.backend.babysmile.model.entities.User;

public class UserMapper {
    public static UserData toUserData(User user) {
        return new UserData(
                user.getUser_id(),
                user.getUsername(),
                user.getUser_real_name(),
                user.getPhone_number(),
                user.getUser_address(),
                user.getUser_email(),
                user.getRole()
        );
    }
}
