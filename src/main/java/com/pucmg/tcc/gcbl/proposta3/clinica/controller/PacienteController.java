package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.PacienteService;


@Controller
@RequestMapping("/privado/**")
public class PacienteController extends ModelController {
    
    private static final String MODEL = Paciente.class.getSimpleName().toLowerCase();
    
    private static Log log = LogFactory.getLog(PacienteController.class);
    
    @Autowired
    private PacienteService pacienteService;
    

    @RequestMapping(value={"/listarPaciente"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Paciente> pacientes = pacienteService.findAll();
        model.addAttribute("pacientes", pacientes);
        return getViewPath() + "listar";
    }


    @Override
    public String getModel() {
        return MODEL;
    }      
    
}