package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "SC_SEC_GRUPO")
public class Grupo extends BaseEntity implements Serializable {

    @Column(name = "NOME")
    @NotEmpty(message = "*Por favor informe o nome do grupo")
    private String nome;

    @Column(name = "DESCRICAO")
    @NotEmpty(message = "*Por favor informe a descricao do grupo")    
    private String descricao;
    
    @ManyToMany(mappedBy = "grupos", cascade={CascadeType.PERSIST}, fetch=FetchType.LAZY)
    @JsonIgnore
    private List<Usuario> usuarios;
    
    @ManyToMany(cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Permissao> permissoes;
    
}
