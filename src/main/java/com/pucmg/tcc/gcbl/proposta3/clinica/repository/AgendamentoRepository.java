package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;

@Repository
public interface AgendamentoRepository extends JpaRepository<Agendamento, String> {
    
/*

select  * from sc_agendamento 
where ID_MEDICO = '16'
and (   TO_CHAR(dt_agendamento, 'dd/mm/yyyy') || ' DE ' || hora_inicio || ' AS ' || hora_fim)  like '%14/%'  
*/    
    public static final String QUERY_SEARCH_HORARIOS = "select * from sc_agendamento " +  
                                                       "where ID_MEDICO = :idMedico " +
                                                       "and ID_PACIENTE IS NULL " +
                                                       "and ( TO_CHAR(dt_agendamento, 'dd/mm/yyyy') || ' DE ' || hora_inicio || ' AS ' || hora_fim)  like %:searchString% ";

    
    @Query(value = AgendamentoRepository.QUERY_SEARCH_HORARIOS, nativeQuery = true)
    public List<Agendamento> findByLikeDataHoraInicioHoraFimNative(@Param("idMedico") String idMedico, @Param("searchString") String searchString);    

    @Query("select agendamento from Agendamento agendamento where agendamento.medico = :medico and concat( data, ' DE ', trim(horaInicio), ' AS ', trim(horaFim)) like %:searchString%")
    public List<Agendamento> findByLikeDataHoraInicioHoraFimQL(@Param("medico") Medico medico, @Param("searchString") String searchString);    
    
    public List<Agendamento> findByMedico(Medico medico);

    // Vagas disponiveis de qualquer medico
    public List<Agendamento> findByPacienteIsNull();
    
    
    // Vagas disponiveis para o médico
    public List<Agendamento> findByMedicoAndPacienteIsNull(Medico medico);
    
    // Vagas preenchidas
    public List<Agendamento> findByMedicoAndPacienteIsNotNull(Medico medico);
    public List<Agendamento> findByMedicoIsNotNullAndPacienteIsNotNull();
    
}