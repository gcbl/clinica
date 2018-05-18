package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;




@Controller
@RequestMapping("/privado/**")
public class MedicamentoController extends ModelController {
    
    private static Log log = LogFactory.getLog(MedicamentoController.class);
    
    @Autowired
    private MedicamentoService medicamentoService;

    @RequestMapping(value={"/listar-medicamento"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medicamento> medicamentos = medicamentoService.findAll();
        model.addAttribute("medicamentos", medicamentos);
        return getViewPath() + "listar";
    }
    
    @RequestMapping(value={"/incluir-medicamento"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute("acao", "incluir");
        
        model.addAttribute("medicamento", new Medicamento());
        
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/incluir-medicamento"}, method = RequestMethod.POST)
    public String inserir(@Valid Medicamento medicamento, BindingResult result, Model model, HttpServletRequest request) {                         
        if(result.hasErrors()){
            model.addAttribute("medicamento", medicamento);
            return getViewPath() + "incluirForm";
        }
        
        medicamentoService.salvarMedicamento(medicamento);
        return consultar(model);
    }    

    @RequestMapping(value={"/excluir-medicamento"}, method = RequestMethod.GET)
    public String excluirGet(@RequestParam("id") long id, Model model){
        try{
            medicamentoService.excluir(id);
        }catch(Throwable t){
            System.out.println("nao achou");
        }
        return consultar(model);
    }
    

    @RequestMapping(value={"/editar-medicamento"}, method = RequestMethod.GET)
    public String editarForm(@RequestParam("id") long id, Model model){
        model.addAttribute("acao", "editar");
        if( medicamentoService.exists(id) ){
            model.addAttribute("medicamento", medicamentoService.findOne(id));
            return getViewPath() + "incluirForm";
        }else{
            System.out.println("nao achou");
            return consultar(model);
        }

            
        
        //return getViewPath() + "alterarForm"; 
    }
    
    @RequestMapping(value={"/editar-medicamento"}, method = RequestMethod.POST)
    public String editar(@Valid Medicamento medicamento, BindingResult result, Model model, HttpServletRequest request) {
        model.addAttribute("acao", "editar");
        if(result.hasErrors()){
            model.addAttribute("medicamento", medicamento);
            return getViewPath() + "incluirForm";
        }
        
        medicamentoService.salvarMedicamento(medicamento);
        return consultar(model);
    }    
    

    @Override
    protected Class<Medicamento> getModelClass() {
        return Medicamento.class;
    }    

}