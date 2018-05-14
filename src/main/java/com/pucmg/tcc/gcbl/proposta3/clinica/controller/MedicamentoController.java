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
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;




@Controller
@RequestMapping("/privado/**")
public class MedicamentoController extends ModelController {
    
    private static final String MODEL = Medicamento.class.getSimpleName().toLowerCase(); 
    
    private static Log log = LogFactory.getLog(MedicamentoController.class);
    
    @Autowired
    private MedicamentoService medicamentoService;

    @RequestMapping(value={"/listarMedicamento"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medicamento> medicamentos = medicamentoService.findAll();
        model.addAttribute("medicamentos", medicamentos);
        return getViewPath() + "listar";
    }

    @RequestMapping(value={"/incluirMedicamento"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/incluirMedicamento"}, method = RequestMethod.POST)
    public String inserir(Model model){
        return getViewPath() +  "incluir";
    }

    @RequestMapping(value={"/alterarMedicamento"}, method = RequestMethod.GET)
    public String alterarForm(Model model){
        return getViewPath() + "alterarForm"; 
    }
    
    @RequestMapping(value={"/alterarMedicamento"}, method = RequestMethod.POST)
    public String alterar(Model model){
        return getViewPath() + "alterar";
    }    
    
    @RequestMapping(value={"/excluirMedicamento"}, method = RequestMethod.POST)
    public String excluir(Model model){
        return getViewPath() + "excluir";
    }
    
    @Override
    public String getModel() {
        return MODEL;
    }    

}