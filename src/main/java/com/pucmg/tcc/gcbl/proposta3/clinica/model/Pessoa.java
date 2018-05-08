package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.br.CPF;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@MappedSuperclass
public abstract class Pessoa extends BaseEntity {

    @Column(name = "NOME")
    @NotEmpty(message = "*Por favor informe o nome da pessoa")
    private String nome;

    @Column(name = "CPF")
    //@NotEmpty(message = "*Por favor informe o cpf")
    @CPF
    private String cpf;
    
    @Column(name = "DT_NASCIMENTO")
    //@NotEmpty(message = "*Por favor informe a data de nascimento")
    private Date dataNascimento;

    @Column(name = "ENDERECO")
    @NotEmpty(message = "*Por favor informe o endereco")
    private String endereco;
    
    
}
