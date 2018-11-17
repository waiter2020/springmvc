package com.upc;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

/**
 * Created by  waiter on 18-11-17  下午3:51.
 *
 * @author waiter
 */
public class MyServletInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        setServlet(servletContext);
        setFilter(servletContext);

    }

    private void setServlet(ServletContext servletContext){
        ServletRegistration.Dynamic statViewServlet =
                servletContext.addServlet("statViewServlet", StatViewServlet.class);
        statViewServlet.setInitParameter("allow","127.0.0.1");
        statViewServlet.setInitParameter("resetEnable","true");
        statViewServlet.setInitParameter("loginUsername","druid");
        statViewServlet.setInitParameter("loginPassword","druid");
        statViewServlet.addMapping("/druid/*");

    }

    private void setFilter(ServletContext servletContext){
        /**
         * 配置字符过滤
         */
        FilterRegistration.Dynamic encodingFilter =
                servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
        encodingFilter.setInitParameter("encoding","UTF-8");
        encodingFilter.setInitParameter("forceEncoding","true");
        encodingFilter.addMappingForUrlPatterns(null,false,"/*");


        /**
         * 配置安全过滤
         */
        FilterRegistration.Dynamic securityFilterChain =
                servletContext.addFilter("springSecurityFilterChain", DelegatingFilterProxy.class);
        securityFilterChain.addMappingForUrlPatterns(null,false,"/*");

        /**
         * 阿里监控
         */

        FilterRegistration.Dynamic webStatFilter =
                servletContext.addFilter("webStatFilter", WebStatFilter.class);
        webStatFilter.setInitParameter("exclusions","*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        webStatFilter.setInitParameter("profileEnable","true");
        webStatFilter.setInitParameter("principalSessionName","user.username");
        webStatFilter.addMappingForUrlPatterns(null,false,"/*");






    }

}
