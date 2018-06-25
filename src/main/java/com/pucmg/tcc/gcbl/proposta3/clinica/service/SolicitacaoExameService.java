package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.SolicitacaoExameRepository;

@Service
public class SolicitacaoExameService{

    @Autowired
    protected SolicitacaoExameRepository repository;
    
    
    public void salvar(SolicitacaoExame item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public SolicitacaoExame findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<SolicitacaoExame> findAll() {
        return repository.findAll();
    }

    public List<SolicitacaoExame> findByPaciente(Paciente paciente) {
        return repository.findByPaciente(paciente);
    }

    
}