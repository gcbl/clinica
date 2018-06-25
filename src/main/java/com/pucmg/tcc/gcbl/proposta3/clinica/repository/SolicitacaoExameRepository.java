package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;

@Repository
public interface SolicitacaoExameRepository extends JpaRepository<SolicitacaoExame, String> {

    public List<SolicitacaoExame> findByPaciente(Paciente paciente);

}