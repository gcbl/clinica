package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Atendimento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;

@Repository
public interface AtendimentoRepository extends JpaRepository<Atendimento, String> {

    public List<Atendimento> findByPaciente(Paciente paciente);
    
}