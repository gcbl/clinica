package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MarcacaoConsultaForm  extends BaseEntity {

    @NotNull(message = "*Por favor informe o medico")
    private Medico medico;

    @NotNull(message = "*Por favor informe o medico")
    private Paciente paciente;

    @NotNull(message = "*Por favor informe o agendamento")
    private Agendamento agendamento;
    
    
}


