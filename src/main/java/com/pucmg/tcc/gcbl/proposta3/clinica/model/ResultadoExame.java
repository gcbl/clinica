package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_RESULTADO_EXAME")
public class ResultadoExame extends BaseEntity {


    @Column(name = "TX_RESULTADO")
    private String resultado;

    @Column(name = "LOB_ANEXOS")
    private byte[] anexos;

    @Column(name = "BL_PUBLICADO")
    private boolean publicado;
    
    
}
