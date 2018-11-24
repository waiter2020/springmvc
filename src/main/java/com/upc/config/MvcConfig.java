package com.upc.config;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRegistration;
import javax.servlet.annotation.WebFilter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by  waiter on 18-11-9  下午12:19.
 *
 * @author waiter
 */

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = "com.*.controller")
public class MvcConfig implements WebMvcConfigurer {
    /**
     * 视图控制
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login.jsp");
        registry.addViewController("/index").setViewName("index.jsp");
        registry.addViewController("/edit/edit").setViewName("edit/edit.jsp");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/register").setViewName("register");

        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/404").setViewName("404");
        registry.addViewController("/about").setViewName("about");
        registry.addViewController("/article").setViewName("article");
        registry.addViewController("/detail").setViewName("detail");
        registry.addViewController("/resource").setViewName("resource");
        registry.addViewController("/timeline").setViewName("timeline");
        registry.addViewController("/admin/index").setViewName("admin/index");
        registry.addViewController("/admin/user/change").setViewName("admin/user/change");
        registry.addViewController("/admin/user/list").setViewName("admin/user/list");
        registry.addViewController("/admin/edit/edit").setViewName("admin/edit/edit");


        registry.addViewController("/editor/examples/index").setViewName("editor/examples/index.jsp");
        registry.addViewController("/editor/examples/simple").setViewName("editor/examples/simple.jsp");
        registry.addViewController("/editor/examples/full").setViewName("editor/examples/full.jsp");
        registry.addViewController("/editor/examples/use-requirejs").setViewName("editor/examples/use-requirejs.jsp");
        registry.addViewController("/editor/examples/use-seajs").setViewName("editor/examples/use-seajs.jsp");
        registry.addViewController("/editor/examples/use-zepto").setViewName("editor/examples/use-zepto.jsp");
        registry.addViewController("/editor/examples/form-get-value").setViewName("editor/examples/form-get-value.jsp");
        registry.addViewController("/editor/examples/html-preview-markdown-to-html").setViewName("editor/examples/html-preview-markdown-to-html.jsp");



    }

    /**
     * 视图解析器配置
     * @return
     */
    @Bean
    public ViewResolver viewResolver(SpringTemplateEngine templateEngine){
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setViewClass(JstlView.class);
        internalResourceViewResolver.setPrefix("/WEB-INF/");
        internalResourceViewResolver.setSuffix("");
        internalResourceViewResolver.setViewNames("*.jsp");
        internalResourceViewResolver.setOrder(1);
        ThymeleafViewResolver thymeleafViewResolver = new ThymeleafViewResolver();
        thymeleafViewResolver.setCharacterEncoding("UTF-8");
        thymeleafViewResolver.setTemplateEngine(templateEngine);
//        thymeleafViewResolver.setViewNames(new String[]{"*.html"});
        thymeleafViewResolver.setOrder(2);
        ContentNegotiatingViewResolver contentNegotiatingViewResolver = new ContentNegotiatingViewResolver();

        List<ViewResolver> viewResolvers = new ArrayList<>();
        viewResolvers.add(internalResourceViewResolver);
        viewResolvers.add(thymeleafViewResolver);
        contentNegotiatingViewResolver.setViewResolvers(viewResolvers);
        return contentNegotiatingViewResolver;
    }

    @Bean
    public SpringResourceTemplateResolver templateResolver(){
        SpringResourceTemplateResolver springResourceTemplateResolver = new SpringResourceTemplateResolver();
        springResourceTemplateResolver.setPrefix("classpath:/templates/");
        springResourceTemplateResolver.setSuffix(".html");
        springResourceTemplateResolver.setTemplateMode("LEGACYHTML5");
        springResourceTemplateResolver.setCacheable(false);
        springResourceTemplateResolver.setCharacterEncoding("UTF-8");
        return springResourceTemplateResolver;
    }
    @Bean
    public SpringTemplateEngine templateEngine(ITemplateResolver templateResolver,
                                               SpringSecurityDialect securityDialect) {
        SpringTemplateEngine engine = new SpringTemplateEngine();
        engine.setEnableSpringELCompiler(true);
        engine.addTemplateResolver(templateResolver);
        engine.addDialect(securityDialect);
        return engine;
    }

    /**
     * 静态资源文件映射
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**").addResourceLocations("/static/css/");
        registry.addResourceHandler("/js/**").addResourceLocations("/static/js/");
        registry.addResourceHandler("/images/**").addResourceLocations("/static/images/");
        registry.addResourceHandler("/plug/**").addResourceLocations("/static/plug/");
        registry.addResourceHandler("/editor/**").addResourceLocations("/static/editor/");


        registry.addResourceHandler("/admin/**").addResourceLocations("/templates/admin/");
        registry.addResourceHandler("/admin/**/js/**").addResourceLocations("/templates/admin/");



    }

    @Bean
    public CommonsMultipartResolver multipartResolver(ServletContext servletContext){
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(servletContext);
        commonsMultipartResolver.setMaxUploadSize(10000000);
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        return commonsMultipartResolver;
    }



}
