package com.pucmg.tcc.gcbl.proposta3.clinica.service;

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

    public List<Agendamento> getAgendaMedico(Medico medico) {
        return repository.findByMedico(medico);
    }

    public List<Agendamento> getHorarioDisponivelList() {
        return repository.findByPacienteIsNull();
    }    
    
    public List<Agendamento> getHorarioDisponivelMedicoList(Medico medico) {
        return repository.findByMedicoAndPacienteIsNull(medico);
    }

    public List<Agendamento> getHorarioOcupadoMedicoList(Medico medico) {
        return repository.findByMedicoAndPacienteIsNotNull(medico);
    }
    
    public List<Agendamento> getHorarioOcupadoList() {
        return repository.findByMedicoIsNotNullAndPacienteIsNotNull();
    }
    
    
    public void salvar(Agendamento item) {
        repository.save(item);
    }
    
    public void salvar(List<Agendamento> agendamentos) {
        repository.save(agendamentos);
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