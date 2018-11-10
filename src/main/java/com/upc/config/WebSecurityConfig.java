package com.upc.config;


import com.upc.component.CustomLoginSuccessHandler;
import com.upc.service.impl.UserServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


/**
 * Created by  waiter on 18-6-18.
 * @author waiter
 *
 *  security配置
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final CustomLoginSuccessHandler customLoginSuccessHandler;

    private final UserServiceImpl userDetailsServiceIml;

    @Autowired
    public WebSecurityConfig(CustomLoginSuccessHandler customLoginSuccessHandler, UserServiceImpl userDetailsServiceIml) {
        this.customLoginSuccessHandler = customLoginSuccessHandler;
        this.userDetailsServiceIml = userDetailsServiceIml;
    }


    /**
     * 配置拦截器
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/admin","/admin/**","/admin/*").access("hasRole('管理员')")
                .antMatchers("/user").hasAuthority("ROLE_普通用户")
                .antMatchers("/","/index").permitAll()
                .antMatchers("/static/**", "/static/*").permitAll()
                .antMatchers("/script/*","/font/**", "/css/*", "/images/*", "/js/*").permitAll()
                .antMatchers("/**/*.js","/**/*.css","/**/*.gif",
                        "/**/*.png","/**/*.ico","/**/*.jpg","/**/*.eot",
                        "/**/*.svg","/**/*.ttf","/**/*.woff","/**/*.otf","/**/*.svg","/**/*.woff2").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login").successHandler(customLoginSuccessHandler)
                .permitAll()
                .and()
                .logout()
                .permitAll();
        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsServiceIml);
    }



    /**
     * 配置密码加密工具
     *
     * @return
     */
    @Bean
    public static BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


}