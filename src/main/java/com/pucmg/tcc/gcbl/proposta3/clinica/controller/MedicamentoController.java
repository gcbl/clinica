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
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;




@Controller
@RequestMapping("/privado/**")
public class MedicamentoController extends BaseController {
    
    private static final String VIEW_PATH = "views/medicamento/" + "medicamento-"; 
    
    private static Log log = LogFactory.getLog(MedicamentoController.class);
    
    @Autowired
    private MedicamentoService medicamentoService;

    @RequestMapping(value={"/listaMedicamento"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medicamento> medicamentos = medicamentoService.findAll();
        model.addAttribute("medicamentos", medicamentos);
        return VIEW_PATH + "listar";
    }

    @RequestMapping(value={"/incluirMedicamento"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        return VIEW_PATH + "incluirForm";
    }
    	
    public String inserir(Model model){
        return VIEW_PATH +  "incluir";
    }

    public String alterarForm(Model model){
        return VIEW_PATH + "alterarForm"; 
    }
    
    public String alterar(Model model){
        return VIEW_PATH + "alterar";
    }    
    
    public String excluir(Model model){
        return VIEW_PATH + "excluir";
    }

}