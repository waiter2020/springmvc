package com.upc.dao;

import com.upc.model.Count;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-24  下午2:01.
 *
 * @author waiter
 */
public interface CountDao extends MongoRepository<Count, BigInteger> {
    Count findOneById(BigInteger id);
}
