package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;

@Repository
public interface AgendamentoRepository extends JpaRepository<Agendamento, String> {
    
    public List<Agendamento> findByMedico(Medico medico);

    // Vagas disponiveis de qualquer medico
    public List<Agendamento> findByPacienteIsNull();
    
    
    // Vagas disponiveis para o médico
    public List<Agendamento> findByMedicoAndPacienteIsNull(Medico medico);
    
    // Vagas preenchidas
    public List<Agendamento> findByMedicoAndPacienteIsNotNull(Medico medico);
    public List<Agendamento> findByMedicoIsNotNullAndPacienteIsNotNull();
    
}