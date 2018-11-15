package com.upc;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.EnableTransactionManagement;


/**
 * Created by  waiter on 18-11-8  下午7:26.
 *
 * @author waiter
 */
@EnableJpaRepositories
@EnableJpaAuditing
@Component
@ComponentScan
@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableTransactionManagement(proxyTargetClass = true)
public class SpringMvcApplication {

}
