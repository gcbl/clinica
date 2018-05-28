package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;

@Repository
public interface MedicamentoRepository extends JpaRepository<Medicamento, String> {

    public List<Medicamento> findByNomeContainingIgnoreCase(String nome);    
    
}