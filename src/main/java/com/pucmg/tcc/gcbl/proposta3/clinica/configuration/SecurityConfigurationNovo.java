package com.pucmg.tcc.gcbl.proposta3.clinica.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfigurationNovo extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;  

   
    @Override
    protected void configure(AuthenticationManagerBuilder builder) throws Exception {

        builder
        .userDetailsService(customUserDetailsService)
        //.passwordEncoder(new BCryptPasswordEncoder());
        .passwordEncoder(new PlaintextPasswordEncoder());
        
    }  

    @Override
    protected void configure(HttpSecurity http) throws Exception {
      http
          .authorizeRequests()
              .anyRequest().authenticated()
          .and()
          .formLogin(); // <<< de HTTP Basic para formulário
    }    
    
    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("teste"));
    }    
    
}