package com.easybytes.easybankbackend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http.authorizeHttpRequests((authorize)->
                authorize
                        .requestMatchers("/myAccount", "/myBalance", "/myLoans", "/myCards")
                        .authenticated()
                        .requestMatchers("/notices", "/contact")
                        .permitAll()
        );
        return http.build();
    }
}
