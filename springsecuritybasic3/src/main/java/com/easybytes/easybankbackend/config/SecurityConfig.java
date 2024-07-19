package com.easybytes.easybankbackend.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
public class SecurityConfig {
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http.authorizeHttpRequests((authorize)->
                authorize
                        .requestMatchers("/myAccount", "/myBalance", "/myLoans", "/myCards")
                        .authenticated()
                        .requestMatchers("/notices", "/contact", "/register")
                        .permitAll()
                        .requestMatchers("/h2-console/**")
                        .permitAll()
                        .anyRequest()
                        .permitAll()
//                        .authenticated()
        );
        http.csrf((csrf)-> csrf.disable());
        http.formLogin(Customizer.withDefaults());
        return http.build();
    }
    // h2 요청은 필터 안거치게 하기
    @Bean
    @ConditionalOnProperty(name = "spring.h2.console.enabled",havingValue = "true")
    public WebSecurityCustomizer configureH2ConsoleEnable() {
        return web -> web.ignoring()
                .requestMatchers(PathRequest.toH2Console());
    }
//    @Bean
//    public UserDetailsService userDetailsService(DataSource dataSource) {
//        return new JdbcUserDetailsManager(dataSource);
//    }
//    @Bean
//    public InMemoryUserDetailsManager userDetailsServices(){
//        UserDetails admin = User.withDefaultPasswordEncoder()
//                .username("admin")
//                .password("12345")
//                .authorities("admin")
//                .build();
//        UserDetails user = User.withDefaultPasswordEncoder()
//                .username("user")
//                .password("12345")
//                .authorities("read")
//                .build();
////        UserDetails admin = User.withUsername("admin")
////                .password("12345")
////                .authorities("admin")
////                .build();
////        UserDetails user = User.withUsername("user")
////                .password("12345")
////                .authorities("read")
////                .build();
//        return new InMemoryUserDetailsManager(admin, user);
//    }
    @Bean
    public PasswordEncoder passwordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

}
