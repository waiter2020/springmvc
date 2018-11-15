package com.upc.service.impl;

import com.upc.dao.UserRepository;
import com.upc.model.User;
import com.upc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2018-11-08 20:44:56
 */
@Service("userService")
public class UserServiceImpl implements UserService , UserDetailsService {
    private final UserRepository userDao;

    @Autowired
    public UserServiceImpl(UserRepository userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userDao.findByUserName(s);
        if(user == null){

            throw new UsernameNotFoundException("user not found");
        }

        return new org.springframework.security.core.userdetails.User(user.getUsername(),user.getPassword(),user.isEnabled(),user.isAccountNonExpired(),user.isCredentialsNonExpired(),user.isAccountNonLocked(),user.getAuthorities());
    }


    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Cacheable(cacheNames = "UserService_queryById")
    @Override
    public User queryById(Integer id) {
        System.out.println("访问");
        Optional<User> byId = this.userDao.findById(id);
        if (!byId.isPresent()){
            return null;
        }
        return byId.get();
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */


    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User save(User user) {
        this.userDao.save(user);
        return user;
    }



    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public void deleteById(Integer id) {
         this.userDao.deleteById(id);
    }




    @Override
    public User findByUserName(String userName) {
        return userDao.findByUserName(userName);
    }



    @Override
    public void saveAll(Iterable<User> users) {
        users.forEach(this::save);
    }


}