package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;

//@Service("userService")
@Service
public class ExameService{

	@Autowired
	protected ExameRepository exameRepository;
	
    public List<Exame> findAll() {
    	return exameRepository.findAll();
    }

}