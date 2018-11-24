package com.upc.service;

import com.upc.model.Type;

import java.util.List;

/**
 * Created by  waiter on 18-11-24  下午2:36.
 *
 * @author waiter
 */
public interface TypeService {
    Type save(Type type);
    List<Type> findAll();
}
