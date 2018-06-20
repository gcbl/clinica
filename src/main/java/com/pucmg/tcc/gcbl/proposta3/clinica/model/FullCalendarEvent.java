package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class FullCalendarEvent {
    private static final String COR_HORARIO_VAGO = "#FFFFFF";
    
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

    public boolean isVago(){
        return (agendamento.getPaciente() == null) ? true : false; 
    }
    
    public String getTitle(){
        String title = "";
        if(isVago()){
            title = "vago";
//            if(agendamento.getMedico() != null){
//                title += "   [Dr(a). " + agendamento.getMedico().getNome() + "]"; 
//            }
        }else{
            title = agendamento.getPaciente().getNome();
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
    
    public String getHorarioCompleto(){
        LocalDate localDate = agendamento.getData();
        LocalTime localTimeInicio = agendamento.getHoraInicio();
        LocalTime localTimeFim = agendamento.getHoraFim();
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String dataStr = localDate.format(formatter);
        //String horarioCompletoInicioStr = localDate.format(formatterInicio);
        
        return dataStr + " " + localTimeInicio +  " às " + localTimeFim;
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
        if(!isVago()){
            paciente = agendamento.getPaciente().getNome();
        }
        return paciente;
    }
    
    public String getidPaciente(){
        return isVago() ? "" : agendamento.getPaciente().getId();
    }    
    
    public String getColor(){
        String cor = COR_HORARIO_VAGO;
        if(agendamento.getMedico() != null){
            cor = agendamento.getMedico().getCorCalendario();
        }
//        if(!isVago()){
//            if(agendamento.getMedico() != null){
//                cor = agendamento.getMedico().getCorCalendario();
//            }
//        }
        return cor;
    }
    
    public String getTextColor(){
        return isVago() ? "white" : "black";
    }    

    public String getId(){
      return agendamento.getId();
    }       
    
//    public String getUrl(){
//        return "editar-agendamento?id=" + agendamento.getId();
//    }    
    
}

