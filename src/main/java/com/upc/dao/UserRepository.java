package com.upc.dao;

import com.upc.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by  waiter on 18-11-13  下午4:42.
 *
 * @author waiter
 */
public interface UserRepository  extends JpaRepository<User,Integer> {
    User findByUserName(String userName);
}
