package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicoService;


@Controller
@RequestMapping("/privado/**")
public class MedicoController extends ModelController {
    
    private static final String MODEL = Medico.class.getSimpleName().toLowerCase();
    
    private static Log log = LogFactory.getLog(MedicoController.class);
    
    @Autowired
    private MedicoService medicoService;
    
    @RequestMapping(value={"/medicos"}, method = RequestMethod.GET)
    public String tableEditGet(@ModelAttribute("medico")  Medico medico, @RequestParam Map<String,String> allRequestParams, ModelMap model){
        System.out.println("teste");
        return null;
    }

    @RequestMapping(value={"/medicos"}, method = RequestMethod.POST)
    public String tableEditPost(@ModelAttribute("medico") @Valid Medico medico, @RequestParam Map<String,String> allRequestParams, ModelMap model){
        System.out.println("teste");
        System.out.println(medico);
        medicoService.save(medico);
        return null;
    }

    @RequestMapping(value={"/medicos2"}, method = RequestMethod.GET)
    public String tableEditGet2(@ModelAttribute("medico") Medico medico, @RequestParam Map<String,String> allRequestParams, ModelMap model){
        System.out.println("teste");
        return null;
    }
    
    @RequestMapping(value={"/medicos2"}, method = RequestMethod.POST)
    public String tableEditPost2(@ModelAttribute("medico") Medico medico, @RequestParam Map<String,String> allRequestParams, ModelMap model){
        System.out.println("teste");
        return null;
    }    
    

    @RequestMapping(value={"/listarMedico"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medico> medicos = medicoService.findAll();
        model.addAttribute("medicos", medicos);
        return getViewPath() + "listar";
    }


    @Override
    public String getModel() {
        return MODEL;
    }      
    
}