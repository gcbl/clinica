package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Permissao;
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
    
    public List<Grupo> findByNome(String nome){
        return repository.findByNome(nome);
    }

    public void adicionarUsuario(Grupo grupo, Usuario usuario) {
        grupo.getUsuarios().add(usuario);
        this.salvar(grupo);
    }
    
    public void adicionarUsuario(Grupo grupo, List<? extends Usuario> usuarios) {
        grupo.getUsuarios().addAll(usuarios);
        this.salvar(grupo);
    }
    
    public void adicionarUsuario(List<Grupo> grupos, List<? extends Usuario> usuarios) {
        for (Grupo grupo : grupos) {
            adicionarUsuario(grupo, usuarios);
        }
    }
    
    public void removerPermissoes(Grupo grupo){
        grupo.setPermissoes(new ArrayList<Permissao>());
        salvar(grupo);
    }

    public void removerUsuarios(Grupo grupo){
        grupo.setUsuarios(new ArrayList<Usuario>());
        salvar(grupo);
    }

    
}