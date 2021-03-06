package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;

@Component
public class RequestInterceptor extends HandlerInterceptorAdapter {
	
    private static Log log = LogFactory.getLog(RequestInterceptor.class);

	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String  nomeSistema = (String)request.getSession().getAttribute("nomeSistema");
        String       versao = (String)request.getSession().getAttribute("versao");
        
        String  ACAO_LISTAR = (String)request.getSession().getAttribute("ACAO_LISTAR");
        String ACAO_INCLUIR = (String)request.getSession().getAttribute("ACAO_INCLUIR");
        String ACAO_EXCLUIR = (String)request.getSession().getAttribute("ACAO_EXCLUIR");
        String  ACAO_EDITAR = (String)request.getSession().getAttribute("ACAO_EDITAR");

        if(nomeSistema == null){ // "" ou null
            request.getSession().setAttribute("nomeSistema", Constantes.NOME_DO_SISTEMA);
        }         
        
        if(versao == null){ // "" ou null
            request.getSession().setAttribute("versao", Constantes.VERSAO_DO_SISTEMA);
        }

        // ACOES DO CRUD pra inserir o hidden ou nao.
        // Poderia usar o Constants no JSP mas vai no purismo ;)
        if(ACAO_LISTAR == null){ // "" ou null
            request.getSession().setAttribute("ACAO_LISTAR", Constantes.ACAO_LISTAR);
        }
        if(ACAO_INCLUIR == null){ // "" ou null
            request.getSession().setAttribute("ACAO_INCLUIR", Constantes.ACAO_INCLUIR);
        }
        if(ACAO_EXCLUIR == null){ // "" ou null
            request.getSession().setAttribute("ACAO_EXCLUIR", Constantes.ACAO_EXCLUIR);
        }
        if(ACAO_EDITAR == null){ // "" ou null
            request.getSession().setAttribute("ACAO_EDITAR", Constantes.ACAO_EDITAR);
        }        

        
//        // set few parameters to handle ajax request from different host
//        respo!nse.addHeader("Access-Control-Allow-Origin", "*");
//        response.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
//        response.addHeader("Access-Control-Max-Age", "1000");
//        response.addHeader("Access-Control-Allow-Headers", "Content-Type");
//        response.addHeader("Cache-Control", "private");
//
//        String reqUri = request.getRequestURI();
//        String serviceName = reqUri.substring(reqUri.lastIndexOf("/") + 1,
//                reqUri.length());
//                if (serviceName.equals("SOMETHING")) {
//
//                }
        
        String queryString = request.getQueryString() == null ? "" : "?" + request.getQueryString();
        
        String requisicao = "[" + new Date() + "][" + getClientIp(request) + "]" + "[" + request.getRequestURL().toString() + queryString + "]"; 
        log.info(requisicao);
        
        // salva log
        // requestLogRepository.save(requestLog);
        //telegramService.sendToChannelASync("287918", requestLog.toString());
        //System.out.println("######################################  Request Url: " + request.getRequestURL().toString() + "?" + request.getQueryString());
        //System.out.println("######################################  " + requisicao);

        // -------------------------------

        return super.preHandle(request, response, handler);

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
    
    
    private String getClientIp(HttpServletRequest request) {
        String remoteAddr = "";
        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }
        return remoteAddr;
    }
    
    
}