package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ReceitaRepository;

@Service
public class ResultadoExameService{

    @Autowired
    protected ReceitaRepository repository;
    
    
    public void salvar(Receita item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Receita findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Receita> findAll() {
        return repository.findAll();
    }
    
    public List<Receita> findByPaciente(Paciente paciente) {
        return repository.findByPaciente(paciente);
    }    
    
}