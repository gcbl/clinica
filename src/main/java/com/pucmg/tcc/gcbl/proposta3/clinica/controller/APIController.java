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

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.FullCalendarEvent;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.AgendamentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.ExameService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.PacienteService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;


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

    @Autowired
    private MedicamentoService medicamentoService;    

    @Autowired
    private AgendamentoService agendamentoService;    
    

    // -----------------------------------------------------------------------------------
    
    @ResponseBody
    @RequestMapping(value={"/listar-exame-json"}, method = RequestMethod.GET)
    public List<Exame> listarExameJson(@RequestParam( Constantes.PARAMETER_QUERY_SEARCH ) String q){
        List<Exame> itemList = exameService.findByNomeContainingIgnoreCaseOrderByNomeAsc(q);
        return itemList;
    }    

    
    @ResponseBody
    @RequestMapping(value={"/listar-paciente-json"}, method = RequestMethod.GET)
    public List<Paciente> listarPacienteJson(@RequestParam( Constantes.PARAMETER_QUERY_SEARCH ) String q){
        List<Paciente> itemList = pacienteService.findByNomeContainingIgnoreCaseOrderByNomeAsc(q);
        return itemList;
    }
    
    
    @ResponseBody
    @RequestMapping(value={"/listar-medico-json"}, method = RequestMethod.GET)
    public List<Medico> listarMedicoJson(@RequestParam( Constantes.PARAMETER_QUERY_SEARCH ) String q){
        List<Medico> itemList = medicoService.findByNomeContainingIgnoreCaseOrderByNomeAsc(q);
        return itemList;
    }
    
    @ResponseBody
    @RequestMapping(value={"/listar-medicamento-json"}, method = RequestMethod.GET)
    public List<Medicamento> listarMedicamentoJson(@RequestParam( Constantes.PARAMETER_QUERY_SEARCH ) String q){
        List<Medicamento> itemList = medicamentoService.findByNomeIgnoreCase(q);
        return itemList;
    }
    
    @ResponseBody
    @RequestMapping(value={"/fullcalendar-listar-horario-ocupado-json"}, method = RequestMethod.GET)
    public List<FullCalendarEvent> listarHorariosOcupadosFullCalendarJson(@RequestParam( Constantes.PARAMETER_START_DATE ) String start, 
                                                              @RequestParam( Constantes.PARAMETER_END_DATE   ) String end,
                                                              @RequestParam( "idMedico"                      ) String idMedico){
        
        
        Medico medico = medicoService.findOne(idMedico);
        List<Agendamento> agendamentoList;
        if(medico == null){
            agendamentoList = agendamentoService.getHorarioOcupadoList();
        }else{
            agendamentoList = agendamentoService.getHorarioOcupadoMedicoList(medico);    
        }
        
        List<FullCalendarEvent> eventList = FullCalendarEvent.toFullCalendarEventList(agendamentoList);
        
        return eventList;
    }
    
    @ResponseBody
    @RequestMapping(value={"/fullcalendar-listar-horario-vago-json"}, method = RequestMethod.GET)
    public List<FullCalendarEvent> listarHorariosVagosFullCalendarJson(@RequestParam( Constantes.PARAMETER_START_DATE ) String start, 
                                                           @RequestParam( Constantes.PARAMETER_END_DATE   ) String end,
                                                           @RequestParam( "idMedico"                      ) String idMedico ){
        Medico medico = medicoService.findOne(idMedico);
        List<Agendamento> agendamentoList;
        if(medico == null){
            agendamentoList = agendamentoService.getHorarioDisponivelList();
        }else{
            agendamentoList = agendamentoService.getHorarioDisponivelMedicoList(medico);    
        }
        
        List<FullCalendarEvent> eventList = FullCalendarEvent.toFullCalendarEventList(agendamentoList);
        
        return eventList;
    }      

    @ResponseBody
    @RequestMapping(value={"/listar-horario-vago-json"}, method = RequestMethod.GET)
    public List<Agendamento> listarHorariosVagosJson(@RequestParam( "idMedico" ) String idMedico,
                                                     @RequestParam( Constantes.PARAMETER_QUERY_SEARCH ) String queryTerm ){
        Medico medico = medicoService.findOne(idMedico);
        List<Agendamento> agendamentoList;
        
        agendamentoList = agendamentoService.findByLikeDataHoraInicioHoraFim(medico, queryTerm);
        
        // Se vazio preenche com *todos os valores > hoje* pra ajudar o usuario
        if(agendamentoList.isEmpty()){
            if(medico == null){
                agendamentoList = agendamentoService.getHorarioDisponivelList();
            }else{
                agendamentoList = agendamentoService.getHorarioDisponivelMedicoList(medico);    
            }
        }
        
        
        return agendamentoList;
    }      
    
    @ResponseBody
    @RequestMapping(value={"/marcar-horario-ajax-json"}, method = RequestMethod.POST)
    public Agendamento marcarHorarioJson(@RequestParam( "idAgendamento" ) String idAgendamento,
                                         @RequestParam(    "idPaciente" ) String idPaciente ){
        // TODO: Tratar excecao de parametros vazios
        Agendamento agendamento = agendamentoService.findOne(idAgendamento);
        Paciente paciente = pacienteService.findOne(idPaciente);
        
        agendamento.setPaciente(paciente);
        
        agendamentoService.salvar(agendamento);
        
        return agendamento;
    }      
    
    @ResponseBody
    @RequestMapping(value={"/desmarcar-horario-ajax-json"}, method = RequestMethod.POST)
    public Agendamento desmarcarHorarioJson(@RequestParam( "idAgendamento" ) String idAgendamento,
                                            @RequestParam(    "idPaciente" ) String idPaciente ){
        // TODO: Tratar excecao de parametros vazios
        Agendamento agendamento = agendamentoService.findOne(idAgendamento);
        Paciente paciente = pacienteService.findOne(idPaciente);
        
        agendamentoService.liberarAgendamento(agendamento, paciente);

        return agendamento;
    }      
    // -------------------------

    @ResponseBody
    @RequestMapping(value={"/listar-all-exame-json"}, method = RequestMethod.GET)
    public List<Exame> listarExameJson(){
        List<Exame> itemList = exameService.findAll();
        return itemList;
    }    

    
    @ResponseBody
    @RequestMapping(value={"/listar-all-paciente-json"}, method = RequestMethod.GET)
    public List<Paciente> listarPacienteJson(){
        List<Paciente> itemList = pacienteService.findAll();
        return itemList;
    }    
    
    
    @ResponseBody
    @RequestMapping(value={"/listar-all-medico-json"}, method = RequestMethod.GET)
    public List<Medico> listarMedicoJson(){
        List<Medico> itemList = medicoService.findAll();
        return itemList;
    }       
    

}