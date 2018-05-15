package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;

@Service
public class MedicoService{

	@Autowired
	protected MedicoRepository medicoRepository;
	
    public List<Medico> findAll() {
    	return medicoRepository.findAll();
    }
    
    public Medico save(Medico medico) {
        return medicoRepository.save(medico);
    }

}