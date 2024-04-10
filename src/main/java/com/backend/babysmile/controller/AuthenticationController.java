package com.backend.babysmile.controller;


import com.backend.babysmile.dto.request.LoginRequest;
import com.backend.babysmile.dto.request.RegisterRequest;
import com.backend.babysmile.dto.respond.AuthenticationResponse;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.model.enums.Role;
import com.backend.babysmile.service.auth.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {
    private final AuthenticationService service;
    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request
    ) {
        return ResponseEntity.ok(service.register(request));
    }
    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody LoginRequest request
    ) {
        return ResponseEntity.ok(service.authenticate(request));
    }

    @GetMapping("/hello")
    public ResponseEntity<MessageRespond> message(){
        return ResponseEntity.ok(new MessageRespond(false, "Hello World"));
    }

    @PostMapping("/testregister")
    public ResponseEntity<MessageRespond> msg(@RequestBody RegisterRequest request){
        System.out.println("received");
        String username = request.getUsername();
        String password = request.getPassword();
        String phone_number = request.getPhone_number();
        Role role = request.getRole();
        return ResponseEntity.ok(new MessageRespond(false, username + " " + password + " " + phone_number + " " + role.toString()));
    }
//    @PostMapping("/refresh-token")
//    public void refreshToken(
//            HttpServletRequest request,
//            HttpServletResponse response
//    ) throws IOException {
//        service.refreshToken(request, response);
//    }
}
