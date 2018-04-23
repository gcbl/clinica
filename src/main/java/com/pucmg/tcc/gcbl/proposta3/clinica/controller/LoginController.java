package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.UserService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;




@Controller
public class LoginController {
    
    private static Log log = LogFactory.getLog(LoginController.class);
    
    @Autowired
    private UserService userService;

    
    @RequestMapping(value="/publico/teste", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        // Estado do sistema
        model.addAttribute("RUNNING", "" );
        model.addAttribute( "PAUSED", "" );
        
        Date date = new Date();
        model.addAttribute("dataHora", date );
        return "views/home";
    }    
    
    @RequestMapping(value="/privado", method = RequestMethod.GET)
    public String privado(){
        
        
        log.debug("HOME privado pela url");
        
        //return modelAndView;
        return "views/home";
    }
        
    // =========================================================================
    
    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public String  login(Model model){
        return "views/login";
    }
    
    @RequestMapping(value={"/loginErrado"}, method = RequestMethod.GET)
    public String loginErrado(Model model){
        model.addAttribute("loginErrado", true);
        return "views/login";
       
    }
        
    
    
    @RequestMapping(value="/registration", method = RequestMethod.GET)
    public ModelAndView registration(){
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }
    
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult, HttpServletResponse response, String email, String password) {
        ModelAndView modelAndView = new ModelAndView();
        
        User userForm = new User();
        userForm.setEmail(email);
        userForm.setPassword(password);
        
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        } else {
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("registration");
            
        }
        return modelAndView;
    }
    
    @RequestMapping(value="/admin/home", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByEmail(auth.getName());
        modelAndView.addObject("userName", "Welcome " + user.getName() + " " + user.getLastName() + " (" + user.getEmail() + ")");
        modelAndView.addObject("adminMessage","Content Available Only for Users with Admin Role");
        modelAndView.setViewName("admin/home");
        return modelAndView;
    }
    

}