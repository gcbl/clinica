package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Recepcionista;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.RecepcionistaRepository;



@Service
public class RecepcionistaService{

    @Autowired
    protected RecepcionistaRepository repository;
    
    
    public void salvar(Recepcionista item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Recepcionista findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Recepcionista> findAll() {
        return repository.findAll();
    }

    
}