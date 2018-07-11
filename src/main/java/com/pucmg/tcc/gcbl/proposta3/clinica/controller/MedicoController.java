package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;



@Controller
@RequestMapping("/privado/**")
public class MedicoController extends ModelController {
    
    private static Log log = LogFactory.getLog(MedicoController.class);
    
    @Autowired
    private MedicoService modelService;

    @Override
    protected Class<Medico> getModelClass() {
        return Medico.class;
    }    

    // -----------------------------------------------------------------------------------
    
    @RequestMapping(value={"/listar-medico"}, method = RequestMethod.GET)
    public String consultar(Model model){
        List<Medico> itemList = modelService.findAll();
        
        model.addAttribute("itemList", itemList);
        return getViewPath() + "listar";
    }
    
    @RequestMapping(value={"/incluir-medico"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
        
        model.addAttribute(getModelName(), new Medico());
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/incluir-medico"}, method = RequestMethod.POST)
    public String inserir(@Valid Medico item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {                         
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
        return consultar(model);
    }    

    @RequestMapping(value={"/excluir-medico"}, method = RequestMethod.GET)
    public String excluirGet(@RequestParam("id") String id, Model model, Locale locale){
        String mensagem = "";
        try{
            modelService.excluir(id);
            
            mensagem = messageSource.getMessage("formulario.operacao.exclusao.sucesso", new Object[]{ getModelName() }, locale);
            adicionarAlertaSuccess(model, mensagem);            
        }catch(EmptyResultDataAccessException erdae){
            mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
            adicionarAlertaWarning(model, mensagem);
        }catch(DataIntegrityViolationException dive){
            mensagem = messageSource.getMessage("formulario.operacao.exclusao.integridade", new Object[]{ getModelName() }, locale);
            adicionarAlertaWarning(model, mensagem);
        }catch(Throwable t){
            mensagem = messageSource.getMessage("formulario.operacao.falha", new Object[]{ getModelName(), t }, locale);
            adicionarAlertaWarning(model, mensagem);
        }
        return consultar(model);
    }
    

    @RequestMapping(value={"/editar-medico"}, method = RequestMethod.GET)
    public String editarForm(@RequestParam("id") String id, Model model, Locale locale, HttpServletRequest request){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_EDITAR);
        
        if( modelService.exists(id) ){
            model.addAttribute(getModelName(), modelService.findOne(id));
            
            // Seta na sessao o id do item que esta sendo editado para checagem posterior
            request.getSession().setAttribute(Constantes.ACAO_EDITAR, id);
            
            return getViewPath() + "incluirForm";
        }else{
            String mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
            adicionarAlertaWarning(model, mensagem);
            return consultar(model);
        }

            
        
        //return getViewPath() + "alterarForm"; 
    }
    
    @RequestMapping(value={"/editar-medico"}, method = RequestMethod.POST)
    public String editar(@Valid Medico item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {
        String mensagem = "";
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_EDITAR);
        
        if(result.hasErrors()){
            model.addAttribute(getModelName(), item);
            
            mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
            adicionarAlertaWarning(model, mensagem);
            return getViewPath() + "incluirForm";
        }
        
        
        // Obtem da sessao o id do item que esta sendo editado para batimento
        String itemId = (String) request.getSession().getAttribute(Constantes.ACAO_EDITAR);
        
        if(!itemId.equals(item.getId())){
            mensagem = messageSource.getMessage("formulario.operacao.alteracao.id-errado", null, locale);
            adicionarAlertaDanger(model, mensagem);
            return consultar(model);
        }
        
        try{
            modelService.salvar(item);
        }catch(DataIntegrityViolationException dive){
            mensagem = messageSource.getMessage("formulario.operacao.alteracao.login-ja-utilizado", new Object[]{ getModelName() }, locale);
            adicionarAlertaDanger(model, mensagem);
            return editarForm(item.getId(), model, locale, request);
        }
        
        mensagem = messageSource.getMessage("formulario.operacao.alteracao.sucesso", new Object[]{ getModelName() }, locale);
        adicionarAlertaSuccess(model, mensagem);
        
        return consultar(model);
    }    
    


}