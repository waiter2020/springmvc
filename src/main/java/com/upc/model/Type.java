package com.upc.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.upc.component.BigIntegerJsonSerializer;
import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.math.BigInteger;
import java.util.Date;

/**
 * Created by  waiter on 18-11-24  下午2:33.
 *
 * @author waiter
 */
@Document
@Data
public class Type {
    @Indexed
    @JsonSerialize(using = BigIntegerJsonSerializer.class)
    private BigInteger id;
    private String name;
    @CreatedDate
    private Date create;
    @CreatedBy
    private String createBy;
}
