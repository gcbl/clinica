package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;

public abstract class BaseController {

    public static final String MODEL_STR = "MODEL";
    
    
    @Autowired
    MessageSource messageSource;
    
    public User getUsuarioLogado(HttpServletRequest request){
        return (User) request.getSession().getAttribute("usuarioLogado");
    }
    
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
    

}
