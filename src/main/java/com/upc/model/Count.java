package com.upc.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.upc.component.BigIntegerJsonSerializer;
import lombok.Data;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.OrderBy;
import java.math.BigInteger;

/**
 * Created by  waiter on 18-11-24  下午1:10.
 *
 * @author waiter
 */
@Data
@Document
public class Count {
    @Indexed
    @JsonSerialize(using = BigIntegerJsonSerializer.class)
    private BigInteger id;
    private Long count;

    public Count() {
    }

    public Count(long l) {
        count=l;
    }
}
