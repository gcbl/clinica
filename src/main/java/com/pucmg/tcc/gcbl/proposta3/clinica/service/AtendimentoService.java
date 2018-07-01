package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Atendimento;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AtendimentoRepository;

@Service
public class AtendimentoService{

    @Autowired
    protected AtendimentoRepository repository;
    
    
    public void salvar(Atendimento item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Atendimento findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Atendimento> findAll() {
        return repository.findAll();
    }
    
    public List<Atendimento> findByPaciente(Paciente paciente) {
        return repository.findByPaciente(paciente);
    }    
    
}