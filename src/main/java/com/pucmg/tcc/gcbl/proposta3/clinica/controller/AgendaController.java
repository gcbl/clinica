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

import com.pucmg.tcc.gcbl.proposta3.clinica.model.AgendaForm;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.AgendaService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;


@Controller
@RequestMapping("/privado/**")
public class AgendaController extends ModelController {
    
    private static Log log = LogFactory.getLog(AgendaController.class);
    
    @Autowired
    private AgendaService modelService;

    @Override
    protected Class<AgendaForm> getModelClass() {
        return AgendaForm.class;
    }    

    // -----------------------------------------------------------------------------------
    
    @RequestMapping(value={"/incluir-agenda"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
        
        model.addAttribute(getModelName(), new AgendaForm());
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/incluir-agenda"}, method = RequestMethod.POST)
    public String inserir(@Valid AgendaForm item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {                         
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);

        if(result.hasErrors()){
            model.addAttribute(getModelName(), item);
            
            String mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
            adicionarAlertaWarning(model, mensagem);
            return getViewPath() + "incluirForm";
        }
        
        modelService.salvar(item);
        
        String mensagemInclusao = messageSource.getMessage("formulario.operacao.inclusao.sucesso", new Object[]{ getModelName() }, locale);
        adicionarAlertaSuccess(model, mensagemInclusao);
        return inserirForm(model);
    }    

//    @RequestMapping(value={"/excluir-agenda"}, method = RequestMethod.GET)
//    public String excluirGet(@RequestParam("id") String id, Model model, Locale locale){
//        String mensagem = "";
//        try{
//            modelService.excluir(id);
//            
//            mensagem = messageSource.getMessage("formulario.operacao.exclusao.sucesso", new Object[]{ getModelName() }, locale);
//            adicionarAlertaSuccess(model, mensagem);            
//        }catch(Throwable t){
//            mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
//            adicionarAlertaWarning(model, mensagem);
//        }
//        return consultar(model);
//    }
//    
//
//    @RequestMapping(value={"/editar-agenda"}, method = RequestMethod.GET)
//    public String editarForm(@RequestParam("id") String id, Model model, Locale locale, HttpServletRequest request){
//        model.addAttribute(Constantes.ACAO, Constantes.ACAO_EDITAR);
//        
//        if( modelService.exists(id) ){
//            model.addAttribute(getModelName(), modelService.findOne(id));
//            
//            // Seta na sessao o id do item que esta sendo editado para checagem posterior
//            request.getSession().setAttribute(Constantes.ACAO_EDITAR, id);
//            
//            return getViewPath() + "incluirForm";
//        }else{
//            String mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
//            adicionarAlertaWarning(model, mensagem);
//            return consultar(model);
//        }
//
//            
//        
//        //return getViewPath() + "alterarForm"; 
//    }
//    
//    @RequestMapping(value={"/editar-agenda"}, method = RequestMethod.POST)
//    public String editar(@Valid AgendaForm item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {
//        String mensagem = "";
//        model.addAttribute(Constantes.ACAO, Constantes.ACAO_EDITAR);
//        
//        if(result.hasErrors()){
//            model.addAttribute(getModelName(), item);
//            
//            mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
//            adicionarAlertaWarning(model, mensagem);
//            return getViewPath() + "incluirForm";
//        }
//        
//        
//        // Obtem da sessao o id do item que esta sendo editado para batimento
//        String itemId = (String) request.getSession().getAttribute(Constantes.ACAO_EDITAR);
//        
//        if(!itemId.equals(item.getId())){
//            mensagem = messageSource.getMessage("formulario.operacao.alteracao.id-errado", null, locale);
//            adicionarAlertaDanger(model, mensagem);
//            return consultar(model);
//        }
//        
//        modelService.salvar(item);
//        
//        mensagem = messageSource.getMessage("formulario.operacao.alteracao.sucesso", new Object[]{ getModelName() }, locale);
//        adicionarAlertaSuccess(model, mensagem);
//        
//        return consultar(model);
//    }    
    


}