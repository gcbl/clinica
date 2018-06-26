package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;

@Repository
public interface AgendamentoRepository extends JpaRepository<Agendamento, String> {

    // TODO: Corrigir o JPQL abaixo
    public static final String QUERY_SEARCH_HORARIOS = "select * from sc_agendamento " +  
                                                       "where ID_MEDICO = :idMedico " +
                                                       "and ID_PACIENTE IS NULL " +
                                                    // "and dt_agendamento > SYSDATE " +
                                                       "and ( TO_CHAR(dt_agendamento, 'dd/mm/yyyy') || ' DE ' || hora_inicio || ' AS ' || hora_fim)  like %:searchString% ";

    @Query(value = AgendamentoRepository.QUERY_SEARCH_HORARIOS, nativeQuery = true)
    public List<Agendamento> findByLikeDataHoraInicioHoraFimNative(@Param("idMedico") String idMedico, @Param("searchString") String searchString);    

//    // TODO: Formatar a data para dd/mm/yyyy pra poder funcionar a contento.
//    @Query("select agendamento from Agendamento agendamento where agendamento.medico = :medico and concat( data, ' DE ', trim(horaInicio), ' AS ', trim(horaFim)) like %:searchString%")
//    public List<Agendamento> findByLikeDataHoraInicioHoraFimQL(@Param("medico") Medico medico, @Param("searchString") String searchString);    
    
    // -------------------------------------------------------
    public List<Agendamento> findByMedico(Medico medico);

    public List<Agendamento> findByMedicoAndDataBetween(Medico medico, LocalDate dataInicio, LocalDate datafim);
    
    
    // Vagas disponiveis para o médico
    public List<Agendamento> findByMedicoAndPacienteIsNull(Medico medico);
    public List<Agendamento> findByMedicoAndPacienteIsNullAndDataBetween(Medico medico, LocalDate dataInicio, LocalDate datafim);
    
    // Vagas preenchidas para o medico
    public List<Agendamento> findByMedicoAndPacienteIsNotNull(Medico medico);
    public List<Agendamento> findByMedicoAndPacienteIsNotNullAndDataBetween(Medico medico, LocalDate dataInicio, LocalDate datafim);

    // Todas as vagas disponiveis de qualquer medico
    public List<Agendamento> findByPacienteIsNull();
    public List<Agendamento> findByPacienteIsNullAndDataBetween(LocalDate dataInicio, LocalDate datafim);

    // Todas as vagas preenchidas 
    public List<Agendamento> findByMedicoIsNotNullAndPacienteIsNotNull();

    // Todas as vagas preenchidas 
    public List<Agendamento> findByMedicoIsNotNullAndPacienteIsNotNullAndDataBetween(LocalDate dataInicio, LocalDate datafim);
    
    // Horarios do paciente
    public List<Agendamento> findByPaciente(Paciente paciente);
    
}