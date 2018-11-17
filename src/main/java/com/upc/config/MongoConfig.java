package com.upc.config;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.ServerAddress;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.convert.CustomConversions;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.data.mongodb.core.convert.DbRefResolver;
import org.springframework.data.mongodb.core.convert.DefaultDbRefResolver;
import org.springframework.data.mongodb.core.convert.DefaultMongoTypeMapper;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.core.mapping.MongoMappingContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by  waiter on 18-11-17  下午5:47.
 *
 * @author waiter
 */
@Configuration
public class MongoConfig {
    @Bean
    public MongoClient mongoClient(){
        ServerAddress serverAddress = new ServerAddress("127.0.0.1",27017);
        MongoClientOptions.Builder builder = MongoClientOptions.builder();
        builder.connectionsPerHost(8);
        builder.threadsAllowedToBlockForConnectionMultiplier(4);
        builder.connectTimeout(1000);
        builder.maxWaitTime(1500);
        builder.socketTimeout(1500);
        MongoClientOptions build = builder.build();


        return new MongoClient(serverAddress,build);
    }

    @Bean
    public MongoDbFactory mongoDbFactory(MongoClient mongoClient){
        return new SimpleMongoDbFactory(mongoClient,"test");
    }

    @Bean
    public MongoTemplate mongoTemplate(MongoDbFactory mongoDbFactory){
        return new MongoTemplate(mongoDbFactory);
    }



    @Bean
    public MappingMongoConverter mappingMongoConverter(MongoDbFactory factory, MongoMappingContext context) {
        DbRefResolver dbRefResolver = new DefaultDbRefResolver(factory);
        MappingMongoConverter mappingConverter = new MappingMongoConverter(dbRefResolver, context);
        //去掉默认mapper添加的_class
        mappingConverter.setTypeMapper(new DefaultMongoTypeMapper(null));

        return mappingConverter;
    }

    @Bean
    public MongoMappingContext mongoMappingContext(){
        return new MongoMappingContext();
    }

}
