package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import javax.servlet.http.HttpServletRequest;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;

public abstract class BaseController {


    public User getUsuarioLogado(HttpServletRequest request){
        return (User) request.getSession().getAttribute("usuarioLogado");
    }
    
    public String getVersaoSistema(HttpServletRequest request){
        return Constantes.VERSAO_DO_SISTEMA;
    }


}
