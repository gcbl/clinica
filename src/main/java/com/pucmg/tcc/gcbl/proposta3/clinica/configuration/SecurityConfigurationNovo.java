package com.pucmg.tcc.gcbl.proposta3.clinica.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfigurationNovo extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService customlUserDetailsService;  
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private DataSource dataSource;
    
    @Value("${spring.queries.users-query}")
    private String usersQuery;
    
    @Value("${spring.queries.roles-query}")
    private String rolesQuery;

    @Override
    protected void configure(AuthenticationManagerBuilder builder) throws Exception {
        builder
            .userDetailsService(customlUserDetailsService)
          //.passwordEncoder(new BCryptPasswordEncoder());
            .passwordEncoder(new PlaintextPasswordEncoder());

    }
    

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        
        http.
            authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/console").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/loginErrado").permitAll()
                .antMatchers("/publico/**").permitAll()                
                .antMatchers("/privado/**").hasAuthority("ADMIN").anyRequest()
                .authenticated().and().csrf().disable().formLogin()
                //.loginPage("/login").failureUrl("/login?error=true")
                .loginPage("/login").failureUrl("/loginErrado")                
                .defaultSuccessUrl("/privado/inicio")
                .usernameParameter("email")
                .passwordParameter("password")
                .and().logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/").and().exceptionHandling()
                .accessDeniedPage("/access-denied");
    }
    
    @Override
    public void configure(WebSecurity web) throws Exception {
        web
           .ignoring()
           .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**", "/console/**");
    }

    public static void main(String[] args) {
        System.out.println(new BCryptPasswordEncoder().encode("teste"));
    }    
    
}