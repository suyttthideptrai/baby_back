package com.backend.babysmile.service.user;

import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.user.UserData;
import com.backend.babysmile.model.entities.User;
import com.backend.babysmile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public User getUser(String username, String password) {
        return userRepository.findByUsername(username)
                .orElseThrow();
    }
    public List<UserData> findAll(){
        return userRepository.findAll().stream().map(UserMapper::toUserData).collect(Collectors.toList());
    }

    public ResponseEntity<MessageRespond> deleteUser(long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if(user == null) {
            return ResponseEntity.badRequest().body(new MessageRespond(true, "User not found"));
        }
        userRepository.delete(user);
        return ResponseEntity.ok(new MessageRespond(false, "User deleted"));
    }

    public UserData findUserById(long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if(user == null) {
            return null;
        }
        return UserMapper.toUserData(user);
    }
}
