package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.UsuarioRepository;

@Service
public class UsuarioService{

	@Autowired
	protected UsuarioRepository repository;
	
	
    public void salvar(Usuario item) {
    	repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Usuario findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Usuario> findAll() {
    	return repository.findAll();
    }

	public List<Usuario> findByNomeContainingIgnoreCaseOrderByNomeAsc(String nome) {
		return repository.findByNomeContainingIgnoreCaseOrderByNomeAsc(nome);
	}

    
}