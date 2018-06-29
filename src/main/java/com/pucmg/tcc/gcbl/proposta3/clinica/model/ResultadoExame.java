package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
//@Entity
//@Table(name = "SC_RESULTADO_EXAME")
public class ResultadoExame extends BaseEntity {

    @Column(name = "LOB_ANEXOS")
    private byte[] anexos;

    @NotEmpty(message = "Por favor informe o resultado")
    @Column(name = "TX_RESULTADO")
    private String resultado;

    @NotNull(message = "Por favor informe se o resultado deve ser disponibilizado ao paciente")
    @Column(name = "BL_DISPONIBILIZADO")
    private boolean disponibilizadoPaciente;
    
//    @OneToOne(mappedBy="resultadoExame")
//    private SolicitacaoExame solicitacaoExame;
    
}
