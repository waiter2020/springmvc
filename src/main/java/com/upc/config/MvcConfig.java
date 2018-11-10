package com.upc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by  waiter on 18-11-9  下午12:19.
 *
 * @author waiter
 */
@EnableWebMvc
@Configuration
public class MvcConfig implements WebMvcConfigurer {
    /**
     * 视图控制
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/edit/edit").setViewName("edit/edit");
        registry.addViewController("/index").setViewName("index.html");

        registry.addViewController("/editor/examples/index").setViewName("editor/examples/index");
        registry.addViewController("/editor/examples/simple").setViewName("editor/examples/simple");
        registry.addViewController("/editor/examples/full").setViewName("editor/examples/full");
        registry.addViewController("/editor/examples/use-requirejs").setViewName("editor/examples/use-requirejs");
        registry.addViewController("/editor/examples/use-seajs").setViewName("editor/examples/use-seajs");
        registry.addViewController("/editor/examples/use-zepto").setViewName("editor/examples/use-zepto");
        registry.addViewController("/editor/examples/form-get-value").setViewName("editor/examples/form-get-value");
        registry.addViewController("/editor/examples/html-preview-markdown-to-html").setViewName("editor/examples/html-preview-markdown-to-html");



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
        internalResourceViewResolver.setSuffix(".jsp");
        internalResourceViewResolver.setOrder(2);
        ThymeleafViewResolver thymeleafViewResolver = new ThymeleafViewResolver();
        thymeleafViewResolver.setCharacterEncoding("UTF-8");
        thymeleafViewResolver.setTemplateEngine(templateEngine);
        thymeleafViewResolver.setViewNames(new String[]{"*.html"});
        thymeleafViewResolver.setOrder(1);
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
    public SpringTemplateEngine templateEngine(SpringResourceTemplateResolver templateResolver){
        SpringTemplateEngine springTemplateEngine = new SpringTemplateEngine();
        springTemplateEngine.setTemplateResolver(templateResolver);
        return springTemplateEngine;
    }

    /**
     * 静态资源文件映射
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/editor/css/**").addResourceLocations("/WEB-INF/editor/css/");
        registry.addResourceHandler("/editor/js/**").addResourceLocations("/WEB-INF/editor/js/");
        registry.addResourceHandler("/editor/*.js").addResourceLocations("/WEB-INF/editor/");
        registry.addResourceHandler("/editor/**/*.md").addResourceLocations("/WEB-INF/editor/");
        registry.addResourceHandler("/editor/images/**").addResourceLocations("/WEB-INF/editor/images/");
        registry.addResourceHandler("/editor/lib/**").addResourceLocations("/WEB-INF/editor/lib/");
        registry.addResourceHandler("/editor/fonts/**").addResourceLocations("/WEB-INF/editor/fonts/");
        registry.addResourceHandler("/editor/plugins/**").addResourceLocations("/WEB-INF/editor/plugins/");
        registry.addResourceHandler("/editor/src/**").addResourceLocations("/WEB-INF/editor/src/");
        registry.addResourceHandler("/editor/scss/**").addResourceLocations("/WEB-INF/editor/scss/");
        registry.addResourceHandler("/editor/languages/**").addResourceLocations("/WEB-INF/editor/languages/");
        registry.addResourceHandler("/editor/docs/**").addResourceLocations("/WEB-INF/editor/docs/");

        registry.addResourceHandler("/editor/examples/css/**").addResourceLocations("/WEB-INF/editor/examples/css/");
        registry.addResourceHandler("/editor/examples/js/**").addResourceLocations("/WEB-INF/editor/examples/js/");
        registry.addResourceHandler("/editor/examples/images/**").addResourceLocations("/WEB-INF/editor/examples/images/");
        registry.addResourceHandler("/editor/examples/php/**").addResourceLocations("/WEB-INF/editor/examples/php/");



    }

}
