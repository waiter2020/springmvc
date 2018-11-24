package com.upc.service.impl;

import com.upc.dao.CountDao;
import com.upc.dao.DocDao;
import com.upc.model.Count;
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
    private final CountDao countDao;

    @Autowired
    public DocServiceImpl(DocDao docDao, CountDao countDao) {
        this.docDao = docDao;
        this.countDao = countDao;
    }

    @Override
    public Doc save(Doc doc){
        if (doc.getWatch()==null) {
            Count count = new Count();
            count.setCount(0L);
            Count save = countDao.save(count);
            doc.setWatch(save);
        }
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



}
