package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class FullCalendarEvent {
    
    @JsonIgnore
    private Agendamento agendamento;
    
    private FullCalendarEvent(Agendamento _agendamento){
        this.agendamento = _agendamento;
    }
    
    
    public static List<FullCalendarEvent> toFullCalendarEventList(List<Agendamento> agendamentoList){
        List<FullCalendarEvent> eventList = new ArrayList<FullCalendarEvent>( agendamentoList.size() );
        for (Agendamento agendamento : agendamentoList) {
            FullCalendarEvent event = new FullCalendarEvent(agendamento);
            eventList.add(event);
        }
        return eventList;
    }

    public String getTitle(){
        String title = "";
        if(agendamento.getPaciente() != null){
            title = agendamento.getPaciente().getNome();
//            if(agendamento.getMedico() != null){
//                title += "   [Dr(a). " + agendamento.getMedico().getNome() + "]"; 
//            }
        }else{
            title = "vago";
        }
        return title;
    }
    
    public String getStart(){
        LocalDateTime localDateTimeInicio = LocalDateTime.of(agendamento.getData(), agendamento.getHoraInicio());
        return localDateTimeInicio.toString();
    }
    
    public String getEnd(){
        LocalDateTime localDateTimeFim = LocalDateTime.of(agendamento.getData(), agendamento.getHoraFim());
        return localDateTimeFim.toString();
    }

    public String getMedico(){
        String medico = "";
        if(agendamento.getMedico() != null){
            medico = agendamento.getMedico().getNome();
        }
        return medico;
    }
    
    public String getPaciente(){
        String paciente = "";
        if(agendamento.getPaciente() != null){
            paciente = agendamento.getPaciente().getNome();
        }
        return paciente;
    }
    
    public String getColor(){
        String corMedico = "";
        if(agendamento.getMedico() != null){
            corMedico = agendamento.getMedico().getCorCalendario();
        }
        return corMedico;
    }
    
}

