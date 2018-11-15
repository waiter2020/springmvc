package com.upc.service.impl;

import com.upc.dao.RoleRepository;
import com.upc.model.Role;

import com.upc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Role)表服务实现类
 *
 * @author makejava
 * @since 2018-11-08 20:44:47
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleDao;

    @Autowired
    public RoleServiceImpl(RoleRepository roleDao) {
        this.roleDao = roleDao;
    }

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Role queryById(Integer id) {
        return this.roleDao.findOneById(id);
    }

    @Override
    public Role save(Role role) {
       return roleDao.save(role);
    }


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public void deleteById(Integer id) {
         this.roleDao.deleteById(id);
    }
}