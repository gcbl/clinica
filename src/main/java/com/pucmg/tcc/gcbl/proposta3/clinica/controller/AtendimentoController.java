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

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Atendimento;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.AtendimentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.AgendamentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;


@Controller
@RequestMapping("/privado/**")
public class AtendimentoController extends ModelController {
    
    private static Log log = LogFactory.getLog(AtendimentoController.class);
    
    @Autowired
    private AtendimentoService modelService;

    @Autowired
    private AgendamentoService agendamentoService;
    
    
    @Override
    protected Class<Atendimento> getModelClass() {
        return Atendimento.class;
    }    

    // -----------------------------------------------------------------------------------

    @RequestMapping(value={"/listar-atendimento"}, method = RequestMethod.GET)
    public String consultar(Model model){
        List<Atendimento> itemList = modelService.findAll();
        
        model.addAttribute("itemList", itemList);
        return getViewPath() + "listar";
    }
    
    @RequestMapping(value={"/incluir-atendimento"}, method = RequestMethod.GET)
    public String inserirForm(Model model){
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
        
        Atendimento atendimento = new Atendimento();
        atendimento.setMedico( getMedicoLogado() );
        
        
        model.addAttribute(getModelName(), atendimento);
        return getViewPath() + "incluirForm";
    }

    @RequestMapping(value={"/atender-paciente"}, method = RequestMethod.GET)
    public String atenderForm(@RequestParam("idAgendamento") String idAgendamento, Model model, Locale locale){
        
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
        
        
        if( agendamentoService.exists(idAgendamento) ){
            
            Agendamento agendamento = agendamentoService.findOne(idAgendamento);
            
            Atendimento atendimento = new Atendimento();
            atendimento.setMedico( agendamento.getMedico() );
            atendimento.setPaciente( agendamento.getPaciente() );

            model.addAttribute(getModelName(), atendimento);
            model.addAttribute("ATENDER", true); // Indica que está havendo um atendimento
            
            return getViewPath() + "incluirForm";
        }else{
            String mensagem = messageSource.getMessage("formulario.nao-encontrado", new Object[]{ getModelName() }, locale);
            adicionarAlertaWarning(model, mensagem);
            return "redirect:exibir-calendario-vagas-agendamento";
        }
        
//        
//        
//        
//        
//        
//        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);
//        
//        model.addAttribute(getModelName(), new Atendimento());
//        return getViewPath() + "incluirForm";
    }    
    
    @RequestMapping(value={"/incluir-atendimento"}, method = RequestMethod.POST)
    public String inserir(@Valid Atendimento item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {                         
        model.addAttribute(Constantes.ACAO, Constantes.ACAO_INCLUIR);

        if(result.hasErrors()){
            model.addAttribute(getModelName(), item);
            
            String mensagem = messageSource.getMessage("formulario.erros-de-validacao", null, locale);
            adicionarAlertaWarning(model, mensagem);
            return getViewPath() + "incluirForm";
        }
        
        //item.setId(null);
        modelService.salvar(item);
        
        String mensagemInclusao = messageSource.getMessage("formulario.operacao.inclusao.sucesso", new Object[]{ getModelName() }, locale);
        adicionarAlertaSuccess(model, mensagemInclusao);
        return consultar(model);
    }    

    @RequestMapping(value={"/excluir-atendimento"}, method = RequestMethod.GET)
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
    

    @RequestMapping(value={"/editar-atendimento"}, method = RequestMethod.GET)
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
    
    @RequestMapping(value={"/editar-atendimento"}, method = RequestMethod.POST)
    public String editar(@Valid Atendimento item, BindingResult result, Model model, HttpServletRequest request, Locale locale) {
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
    


}