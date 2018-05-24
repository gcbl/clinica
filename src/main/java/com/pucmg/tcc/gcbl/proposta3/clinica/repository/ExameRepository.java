package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;

@Repository
public interface ExameRepository extends JpaRepository<Exame, String> {
    
    public List<Exame> findByNomeContainingIgnoreCase(String nome);
    
}