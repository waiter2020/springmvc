package com.upc.service.impl;

import com.upc.dao.TypeDao;
import com.upc.model.Type;
import com.upc.service.TypeService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by  waiter on 18-11-24  下午2:37.
 *
 * @author waiter
 */
@Service
public class TypeServiceImpl implements TypeService {
    private final TypeDao typeDao;

    public TypeServiceImpl(TypeDao typeDao) {
        this.typeDao = typeDao;

    }

    @Override
    public Type save(Type type) {
        return typeDao.save(type);
    }

    @Override
    public List<Type> findAll() {
        return typeDao.findAll();
    }
}
