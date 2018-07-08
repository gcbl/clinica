package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Pessoa;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SEC_USUARIO")
@Inheritance(
	    strategy = InheritanceType.JOINED
)
public class Usuario extends Pessoa implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String login;
    private String senha;
//    private boolean ativo;
    
    @ManyToMany
    private List<Grupo> grupos;
    
    @ManyToMany
    private List<Permissao> permissoes;

}
