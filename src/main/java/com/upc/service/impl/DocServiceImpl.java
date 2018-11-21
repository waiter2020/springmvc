package com.upc.service.impl;

import com.upc.dao.CommentDao;
import com.upc.dao.DocDao;
import com.upc.model.Comment;
import com.upc.model.Doc;
import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

/**
 * Created by  waiter on 18-11-10  下午4:38.
 *
 * @author waiter
 */
@Service
public class DocServiceImpl implements DocService {
    private final DocDao docDao;
    private final CommentDao commentDao;

    @Autowired
    public DocServiceImpl(DocDao docDao, CommentDao commentDao) {
        this.docDao = docDao;
        this.commentDao = commentDao;
    }

    @Override
    public Doc save(Doc doc){
        return docDao.save(doc);
    }

    @Override
    public List<Doc> findAll(){
        return docDao.findAll();
    }

    @Override
    public List<Doc> getNewTop10() {
        Calendar calendar = Calendar.getInstance(Locale.CHINA);
        calendar.set(2018,3,2);
        return docDao.findTop10ByCreateAfterOrderByCreateDesc(calendar.getTime());
    }

    @Override
    public List<Doc> getWacthTop8() {
        return docDao.findTop8ByIdIsNotOrderByWatchDesc(null);
    }

    @Override
    public Comment addComment(Comment comment, Doc doc) {

        comment = commentDao.save(comment);
        List<Comment> comments = doc.getComments();
        if (comments==null){
            comments=new ArrayList<>();
        }
        comments.add(0,comment);
        doc.setComments(comments);

        docDao.save(doc);
        return comment;
    }

}
