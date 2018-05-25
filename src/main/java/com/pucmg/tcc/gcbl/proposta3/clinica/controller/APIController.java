package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.ExameService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.PacienteService;


@Controller
@RequestMapping("/privado/api/**")
public class APIController extends BaseController {
    
    private static Log log = LogFactory.getLog(APIController.class);
    
    @Autowired
    private ExameService exameService;

    @Autowired
    private PacienteService pacienteService;
    
    @Autowired
    private MedicoService medicoService;    
    

    // -----------------------------------------------------------------------------------
    
    @ResponseBody
    @RequestMapping(value={"/listar-exame-json"}, method = RequestMethod.GET)
    public List<Exame> listarExameJson(@RequestParam("q") String q){
        List<Exame> itemList = exameService.findByNomeContainingIgnoreCase(q);
        return itemList;
    }    

    @ResponseBody
    @RequestMapping(value={"/listar-all-exame-json"}, method = RequestMethod.GET)
    public List<Exame> listarExameJson(){
        List<Exame> itemList = exameService.findAll();
        return itemList;
    }    
    
    @ResponseBody
    @RequestMapping(value={"/listar-paciente-json"}, method = RequestMethod.GET)
    public List<Paciente> listarPacienteJson(@RequestParam("q") String q){
        List<Paciente> itemList = pacienteService.findByNomeContainingIgnoreCase(q);
        return itemList;
    }
    
    @ResponseBody
    @RequestMapping(value={"/listar-all-paciente-json"}, method = RequestMethod.GET)
    public List<Paciente> listarPacienteJson(){
        List<Paciente> itemList = pacienteService.findAll();
        return itemList;
    }    
    
    @ResponseBody
    @RequestMapping(value={"/listar-medico-json"}, method = RequestMethod.GET)
    public List<Medico> listarMedicoJson(@RequestParam("q") String q){
        List<Medico> itemList = medicoService.findByNomeContainingIgnoreCase(q);
        return itemList;
    }
    
    @ResponseBody
    @RequestMapping(value={"/listar-all-medico-json"}, method = RequestMethod.GET)
    public List<Medico> listarMedicoJson(){
        List<Medico> itemList = medicoService.findAll();
        return itemList;
    }       
    

}