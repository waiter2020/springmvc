package com.upc.service;

import com.upc.model.User;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2018-11-08 20:44:56
 */
public interface UserService {



    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */

    User queryById(Integer id);





    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    void deleteById(Integer id);





    User findByUserName(String userName);

    User save(User user);

    void saveAll(Iterable<User> users);

}