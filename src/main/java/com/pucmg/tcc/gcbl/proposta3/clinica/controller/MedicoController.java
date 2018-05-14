package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicoService;


@Controller
@RequestMapping("/privado/**")
public class MedicoController extends ModelController {
    
    private static final String MODEL = Medico.class.getSimpleName().toLowerCase();
    
    private static Log log = LogFactory.getLog(MedicoController.class);
    
    @Autowired
    private MedicoService medicoService;
    

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