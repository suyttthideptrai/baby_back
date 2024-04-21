package com.backend.babysmile.model.entities;

import com.backend.babysmile.model.enums.Role;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false, columnDefinition = "INTEGER(10)", unique = true)
    private Long user_id;
    @Column(nullable = false)

    private String username;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false, columnDefinition = "VARCHAR(50)")
    private String user_real_name;
    @Column(nullable = false, columnDefinition ="CHAR(10)")
    private String phone_number;
    @Column(nullable = false, columnDefinition =  "VARCHAR(50)")
    private String user_address;
    @Column(nullable = false, columnDefinition = "VARCHAR(50)")
    private String user_email;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role;

    @OneToMany(mappedBy = "user")
    List<Order> orders;

    @OneToMany(mappedBy = "user")
    private List<Token> tokens;
    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", user_real_name='" + user_real_name + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", user_address='" + user_address + '\'' +
                ", user_email='" + user_email + '\'' +
                ", role=" + role +
                '}';
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
