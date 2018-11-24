package com.upc.dao;

import com.upc.model.Comment;
import com.upc.model.Doc;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.math.BigInteger;
import java.util.List;

/**
 * Created by  waiter on 18-11-21  下午3:13.
 *
 * @author waiter
 */

public interface CommentDao extends MongoRepository<Comment, BigInteger> {
    List<Comment> findAllByDocOrderByCreateDesc(BigInteger doc);
    Long countAllByDoc(BigInteger doc);
    
}
