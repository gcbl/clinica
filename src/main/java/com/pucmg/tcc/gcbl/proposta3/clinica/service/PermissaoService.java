package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Permissao;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.PermissaoRepository;

@Service
public class PermissaoService{

	@Autowired
	protected PermissaoRepository repository;
	
	
    public void salvar(Permissao item) {
    	repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Permissao findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Permissao> findAll() {
    	return repository.findAll();
    }

    
}