package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
public class AgendaForm  extends BaseEntity {

    @NotNull(message = "*Por favor informe a data de inicio")
    private LocalDate dataInicio;

    @NotNull(message = "*Por favor informe a data de FIM")
    private LocalDate dataFim;
    
    @NotNull(message = "*Por favor informe a hora do inicio")
    private LocalTime horaInicio;
    
    @NotNull(message = "*Por favor informe a hora do fim")
    private LocalTime horaFim;

    @NotNull(message = "*Por favor informe a duração do atendimendo")
    private LocalTime duração;
    
    @NotNull(message = "*Por favor informe o medico")
    private Medico medico;

}

