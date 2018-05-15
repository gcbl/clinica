package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "SC_MEDICO")
public class Medico extends Pessoa {

    @Column(name = "CRM", unique=true) // unique=true pra criar a constraint ao criar o banco sozinho 
    @NotEmpty(message = "*Por favor informe o CRM")
    private String crm;

    
}
