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

import com.pucmg.tcc.gcbl.proposta3.clinica.model.HistoricoClinico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.HistoricoClinicoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.PacienteService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;


@Controller
@RequestMapping("/privado/**")
public class PacienteController extends ModelController {
    
    private static Log log = LogFactory.getLog(PacienteController.class);
    
    @Autowired
    private PacienteService modelService;

    @Autowired
    private HistoricoClinicoService historicoClinicoService;

    
    @Override
    protected Class<Paciente> getModelClass() {
        return Paciente.class;
    }    

    // -----------------------------------------------------------------------------------
    
    @RequestMapping(value={"/listar-paciente"}, method = RequestMethod.GET)
    public String consultar(Model model){
        List<Paciente> itemList = modelService.findAll();
        
        model.addAttribute("itemList", itemList);
        return getViewPath() + "listar";
    }
    
    @RequestMapping(value={"/incluir-paciente"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
        
        model.addAttribute(getModelName(), new Paciente());
        return getViewPath() + "incluirForm";
    }
    
    @RequestMapping(value={"/incluir-paciente"}, method = RequestMethod.POST)
    public String inserir(@Valid Paciente item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {                         
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

    @RequestMapping(value={"/excluir-paciente"}, method = RequestMethod.GET)
    public String excluirGet(@RequestParam("id") String id, Model model, Locale locale){
        String mensagem = "";
        try{
            modelService.excluir(id);
            
            mensagem = messageSource.getMessage("formulario.operacao.exclusao.sucesso", new Object[]{ getModelName() }, locale);
            adicionarAlertaSuccess(model, mensagem);            
        }catch(Throwable t){
            mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
            adicionarAlertaWarning(model, mensagem);
        }
        return consultar(model);
    }
    

    @RequestMapping(value={"/editar-paciente"}, method = RequestMethod.GET)
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
    
    @RequestMapping(value={"/editar-paciente"}, method = RequestMethod.POST)
    public String editar(@Valid Paciente item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {
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
        
        modelService.salvar(item);
        
        mensagem = messageSource.getMessage("formulario.operacao.alteracao.sucesso", new Object[]{ getModelName() }, locale);
        adicionarAlertaSuccess(model, mensagem);
        
        return consultar(model);
    }    
    
    @RequestMapping(value={"/listar-historico-clinico-paciente-form"}, method = RequestMethod.GET)
    public String exibirHistoricoClinicoForm(Model model, Locale locale, HttpServletRequest request){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_LISTAR);
        
        return getViewPath() + "historicoClinicoForm";
    }

    
    @RequestMapping(value={"/listar-historico-clinico-paciente"}, method = RequestMethod.GET)
    public String exibirHistoricoClinicoGet(Model model, Locale locale, HttpServletRequest request){
        return exibirHistoricoClinico(model, locale, request);
    }
    
    @RequestMapping(value={"/listar-historico-clinico-paciente"}, method = RequestMethod.POST)
    public String exibirHistoricoClinico(Model model, Locale locale, HttpServletRequest request){
        
        String idPaciente = request.getParameter("idPaciente");
        
        if("".equals(idPaciente) || idPaciente == null){
            // TODO: Fazer o tratamento de erro corretamente usando os objetos do spring mVC
            model.addAttribute("pacienteVazio", true );
            return exibirHistoricoClinicoForm(model, locale, request);
        }else{
            model.addAttribute(Constantes.ACAO, Constantes.ACAO_LISTAR);
            if( modelService.exists(idPaciente) ){
                
                Paciente paciente = modelService.findOne(idPaciente);
                
                List<HistoricoClinico> historicoClinicoList = historicoClinicoService.getHistoricoClinico( paciente );
                
                //request.getSession().setAttribute("historicoClinicoList", historicoClinicoList);
                
                model.addAttribute("paciente", paciente );
                model.addAttribute("historicoClinicoList", historicoClinicoList );
                
                return getViewPath() + "historicoClinico";
            }else{
                String mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
                adicionarAlertaWarning(model, mensagem);
                return exibirHistoricoClinicoForm(model, locale, request);
            }
        }
        
        //return getViewPath() + "alterarForm"; 
    }

}