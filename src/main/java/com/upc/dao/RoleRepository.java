package com.upc.dao;

import com.upc.model.Role;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (Role)表数据库访问层
 *
 * @author makejava
 * @since 2018-11-08 20:44:47
 */

public interface RoleRepository extends JpaRepository<Role,Integer> {
    Role findOneById(Integer id);


}