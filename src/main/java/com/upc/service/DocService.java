package com.upc.service;

import com.upc.model.Doc;

import java.util.List;

/**
 * Created by  waiter on 18-11-10  下午4:37.
 *
 * @author waiter
 */
public interface DocService {
    public Doc save(Doc doc);

    public List<Doc> findAll();

    public List<Doc> getTop10();
}
