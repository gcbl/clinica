package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SOLICITACAO_EXAME")
public class SolicitacaoExame  extends BaseEntity {

    @Column(name = "DT_SOLICITACAO")
    @NotEmpty(message = "*Por favor informe a data de solicitacao")
    private String dataSolicitacao;

//    private Exame exame;
//    private Medico medicoSolicitante;
//    private Paciente paciente;

    
}

