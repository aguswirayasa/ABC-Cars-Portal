package com.abc.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.filter.OncePerRequestFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        System.out.println("At Security configure");
        http
        .formLogin()
        .loginPage("/login")
        .loginProcessingUrl("/login")
        .failureUrl("/login_error")
        .permitAll()
        .defaultSuccessUrl("/login_success", true)
    .and()
    .csrf()
    .and()
    .authorizeRequests()
        .antMatchers("/").permitAll()
        .antMatchers("/css/**").permitAll()
        .antMatchers("/images/**").permitAll()
        .antMatchers("/js/**").permitAll()
        .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
        .antMatchers(HttpMethod.GET, "/login").permitAll()
        .antMatchers(HttpMethod.GET, "/register").permitAll()
        .antMatchers(HttpMethod.POST, "/register/save").permitAll()
        .antMatchers(HttpMethod.GET, "/home").hasAnyRole("Users","Administrator")
        .antMatchers(HttpMethod.GET, "/car-listing").hasAnyRole("Users","Administrator")
        .antMatchers(HttpMethod.GET, "/profile").hasAnyRole("Users","Administrator")
        .antMatchers(HttpMethod.GET, "/car_detail").hasAnyRole("Users","Administrator")
        .antMatchers(HttpMethod.GET, "/manage-user").hasRole("Administrator")
        .antMatchers(HttpMethod.GET, "/manage-car").hasRole("Administrator")
      
    .and()
    .logout()
        .logoutSuccessUrl("/logout")
        .invalidateHttpSession(true);

http.exceptionHandling().accessDeniedPage("/access-denied");

}}
