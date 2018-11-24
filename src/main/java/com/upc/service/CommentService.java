package com.upc.service;

import com.upc.model.Comment;
import com.upc.model.Doc;

import java.math.BigInteger;
import java.util.List;

/**
 * Created by  waiter on 18-11-23  下午4:39.
 *
 * @author waiter
 */
public interface CommentService {
    Comment save(Comment comment);
    List<Comment> saveAll(Iterable<Comment> comments);
    List<Comment> findAllByDoc(BigInteger doc);
    Long countAllByDoc(BigInteger doc);
}
