package com.upc.dao;

import com.upc.model.Type;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-24  下午2:35.
 *
 * @author waiter
 */
public interface TypeDao extends MongoRepository<Type, BigInteger> {

}
