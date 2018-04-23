package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;

public class RequestInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String versao = (String)request.getSession().getAttribute("versao");
        
        if(versao == null){ // "" ou null
            request.getSession().setAttribute("versao", Constantes.VERSAO_DO_SISTEMA);
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
        
        return super.preHandle(request, response, handler);

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
    
}