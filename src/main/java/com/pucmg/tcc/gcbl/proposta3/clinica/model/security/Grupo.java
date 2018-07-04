package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SEC_GRUPO")
public class Grupo extends BaseEntity implements Serializable {

    private String nome;
    
    private String descricao;
    
    @ManyToMany(mappedBy = "grupos")
    private List<Usuario> usuarios;
    
    @ManyToMany
    private List<Permissao> permissoes;
    
}
