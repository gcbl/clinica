package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.hibernate.stat.Statistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.UsuarioSistema;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Recepcionista;

public abstract class BaseController {

    @Autowired
    private SessionFactory sessionFactory;
    
    public static final String MODEL_STR = "MODEL";
    
    @Autowired
    MessageSource messageSource;
    
    //-------------------
    private static final String USUARIO_LOGADO = "usuarioLogado";
    private static final String MEDICO_LOGADO = "medicoLogado";
    private static final String RECEPCIONISTA_LOGADO = "recepcionistaLogado";
    private static final String AUTHENTICATION = "authentication";
    
    public void configuracoesIniciais(HttpServletRequest request){
    	// Seta na sessao para chamar da view
    	Usuario usuarioLogado = getUsuarioLogado();
    	Medico medicoLogado = getMedicoLogado();
    	Recepcionista recepcionistaLogado = getRecepcionistaLogado();
    	Authentication authentication = getAuthentication();
    	
        request.getSession().setAttribute(USUARIO_LOGADO, usuarioLogado);
        request.getSession().setAttribute(MEDICO_LOGADO, medicoLogado);
        request.getSession().setAttribute(RECEPCIONISTA_LOGADO, recepcionistaLogado);
        request.getSession().setAttribute(AUTHENTICATION, authentication);
    }
    
    public Medico getMedicoLogado(){
    	Medico medicoLogado = null;
    	Usuario usuarioLogado = getUsuarioLogado();
    	
    	// Poderia usar instanceof mas é meio tosco [e esse try/catch tambem é =P]
    	try {
    		medicoLogado = (Medico)usuarioLogado;
    	}catch(Throwable t) {		
    	}
    	
    	return medicoLogado;
    }

    public Recepcionista getRecepcionistaLogado() {
    	Recepcionista recepcionistaLogado = null;
        Usuario usuarioLogado = getUsuarioLogado();
    	
        // instanceof é meio tosco mas o prazo é curto
    	if(usuarioLogado instanceof Recepcionista) {
    		recepcionistaLogado = (Recepcionista) usuarioLogado;
    	}
    	
    	return recepcionistaLogado;
    }
    
    public Usuario getUsuarioLogado(){
        Authentication auth = getAuthentication();
        UsuarioSistema usuarioSistema = (UsuarioSistema)auth.getPrincipal();
        return usuarioSistema.getUsuario();
    }

    public Authentication getAuthentication(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth;
    }

    //-------------------
    
    public String getVersaoSistema(HttpServletRequest request){
        return Constantes.VERSAO_DO_SISTEMA;
    }

    public void adicionarAlertaPrimary(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_PRIMARY , mensagem);
    }
    
    public void adicionarAlertaSecondary(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_SECONDARY , mensagem);
    }
    
    public void adicionarAlertaSuccess(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_SUCCESS , mensagem);
    }

    public void adicionarAlertaDanger(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_DANGER , mensagem);
    }
    
    public void adicionarAlertaWarning(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_WARNING , mensagem);
    }

    public void adicionarAlertaInfo(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_INFO , mensagem);
    }
    
    public void adicionarAlertaLight(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_LIGHT , mensagem);
    }  
    
    public void adicionarAlertaDark(Model model, String mensagem){
        model.addAttribute(Constantes.ALERTA_DARK , mensagem);
    }  
    
    public Statistics getHibernateStatistics(){
        // Para gerar estatisticas habilite o spring.jpa.properties.hibernate.generate_statistics=true em application.properties 
        return sessionFactory.getStatistics();
    }
    
}
