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

    @RequestMapping(value={"/listarMedicamento"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medicamento> medicamentos = medicamentoService.findAll();
        model.addAttribute("medicamentos", medicamentos);
        return getViewPath() + "listar";
    }
    
    @RequestMapping(value={"/inserirMedicamento"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute("medicamento", new Medicamento());
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/inserirMedicamento"}, method = RequestMethod.POST)
    public String inserir(@Valid Medicamento medicamento, BindingResult result, Model model, HttpServletRequest request) {                         
        if(result.hasErrors()){
            model.addAttribute("medicamento", medicamento);
            return getViewPath() + "incluirForm";
        }
        
        medicamentoService.salvarMedicamento(medicamento);
        return consultar(model);
    }    

    @RequestMapping(value={"/excluirMedicamento"}, method = RequestMethod.GET)
    public String excluirGet(@RequestParam("id") long id, Model model){
        try{
            medicamentoService.excluir(id);
        }catch(Throwable t){
            System.out.println("nao achou");
        }
        return consultar(model);
    }
    

    @RequestMapping(value={"/editarMedicamento"}, method = RequestMethod.GET)
    public String alterarForm(@RequestParam("id") long id, Model model){
        Medicamento medicamento = medicamentoService.findOne(id);

        if(medicamento != null){
            model.addAttribute("medicamento", medicamento);
            return getViewPath() + "incluirForm";
        }else{
            System.out.println("nao achou");
            return consultar(model);
        }

            
        
        //return getViewPath() + "alterarForm"; 
    }
    
    @RequestMapping(value={"/editarMedicamento"}, method = RequestMethod.POST)
    public String alterar(Model model){
        return getViewPath() + "alterar";
    }    
    

    @Override
    protected Class<Medicamento> getModelClass() {
        return Medicamento.class;
    }    

}