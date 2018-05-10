package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;

@Service
public class PacienteService{

	@Autowired
	protected PacienteRepository pacienteRepository;
	
    public List<Paciente> findAll() {
    	return pacienteRepository.findAll();
    }

}