package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_AGENDAMENTO")
public class Agendamento  extends BaseEntity {

    @Column(name = "DT_AGENDAMENTO")
    @NotNull(message = "*Por favor informe a data")
    private Date data;

    @Column(name = "HORA_INICIO", columnDefinition = "varchar(8)")
    @NotNull(message = "*Por favor informe a hora do inicio")
    private LocalTime horaInicio;
    
    @Column(name = "HORA_FIM", columnDefinition = "varchar(8)")
    @NotNull(message = "*Por favor informe a hora do fim")
    private LocalTime horaFim;

    
    @NotNull(message = "*Por favor informe o paciente")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PACIENTE")
    private Paciente paciente;

    // Medico opcional
    //@NotNull(message = "*Por favor informe o medico")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_MEDICO")
    private Medico medico;

}

