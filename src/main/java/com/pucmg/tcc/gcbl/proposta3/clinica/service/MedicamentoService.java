package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicamentoRepository;

//@Service("userService")
@Service
public class MedicamentoService{

	@Autowired
	protected MedicamentoRepository medicamentoRepository;
	
	
    public void salvarMedicamento(Medicamento medicamento) {
    	medicamentoRepository.save(medicamento);
    }

    public void excluir(String id) {
        medicamentoRepository.delete(id);
    }

    public boolean exists(String id) {
        return medicamentoRepository.exists(id);
    }
    
    public Medicamento findOne(String id) {
        return medicamentoRepository.findOne(id);
    }
    
    public List<Medicamento> findAll() {
    	return medicamentoRepository.findAll();
    }

    
}