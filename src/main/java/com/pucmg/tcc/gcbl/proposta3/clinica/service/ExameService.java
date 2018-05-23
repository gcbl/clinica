package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;

@Service
public class ExameService{

    @Autowired
    protected ExameRepository repository;
    
    
    public void salvar(Exame item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Exame findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Exame> findAll() {
        return repository.findAll();
    }

    
}