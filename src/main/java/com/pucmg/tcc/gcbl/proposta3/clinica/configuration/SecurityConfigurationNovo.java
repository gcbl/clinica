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
                .antMatchers("/privado/api/**").permitAll() // tudo que envolve json
                // -- AUTOMATICA --

                // Medico
                .antMatchers("/privado/listar-medico").hasRole("LISTAR_MEDICO")
                .antMatchers("/privado/incluir-medico").hasRole("INCLUIR_MEDICO")
                .antMatchers("/privado/editar-medico").hasRole("EDITAR_MEDICO")
                .antMatchers("/privado/excluir-medico").hasRole("EXCLUIR_MEDICO")
                //.antMatchers("/privado/listar-medico-json").hasRole("LISTAR_MEDICO_JSON")
                //.antMatchers("/privado/listar-all-medico-json").hasRole("LISTAR_ALL_MEDICO_JSON") 
                .antMatchers("/privado/listar-recepcionista").hasRole("LISTAR_RECEPCIONISTA")
                .antMatchers("/privado/incluir-recepcionista").hasRole("INCLUIR_RECEPCIONISTA")
                .antMatchers("/privado/editar-recepcionista").hasRole("EDITAR_RECEPCIONISTA")
                .antMatchers("/privado/excluir-recepcionista").hasRole("EXCLUIR_RECEPCIONISTA")

                .antMatchers("/privado/listar-paciente").hasRole("LISTAR_PACIENTE")
                .antMatchers("/privado/incluir-paciente").hasRole("INCLUIR_PACIENTE")
                .antMatchers("/privado/editar-paciente").hasRole("EDITAR_PACIENTE")
                .antMatchers("/privado/excluir-paciente").hasRole("EXCLUIR_PACIENTE")    
                //.antMatchers("/privado/listar-all-paciente-json").hasRole("LISTAR_ALL_PACIENTE_JSON")
                //.antMatchers("/privado/listar-paciente-json").hasRole("LISTAR_PACIENTE_JSON")
                // .antMatchers("/privado/listar-historico-clinico-paciente-form").hasRole("LISTAR_HISTORICO_CLINICO_PACIENTE_FORM")
                .antMatchers("/privado/listar-historico-clinico-paciente").hasRole("LISTAR_HISTORICO_CLINICO_PACIENTE")
                .antMatchers("/privado/listar-historico-clinico-paciente-form").hasRole("LISTAR_HISTORICO_CLINICO_PACIENTE")

                
                
                //--------------
                .antMatchers("/privado/atender").hasRole("ATENDER")
                .antMatchers("/privado/criar-agenda-agendamento").hasRole("CRIAR_AGENDA_AGENDAMENTO")
                .antMatchers("/privado/desmarcar-horario-ajax-json").hasRole("DESMARCAR_HORARIO_AJAX_JSON")
                .antMatchers("/privado/editar-agendamento").hasRole("EDITAR_AGENDAMENTO")
                .antMatchers("/privado/editar-atendimento").hasRole("EDITAR_ATENDIMENTO")
                .antMatchers("/privado/editar-exame").hasRole("EDITAR_EXAME")
                .antMatchers("/privado/editar-medicamento").hasRole("EDITAR_MEDICAMENTO")
                
                .antMatchers("/privado/editar-receita").hasRole("EDITAR_RECEITA")

                .antMatchers("/privado/editar-resultadoExame").hasRole("EDITAR_RESULTADOEXAME")
                .antMatchers("/privado/editar-solicitacaoExame").hasRole("EDITAR_SOLICITACAOEXAME")
                .antMatchers("/privado/excluir-agendamento").hasRole("EXCLUIR_AGENDAMENTO")
                .antMatchers("/privado/excluir-atendimento").hasRole("EXCLUIR_ATENDIMENTO")
                .antMatchers("/privado/excluir-exame").hasRole("EXCLUIR_EXAME")
                .antMatchers("/privado/excluir-medicamento").hasRole("EXCLUIR_MEDICAMENTO")

                .antMatchers("/privado/excluir-receita").hasRole("EXCLUIR_RECEITA")

                .antMatchers("/privado/excluir-resultadoExame").hasRole("EXCLUIR_RESULTADOEXAME")
                .antMatchers("/privado/excluir-solicitacaoExame").hasRole("EXCLUIR_SOLICITACAOEXAME")
                .antMatchers("/privado/exibir-calendario-agendamento").hasRole("EXIBIR_CALENDARIO_AGENDAMENTO")
                .antMatchers("/privado/exibir-calendario-agendamento-medico").hasRole("EXIBIR_CALENDARIO_AGENDAMENTO_MEDICO")
                .antMatchers("/privado/exibir-calendario-vagas-agendamento").hasRole("EXIBIR_CALENDARIO_VAGAS_AGENDAMENTO")
                .antMatchers("/privado/exibir-calendario-vagas-agendamento-medico").hasRole("EXIBIR_CALENDARIO_VAGAS_AGENDAMENTO_MEDICO")
                .antMatchers("/privado/fullcalendar-listar-horario-ocupado-json").hasRole("FULLCALENDAR_LISTAR_HORARIO_OCUPADO_JSON")
                .antMatchers("/privado/fullcalendar-listar-horario-vago-json").hasRole("FULLCALENDAR_LISTAR_HORARIO_VAGO_JSON")
                .antMatchers("/privado/incluir-agendaForm").hasRole("INCLUIR_AGENDAFORM")
                .antMatchers("/privado/incluir-agendamento").hasRole("INCLUIR_AGENDAMENTO")
                .antMatchers("/privado/incluir-atendimento").hasRole("INCLUIR_ATENDIMENTO")
                .antMatchers("/privado/incluir-consulta-agendamento").hasRole("INCLUIR_CONSULTA_AGENDAMENTO")
                .antMatchers("/privado/incluir-exame").hasRole("INCLUIR_EXAME")
                .antMatchers("/privado/incluir-medicamento").hasRole("INCLUIR_MEDICAMENTO")

                .antMatchers("/privado/incluir-receita").hasRole("INCLUIR_RECEITA")

                .antMatchers("/privado/incluir-resultadoExame").hasRole("INCLUIR_RESULTADOEXAME")
                .antMatchers("/privado/incluir-solicitacaoExame").hasRole("INCLUIR_SOLICITACAOEXAME")
                .antMatchers("/privado/listar-agendamento").hasRole("LISTAR_AGENDAMENTO")
                .antMatchers("/privado/listar-all-exame-json").hasRole("LISTAR_ALL_EXAME_JSON")

                
                .antMatchers("/privado/listar-atendimento").hasRole("LISTAR_ATENDIMENTO")
                .antMatchers("/privado/listar-exame").hasRole("LISTAR_EXAME")
                .antMatchers("/privado/listar-exame-json").hasRole("LISTAR_EXAME_JSON")
                .antMatchers("/privado/listar-horario-vago-json").hasRole("LISTAR_HORARIO_VAGO_JSON")
                .antMatchers("/privado/listar-medicamento").hasRole("LISTAR_MEDICAMENTO")
                .antMatchers("/privado/listar-medicamento-json").hasRole("LISTAR_MEDICAMENTO_JSON")


                
                .antMatchers("/privado/listar-receita").hasRole("LISTAR_RECEITA")

                .antMatchers("/privado/listar-resultadoExame").hasRole("LISTAR_RESULTADOEXAME")
                .antMatchers("/privado/listar-solicitacaoExame").hasRole("LISTAR_SOLICITACAOEXAME")
                .antMatchers("/privado/marcar-horario-ajax-json").hasRole("MARCAR_HORARIO_AJAX_JSON")
                .antMatchers("/privado/pesquisar-agendamento").hasRole("PESQUISAR_AGENDAMENTO")
                
                .antMatchers("/privado/listar-grupo").hasRole("LISTAR_GRUPO")
                .antMatchers("/privado/incluir-grupo").hasRole("INCLUIR_GRUPO")
                .antMatchers("/privado/editar-grupo").hasRole("EDITAR_GRUPO")
                .antMatchers("/privado/excluir-grupo").hasRole("EXCLUIR_GRUPO")
                
                // -- /AUTOMATICA --
                .antMatchers("/**").hasRole("PERFIL_ADMIN")
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
        System.out.println(new BCryptPasswordEncoder().encode("1"));
    }    
    
}