package com.upc.dao;

import com.upc.model.Doc;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * Created by  waiter on 18-11-10  下午4:36.
 *
 * @author waiter
 */
public interface DocDao extends MongoRepository<Doc, BigInteger> {
    List<Doc> findTop10ByCreateAfterOrderByCreateDesc(Date date);
}
