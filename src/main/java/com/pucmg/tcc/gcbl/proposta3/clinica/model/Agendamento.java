package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_AGENDAMENTO")
public class Agendamento  extends BaseEntity {

    @Column(name = "DT_AGENDAMENTO")
    @NotNull(message = "*Por favor informe a data")
    private LocalDate data;

    // @Column(name = "HORA_INICIO", columnDefinition = "varchar(8)")
    @Column(name = "HORA_INICIO")
    @NotNull(message = "*Por favor informe a hora do inicio")
    private LocalTime horaInicio;
    
    //@Column(name = "HORA_FIM", columnDefinition = "varchar(8)")
    @Column(name = "HORA_FIM")
    @NotNull(message = "*Por favor informe a hora do fim")
    private LocalTime horaFim;

    
    /**
     * 
     * "O sistema deverá gerenciar a marcação de consultas dos pacientes de acordo com as agendas dos médicos. 
     *  O sistema deve prover opções de marcar, pesquisar e cancelar, além de registro do histórico das consultas 
     *  visando identificar estatísticas de atendimentos."
     * 
     */
    // Medico obrigatorio!
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @NotNull(message = "*Por favor informe o medico")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_MEDICO")
    private Medico medico;

    // @NotNull(message = "*Por favor informe o paciente")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PACIENTE")
    private Paciente paciente;
    
}

