package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;

@Data
@EqualsAndHashCode(callSuper = false)
//@ToString(callSuper = true)
@Entity
@Table(name = "SC_MEDICO")
public class Medico extends Usuario {

	@JsonIgnore
    // TODO: Ativar o unique=true e tratar quando for inserir um medico com o mesmo CRM
    @Column(name = "CRM", 
            nullable = false /*, unique=true */) // unique=true pra criar a constraint ao criar o banco sozinho. 
    @Digits(fraction=0, integer=10, message = "O CRM deve ser um número")
	@NotEmpty(message = "*Por favor informe o CRM do médico")
    private String crm;

	@JsonIgnore
    private String corCalendario;
    
}
