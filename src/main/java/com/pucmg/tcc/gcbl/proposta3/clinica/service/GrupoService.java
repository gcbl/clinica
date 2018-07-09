package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.GrupoRepository;

@Service
public class GrupoService{

	@Autowired
	protected GrupoRepository repository;
	
	
    public void salvar(Grupo item) {
    	repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Grupo findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Grupo> findAll() {
    	return repository.findAll();
    }

    
}