package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.ExameService;


@Controller
@RequestMapping("/privado/**")
public class ExameController extends ModelController {
    
    private static final String MODEL = Exame.class.getSimpleName().toLowerCase(); 

    
    private static Log log = LogFactory.getLog(ExameController.class);
    
    @Autowired
    private ExameService exameService;
    

    @RequestMapping(value={"/listarExame"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Exame> exames = exameService.findAll();
        model.addAttribute("exames", exames);
        return getViewPath() + "listar";
    }



    @Override
    public String getModel() {
        return MODEL;
    }    


}