package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;

@Service
public class MedicoService{

	@Autowired
	protected MedicoRepository repository;
	
	
    public void salvar(Medico medico) {
    	repository.save(medico);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Medico findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Medico> findAll() {
    	return repository.findAll();
    }

    
}