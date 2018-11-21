package com.upc.model;

import lombok.Data;
import org.springframework.core.annotation.Order;
import org.springframework.data.annotation.*;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import javax.annotation.Generated;
import javax.persistence.OrderBy;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by  waiter on 18-11-10  下午4:33.
 *
 * @author waiter
 */
@Data
@Document
public class Doc {
    @Indexed
    private BigInteger id;
    @CreatedBy
    private String author;
    private String title;
    private String subTitle;
    private String body;
    private Integer watch=0;
    @DBRef
    @OrderBy("create desc ")
    private List<Comment> comments = new ArrayList<>() ;
    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date create;
    @LastModifiedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date modify;
}
