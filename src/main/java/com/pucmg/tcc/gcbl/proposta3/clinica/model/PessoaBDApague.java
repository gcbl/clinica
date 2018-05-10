package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import java.time.LocalDate;
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
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "TEMP_PESSOA")
public class PessoaBDApague extends BaseEntity {

    @Column(name = "NOME")
    private String nome;

    @Column(name = "CPF")
    @CPF
    private String cpf;
    
    @Column(name = "DT_NASCIMENTO")
    private LocalDate dataNascimento;

    @Column(name = "ENDERECO")
    private String endereco;

    @Column(name = "BAIRRO")
    private String bairro;
    
    @Column(name = "CEP")
    private String cep;

    @Column(name = "CIDADE")
    private String cidade;

    @Column(name = "ESTADO")
    private String estado;
    
    
}
