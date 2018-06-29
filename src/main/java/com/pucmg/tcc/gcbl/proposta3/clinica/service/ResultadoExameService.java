package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.ResultadoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ResultadoExameRepository;

@Service
public class ResultadoExameService{

    @Autowired
    protected ResultadoExameRepository repository;
    
    
    public void salvar(ResultadoExame item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public ResultadoExame findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<ResultadoExame> findAll() {
        return repository.findAll();
    }
    
    public List<ResultadoExame> findByPaciente(Paciente paciente) {
        return repository.findByPaciente(paciente);
    }    
    
}