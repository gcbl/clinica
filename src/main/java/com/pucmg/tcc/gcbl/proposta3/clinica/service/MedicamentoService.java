package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicamentoRepository;

//@Service("userService")
@Service
public class MedicamentoService{

	@Autowired
	protected MedicamentoRepository repository;
	
	
    public void salvar(Medicamento item) {
    	repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Medicamento findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Medicamento> findAll() {
    	return repository.findAll();
    }

    public List<Medicamento> findByNomeIgnoreCase(String nome){
        return repository.findByNomeGenericoContainingIgnoreCase(nome);
    }    

    
}