package com.upc.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.orm.jpa.JpaDialect;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Properties;

/**
 * Created by  waiter on 18-11-17  下午4:26.
 *
 * @author waiter
 */
@Configuration
public class JpaConfig {

    @Bean
    public  YamlPropertiesFactoryBean yaml() {
        YamlPropertiesFactoryBean yaml = new YamlPropertiesFactoryBean();
        yaml.setResources(new ClassPathResource("application.yml"));
        return yaml;
    }

    @Bean
    public DruidDataSource dataSource(YamlPropertiesFactoryBean yaml){
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.configFromPropety(yaml.getObject());
        return druidDataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource,
                                                                       JpaVendorAdapter jpaVendorAdapter,
                                                                       JpaDialect jpaDialect
                                                                       ){
        LocalContainerEntityManagerFactoryBean entityManagerFactory =
                new LocalContainerEntityManagerFactoryBean();
        entityManagerFactory.setDataSource(dataSource);
        entityManagerFactory.setPackagesToScan("com.**.model");
        entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
        entityManagerFactory.setJpaDialect(jpaDialect);
        HashMap<String, Object> objectObjectHashMap = new HashMap<>(3);
        objectObjectHashMap.put("hibernate.physical_naming_strategy","com.upc.component.SpringPhysicalNamingStrategy");
        objectObjectHashMap.put("hibernate.hbm2ddl.auto","update");
        objectObjectHashMap.put("hibernate.enable_lazy_load_no_trans","true");
        entityManagerFactory.setJpaPropertyMap(objectObjectHashMap);
        return entityManagerFactory;
    }

    @Bean
    public HibernateJpaVendorAdapter jpaVendorAdapter(){
        HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
        jpaVendorAdapter.setShowSql(true);
        jpaVendorAdapter.setDatabase(Database.MYSQL);
        jpaVendorAdapter.setGenerateDdl(true);
        jpaVendorAdapter.setDatabasePlatform("org.hibernate.dialect.MySQL5Dialect");
        return jpaVendorAdapter;
    }

    @Bean
    public HibernateJpaDialect jpaDialect(){
        return new HibernateJpaDialect();
    }

    @Bean
    public JpaTransactionManager transactionManager(DataSource dataSource, EntityManagerFactory entityManagerFactory){
        JpaTransactionManager jpaTransactionManager = new JpaTransactionManager();
        jpaTransactionManager.setDataSource(dataSource);
        jpaTransactionManager.setEntityManagerFactory(entityManagerFactory);
        return jpaTransactionManager;
    }

    @Bean
    public DruidStatInterceptor druidStatInterceptor(){
        return new DruidStatInterceptor();
    }

}
