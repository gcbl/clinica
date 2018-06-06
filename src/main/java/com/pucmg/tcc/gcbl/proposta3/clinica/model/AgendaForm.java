package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalTime;
import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AgendaForm  extends BaseEntity {

    @NotNull(message = "*Por favor informe a data de inicio")
    @DateTimeFormat(pattern = "dd/MM/yyyy" )
    @Future
    private Date dataInicio;

    @NotNull(message = "*Por favor informe a data de fim")
    @DateTimeFormat(pattern = "dd/MM/yyyy" )
    @Future
    private Date dataFim;
    
    @NotNull(message = "*Por favor informe a hora do inicio")
    private LocalTime horaInicio;
    
    @NotNull(message = "*Por favor informe a hora do fim")
    private LocalTime horaFim;

    @NotNull(message = "*Por favor informe a duração do atendimendo")
    @Range(min=10, max=60, message="A duração da consulta deve ser entre 10 e 60 minutos")
    private int duracao;
    
    @NotNull(message = "*Por favor informe o medico")
    private Medico medico;

}

