package com.upc.dao;

import com.upc.model.Comment;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-21  下午3:13.
 *
 * @author waiter
 */

public interface CommentDao extends MongoRepository<Comment, BigInteger> {
}
