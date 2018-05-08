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
@Table(name = "SC_RECEPCIONISTA")
public class Recepcionista extends Pessoa {

    @Column(name = "MATRICULA")
    @NotEmpty(message = "*Por favor informe a matricula")
    private String matricula;

}
