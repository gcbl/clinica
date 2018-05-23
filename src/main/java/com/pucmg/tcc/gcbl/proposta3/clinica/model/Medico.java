package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Digits;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "SC_MEDICO")
public class Medico extends Pessoa {

    // TODO: Ativar o unique=true e tratar quando for inserir um medico com o mesmo CRM
    @Column(name = "CRM" /*, unique=true */) // unique=true pra criar a constraint ao criar o banco sozinho. 
    @Digits(fraction=0, integer=10, message = "Por favor informe o número do CRM")
    private String crm;

    
}
