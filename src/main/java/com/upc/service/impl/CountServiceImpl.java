package com.upc.service.impl;

import com.upc.dao.CountDao;
import com.upc.model.Count;
import com.upc.service.CountService;
import org.springframework.stereotype.Service;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-24  下午2:07.
 *
 * @author waiter
 */
@Service
public class CountServiceImpl implements CountService {
    private final CountDao countDao;

    public CountServiceImpl(CountDao countDao) {
        this.countDao = countDao;
    }


    @Override
    public Count save(Count count) {
        return countDao.save(count);
    }

    @Override
    public Count findById(BigInteger id) {
        return countDao.findOneById(id);
    }
}
