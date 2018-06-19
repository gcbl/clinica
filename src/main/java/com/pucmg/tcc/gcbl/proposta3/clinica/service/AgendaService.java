package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.util.DataUtils;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.AgendaForm;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AgendamentoRepository;

@Service
public class AgendaService{

    @Autowired
    protected AgendamentoRepository repository;
    
    public void criarVagas(Medico medico,
                           LocalDate dataInicio,
                           LocalDate dataFim,
                           int horaInicio,
                           int horaFim,
                           int duracao) {

        // Apagando todos os agendamentos daquele medico no periodo
        List<Agendamento> agendamentos = repository.findByMedicoAndDataBetween(medico, dataInicio, dataFim);
        repository.delete(agendamentos);
        
        List<Agendamento> vagas = new ArrayList<Agendamento>();
        
        LocalDate data = dataInicio;
        while(data.isBefore(dataFim)){
            
            boolean isWeekend = DataUtils.isWeekend(data);
            if ( !isWeekend ){
                    LocalTime horaInicioLocalTime = LocalTime.of(horaInicio, 0);
                    LocalTime horaFimLocalTime = LocalTime.of(horaFim, 0);
                    
                    LocalTime horaInicioTemp = horaInicioLocalTime;
                    LocalTime horaFimTemp = horaInicioTemp.plusMinutes(duracao);
                    
                    while( !horaFimTemp.isAfter(horaFimLocalTime) ){
                        
                        Agendamento agendamento = new Agendamento();
                        agendamento.setMedico(medico);
                        agendamento.setData(data);
        
                        agendamento.setHoraInicio( horaInicioTemp );
                        agendamento.setHoraFim( horaFimTemp );
                        
                        vagas.add(agendamento);
        
                        horaInicioTemp = horaFimTemp;
                        horaFimTemp = horaFimTemp.plusMinutes(duracao);
                    }
            }
            
            data = data.plusDays(1);
        }
        
        
        repository.save(vagas);
        
    }    

    public void excluir(String id) {
        repository.delete(id);
    }

    
}