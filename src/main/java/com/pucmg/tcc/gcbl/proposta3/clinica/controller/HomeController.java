package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.pucmg.tcc.gcbl.proposta3.clinica.service.TesteService;

@Controller
public class HomeController extends BaseController{
    
    @Autowired
    private TesteService testeService;
    
    
    @GetMapping("/")
    public String index() {
        return login();
    }
    
    @GetMapping("/login")
    public String login() {
        return "views/autenticacao/login";
    }

    @GetMapping("/privado/inicio")
    public String inicio(HttpServletRequest request, Principal principal) { // login com sucesso!
        setUsuarioLogado(request, principal);
        return "views/autenticacao/inicio";
    }
    
    @GetMapping("/privado/home")
    public String home(HttpServletRequest request, Principal principal) {
        testeService.popula();
        return inicio(request, principal);
    }    
    
    
}

//@Controller
//public class HomeController {
//
//    @GetMapping("/login")
//    public String login() {
//        //return "login"; // <<< Retorna a página de login
//        return "views/login/login";
//    }
//
//    @GetMapping("/")
//    public String index() {
//        //return "inicio";
//        return "views/login/home";
//    }
//
//}
