package com.backend.babysmile.service;

import com.backend.babysmile.model.User;
import com.backend.babysmile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public User getUser(String username, String password) {
        return userRepository.findByUsername(username)
                .orElseThrow();
    }
    public List<User> findAll(){
        return userRepository.findAll();
    }
}
