package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.br.CPF;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.StringUtils;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@MappedSuperclass
public abstract class Pessoa extends BaseEntity implements Comparable<Pessoa> {

    @Column(name = "NOME")
    @NotEmpty(message = "*Por favor informe o nome")
    private String nome;

    //TODO: Ativar o unique=true e tratar quando for inserir um mesmo CPF
    @Column(name = "CPF" /*, unique=true */)
    @CPF(message = "Por favor informe um CPF válido")
    @JsonIgnore
    private String cpf;
    
    @Column(name = "DT_NASCIMENTO")
    @DateTimeFormat(pattern = "dd/MM/yyyy" )
    @NotNull(message = "Por favor informe a data de nascimento")
    @Past(message = "A data de nascimento deve ser no passado")
    @JsonIgnore
    private Date dataNascimento;

    @Column(name = "ENDERECO")
    //@NotEmpty(message = "*Por favor informe o endereco")
    @JsonIgnore
    private String endereco;
    
    @Column(name = "BAIRRO")
    //@NotEmpty(message = "*Por favor informe o endereco")
    @JsonIgnore
    private String bairro;    
    
    @Column(name = "CEP")
    //@NotEmpty(message = "*Por favor informe o CEP")
    @JsonIgnore
    private String cep;

    @Column(name = "CIDADE")
    //@NotEmpty(message = "*Por favor informe a cidade")
    @JsonIgnore
    private String cidade;

    @Column(name = "ESTADO")
    //@NotEmpty(message = "*Por favor informe o estado")
    @JsonIgnore
    private String estado;
    
    public String getPrimeiroNome(){
        return getNome().split(" ")[0];
    }
    
    @Override
    public int compareTo(Pessoa o) {
        int resultado = StringUtils.removerAcentos(nome).compareTo( StringUtils.removerAcentos(o.getNome()) );
        return resultado;
        //return nome.compareTo(o.getNome());
    }
    
}
