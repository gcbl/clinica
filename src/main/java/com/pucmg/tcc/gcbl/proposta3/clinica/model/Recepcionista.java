package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_RECEPCIONISTA")
public class Recepcionista extends Usuario{

    @Column(name = "MATRICULA",
    		nullable = false)
    @NotEmpty(message = "*Por favor informe a matricula")
    private String matricula;

}
