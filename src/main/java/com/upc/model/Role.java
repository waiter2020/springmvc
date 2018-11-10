package com.upc.model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import java.io.Serializable;

/**
 * (Role)实体类
 *  用户的角色
 * @author makejava
 * @since 2018-11-08 20:44:39
 */
@Data
public class Role implements Serializable , GrantedAuthority {
    private static final long serialVersionUID = -43171230546833125L;
    
    private Integer id;
    
    private String roleName;


    @Override
    public String getAuthority() {
        return "ROLE_"+roleName;
    }
}