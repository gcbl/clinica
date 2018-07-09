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
                // ---###--- PERMISSOES ---###---
                .antMatchers("/").permitAll()
                .antMatchers("/privado/inicio").permitAll()
                .antMatchers("/privado/home").permitAll()
                .antMatchers("/privado/api/**").permitAll()
                
                .antMatchers("/privado/**solicitacaoExame**").hasAnyRole("PERFIL_ADMIN, PERFIL_MEDICO")
                .antMatchers("/**").hasRole("PERFIL_ADMIN")
                
/*                
                .antMatchers("/privado/inicio").permitAll()
                .antMatchers("/privado/home").permitAll()
                .antMatchers("/privado/api/**").permitAll() // TODO: Colocar roles pra cada acao da API
                .antMatchers("/privado/listar-solicitacaoExame").hasRole("LISTAR_SOLICITACAO_EXAME")
                .antMatchers("/privado/incluir-solicitacaoExame").hasRole("INCLUIR_SOLICITACAO_EXAME")
                .antMatchers("/privado/excluir-solicitacaoExame").hasRole("EXCLUIR_SOLICITACAO_EXAME")
                .antMatchers("/privado/editar-solicitacaoExame").hasRole("EDITAR_SOLICITACAO_EXAME")
                .antMatchers("/privado/listar-resultadoExame").hasRole("LISTAR_RESULTADO_EXAME")
                .antMatchers("/privado/incluir-resultadoExame").hasRole("INCLUIR_RESULTADO_EXAME")
                .antMatchers("/privado/excluir-resultadoExame").hasRole("EXCLUIR_RESULTADO_EXAME")
                .antMatchers("/privado/editar-resultadoExame").hasRole("EDITAR_RESULTADO_EXAME")
*/                
                
                .anyRequest().denyAll()                
                // ---###--- FIM DAS PEMISSOES ---###--- 
                //.anyRequest().authenticated()
            .and()
            .csrf().disable()
            .formLogin()
                .loginPage("/login").permitAll()
                .defaultSuccessUrl("/privado/inicio")
            .and().
            logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/")
            .and()
                .exceptionHandling()
                .accessDeniedPage("/acesso-negado")
            .and()
            .rememberMe(); // <<< Habilita a função de "lembrar-me".        
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