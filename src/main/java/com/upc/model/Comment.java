package com.upc.model;

import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigInteger;
import java.util.Date;

/**
 * Created by  waiter on 18-11-21  下午3:11.
 *
 * @author waiter
 */
@Document
@Data
public class Comment {
    @Indexed
    private BigInteger id;
    @CreatedBy
    private String userName;
    private String content;
    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date create;
}
