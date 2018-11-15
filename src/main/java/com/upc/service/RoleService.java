package com.upc.service;

import com.upc.model.Role;
import java.util.List;

/**
 * (Role)表服务接口
 *
 * @author makejava
 * @since 2018-11-08 20:44:47
 */
public interface RoleService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Role queryById(Integer id);

    Role save(Role role);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    void deleteById(Integer id);

}