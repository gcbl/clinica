package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;

@Service
public class PacienteService{

    @Autowired
    protected PacienteRepository repository;
    
    
    public void salvar(Paciente item) {
        repository.save(item);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Paciente findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Paciente> findAll() {
        return repository.findAll();
    }
    
    public List<Paciente> findByNomeContaining(String nome){
        return repository.findByNomeContaining(nome);
    }

    
}