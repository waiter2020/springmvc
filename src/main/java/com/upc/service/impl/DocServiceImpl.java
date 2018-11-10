package com.upc.service.impl;

import com.upc.dao.DocDao;
import com.upc.model.Doc;
import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by  waiter on 18-11-10  下午4:38.
 *
 * @author waiter
 */
@Service
public class DocServiceImpl implements DocService {
    private final DocDao docDao;

    @Autowired
    public DocServiceImpl(DocDao docDao) {
        this.docDao = docDao;
    }

    @Override
    public Doc save(Doc doc){
        return docDao.save(doc);
    }

    @Override
    public List<Doc> findAll(){
        return docDao.findAll();
    }

}
