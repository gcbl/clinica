package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SEC_PERMISSAO")
public class Permissao extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String nome;
    
    @ManyToMany(mappedBy = "permissoes")
    private List<Usuario> usuarios;
    
    @ManyToMany(mappedBy = "permissoes")
    private List<Grupo> grupos;    
    
}