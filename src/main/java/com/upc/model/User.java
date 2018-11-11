package com.upc.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2018-11-08 20:44:56
 */
@Data
public class User implements Serializable , UserDetails {
    private static final long serialVersionUID = -60781486773939584L;
    /**
     * 用户id
     */
    private Integer id;
    
    private String userName;

    private String nickName;

    private String password;

    private String phone;

    private String email;

    private Boolean enable;

    private List<Role> roles ;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return userName;
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
        return enable;
    }
}