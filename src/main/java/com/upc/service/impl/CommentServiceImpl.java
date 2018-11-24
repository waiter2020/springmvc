package com.upc.service.impl;

import com.upc.dao.CommentDao;
import com.upc.model.Comment;
import com.upc.model.Doc;
import com.upc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;

/**
 * Created by  waiter on 18-11-23  下午4:42.
 *
 * @author waiter
 */
@Service
public class CommentServiceImpl implements CommentService {
    private final CommentDao commentDao;

    @Autowired
    public CommentServiceImpl(CommentDao commentDao) {
        this.commentDao = commentDao;
    }

    @Override
    public Comment save(Comment comment) {
        return commentDao.save(comment);
    }

    @Override
    public List<Comment> saveAll(Iterable<Comment> comments) {
        return commentDao.saveAll(comments);
    }

    @Override
    public List<Comment> findAllByDoc(BigInteger doc) {
        return commentDao.findAllByDocOrderByCreateDesc(doc);
    }

    @Override
    public Long countAllByDoc(BigInteger doc) {
        return commentDao.countAllByDoc(doc);
    }
}
