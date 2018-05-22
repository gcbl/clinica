package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;
import java.util.Locale;

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
    private MedicamentoService modelService;

    @RequestMapping(value={"/listar-medicamento"}, method = RequestMethod.GET)
    public String consultar(Model model){
    	List<Medicamento> medicamentos = modelService.findAll();
    	
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
    public String inserir(@Valid Medicamento medicamento, BindingResult result, Model model, HttpServletRequest request, Locale locale) {                         
    	model.addAttribute("acao", "incluir");

    	if(result.hasErrors()){
        	model.addAttribute("medicamento", medicamento);
        	
        	String mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
        	adicionarAlertaWarning(model, mensagem);
            return getViewPath() + "incluirForm";
        }
        
    	
        modelService.salvarMedicamento(medicamento);
        
        String welcome = messageSource.getMessage("welcome.message", new Object[]{"John Doe"}, locale);
        model.addAttribute("message", welcome);
        
        adicionarAlertaSucesso(model, "Inclusão de " + getModelName() + " executada com sucesso");        
        return consultar(model);
    }    

    @RequestMapping(value={"/excluir-medicamento"}, method = RequestMethod.GET)
    public String excluirGet(@RequestParam("id") long id, Model model){
        try{
            modelService.excluir(id);
            adicionarAlertaSucesso(model, "Exclusão de " + getModelName() + " executada com sucesso");
        }catch(Throwable t){
            System.out.println("nao achou");
            adicionarAlertaWarning(model, getModelName()  + " não encontrado");
        }
        return consultar(model);
    }
    

    @RequestMapping(value={"/editar-medicamento"}, method = RequestMethod.GET)
    public String editarForm(@RequestParam("id") long id, Model model){
        model.addAttribute("acao", "editar");
        if( modelService.exists(id) ){
            model.addAttribute("medicamento", modelService.findOne(id));
            return getViewPath() + "incluirForm";
        }else{
            adicionarAlertaWarning(model, getModelName()  + " não encontrado");
            return consultar(model);
        }

            
        
        //return getViewPath() + "alterarForm"; 
    }
    
    @RequestMapping(value={"/editar-medicamento"}, method = RequestMethod.POST)
    public String editar(@Valid Medicamento medicamento, BindingResult result, Model model, HttpServletRequest request, Locale locale) {
        model.addAttribute("acao", "editar");
        if(result.hasErrors()){
            model.addAttribute("medicamento", medicamento);
            
            String mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
            adicionarAlertaWarning(model, mensagem);
            return getViewPath() + "incluirForm";
        }
        
        modelService.salvarMedicamento(medicamento);
        adicionarAlertaSucesso(model, "Alteração de " + getModelName() + " executada com sucesso");        
        return consultar(model);
    }    
    

    @Override
    protected Class<Medicamento> getModelClass() {
        return Medicamento.class;
    }    

}