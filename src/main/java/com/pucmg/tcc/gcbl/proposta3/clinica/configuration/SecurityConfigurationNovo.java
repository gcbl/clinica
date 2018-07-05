package com.pucmg.tcc.gcbl.proposta3.clinica.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.pucmg.tcc.gcbl.proposta3.clinica.service.security.CustomUserDetailsService;

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
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
            .authorizeRequests()
                .antMatchers("/").permitAll()
                .anyRequest().authenticated()
            .and()
            //.csrf().disable()
            .formLogin()
                .loginPage("/login").permitAll()
                .defaultSuccessUrl("/privado/inicio")
            .and().
            logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/")
            .and()
                .exceptionHandling()
                .accessDeniedPage("/access-denied")
            .and()
            .rememberMe(); // <<< Habilita a função de "lembrar-me".        
        
            configurarAutorizacoes(httpSecurity);
    }

    private void configurarAutorizacoes(HttpSecurity httpSecurity) throws Exception{
        httpSecurity.
            authorizeRequests()
                .antMatchers("/privado/**-receita").hasRole("VISUALIZAR_RELATORIO_EQUIPE")
                .antMatchers("/vendas/relatorios/custos").hasRole("VISUALIZAR_RELATORIO_CUSTOS");
        
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