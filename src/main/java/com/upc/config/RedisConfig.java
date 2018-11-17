package com.upc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * Created by  waiter on 18-11-17  下午6:41.
 *
 * @author waiter
 */
@Configuration
public class RedisConfig {
    @Bean
    public JedisConnectionFactory jedisConnectionFactory(){
        return new JedisConnectionFactory(new RedisStandaloneConfiguration("127.0.0.1",6379));
    }

    @Bean
    public RedisCacheManager redisCacheManager(JedisConnectionFactory connectionFactory){
        return RedisCacheManager.create(connectionFactory);
    }

    @Bean
    public StringRedisSerializer stringRedisSerializer(){
        return new StringRedisSerializer();
    }

    @Bean
    public RedisTemplate redisTemplate(JedisConnectionFactory connectionFactory,
                                       StringRedisSerializer stringRedisSerializer){
        RedisTemplate redisTemplate = new RedisTemplate();
        redisTemplate.setKeySerializer(stringRedisSerializer);
        redisTemplate.setHashKeySerializer(stringRedisSerializer);
        redisTemplate.setConnectionFactory(connectionFactory);
        return redisTemplate;
    }

    @Bean
    public StringRedisTemplate stringRedisTemplate(JedisConnectionFactory connectionFactory){
        return new StringRedisTemplate(connectionFactory);
    }

}
