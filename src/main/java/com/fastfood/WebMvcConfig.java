package com.fastfood;

import com.fastfood.security.CartInterceptor;
import com.fastfood.security.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor()).addPathPatterns("/admin/**").excludePathPatterns("/admin/login").excludePathPatterns("/admin/getorderbytime").excludePathPatterns("/admin/chart/month");
        registry.addInterceptor(cartInterceptor()).excludePathPatterns("/admin/**").excludePathPatterns("/admin/getorderbytime");
    }

    @Bean
    public LoginInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }

    @Bean
    public CartInterceptor cartInterceptor(){return  new CartInterceptor();}
}
