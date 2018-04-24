package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.UserService;




@Controller
public class LoginController {
    
    private static Log log = LogFactory.getLog(LoginController.class);
    
    @Autowired
    private UserService userService;


    /**
     * Login
     * @param model
     * @return
     */
    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public String  login(Model model){
        return "views/login";
    }
    
    /**
     * Login sem sucesso
     * @param model
     * @return
     */
    @RequestMapping(value={"/loginErrado"}, method = RequestMethod.GET)
    public String loginErrado(Model model){
        model.addAttribute("loginErrado", true);
        return "views/login";
       
    }
        
    /**
     * Login com sucesso
     * @return
     */
    @RequestMapping(value="/privado/inicio", method = RequestMethod.GET)
    public ModelAndView inicio(){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("userName", "Welcome " + user.getName() + " " + user.getLastName() + " (" + user.getEmail() + ")");
        modelAndView.addObject("adminMessage","Content Available Only for Users with Admin Role");
        modelAndView.setViewName("views/home");
        return modelAndView;
    }

    @RequestMapping(value="/privado/home", method = RequestMethod.GET)
    public ModelAndView home(){
        return inicio();
    }
    

}