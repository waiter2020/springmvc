package com.upc.service;

import com.upc.model.Count;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-24  下午2:06.
 *
 * @author waiter
 */
public interface CountService {
    Count save(Count count);
    Count findById(BigInteger id);
}
