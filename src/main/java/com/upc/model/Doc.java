package com.upc.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.upc.component.BigIntegerJsonSerializer;
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
    @JsonSerialize(using = BigIntegerJsonSerializer.class)
    private BigInteger id;
    @CreatedBy
    private String author;
    private String title;
    private String subTitle;
    private String body;
    @DBRef
    private Count watch;
    @DBRef
    private Type type;

    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date create;
    @LastModifiedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date modify;
}
