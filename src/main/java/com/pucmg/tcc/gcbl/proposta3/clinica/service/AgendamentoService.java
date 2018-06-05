package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AgendamentoRepository;

@Service
public class AgendamentoService{

    @Autowired
	private AgendamentoRepository repository;

    public void criarVagas(LocalDate dateInicio, LocalDate dataFim, Medico medico) {
        List<Agendamento> vagas = new ArrayList<Agendamento>();
        
        LocalDate data = dateInicio;
        while(data.isBefore(dataFim)){
            Agendamento agendamento = new Agendamento();
            agendamento.setMedico(medico);
            agendamento.setData(data);
            
            agendamento.setHoraInicio( LocalTime.of(8, 0) );
            agendamento.setHoraFim( LocalTime.of(9, 0) );

            vagas.add(agendamento);
            
            data = data.plusDays(1);
        }
        
        
        repository.save(vagas);
        
    }

    public List<Agendamento> getAgendaMedico(Medico medico) {
        return repository.findByMedico(medico);
    }

    public List<Agendamento> getHorarioDisponivelMedico(Medico medico) {
        return repository.findByMedicoAndPacienteIsNull(medico);
    }

    public List<Agendamento> getHorariosOcupadosMedico(Medico medico) {
        return repository.findByMedicoAndPacienteIsNotNull(medico);
    }
    
    
    public void salvar(Agendamento item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Agendamento findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Agendamento> findAll() {
        return repository.findAll();
    }

    
}