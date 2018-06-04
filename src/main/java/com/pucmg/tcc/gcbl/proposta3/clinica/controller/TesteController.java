package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.service.TesteService;




@Controller
public class TesteController extends BaseController {
    
    private static Log log = LogFactory.getLog(TesteController.class);
    
    @Autowired
    private TesteService testeService;
    

    /**
     * TESTE
     * @param model
     * @return
     */
    @RequestMapping(value={"/privado/teste"}, method = RequestMethod.GET)
    public String testeWeb(Model model){
        testeService.popula();
        return "views/about";
    }
    


}