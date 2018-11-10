package com.upc.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.annotation.Generated;

/**
 * Created by  waiter on 18-11-10  下午4:33.
 *
 * @author waiter
 */
@Data
@Document
public class Doc {
    @Indexed
    private User author;
    private String content;
}
