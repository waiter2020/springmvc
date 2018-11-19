package com.upc.service.impl;

import com.upc.dao.DocDao;
import com.upc.model.Doc;
import com.upc.service.DocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
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

    @Override
    public List<Doc> getTop10() {
        Calendar calendar = Calendar.getInstance(Locale.CHINA);
        calendar.set(2018,3,2);
        return docDao.findTop10ByCreateAfterOrderByCreateDesc(calendar.getTime());
    }

}
