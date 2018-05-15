package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.br.CPF;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

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
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    //@NotEmpty(message = "*Por favor informe a data de nascimento")
    private Date dataNascimento;

    @Column(name = "ENDERECO")
    //@NotEmpty(message = "*Por favor informe o endereco")
    private String endereco;
    
    @Column(name = "BAIRRO")
    //@NotEmpty(message = "*Por favor informe o endereco")
    private String bairro;    
    
    @Column(name = "CEP")
    //@NotEmpty(message = "*Por favor informe o CEP")
    private String cep;

    @Column(name = "CIDADE")
    //@NotEmpty(message = "*Por favor informe a cidade")
    private String cidade;

    @Column(name = "ESTADO")
    //@NotEmpty(message = "*Por favor informe o estado")
    private String estado;
    
    
}
