package com.upc.dao;

import com.upc.model.Doc;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by  waiter on 18-11-10  下午4:36.
 *
 * @author waiter
 */
public interface DocDao extends MongoRepository<Doc,Long> {
}
