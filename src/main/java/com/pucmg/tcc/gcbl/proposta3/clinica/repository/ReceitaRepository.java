package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;

@Repository
public interface ReceitaRepository extends JpaRepository<Receita, String> {

    public List<Receita> findByPaciente(Paciente paciente);
    
}