package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
    
    @Column(name = "LOGIN", nullable=false, unique=true)
    @NotEmpty(message = "*Por favor informe o login")
    private String login;
    
    @Column(name = "SENHA", nullable=false, unique=false)
    @NotEmpty(message = "*Por favor informe a senha")
    private String senha;
//    private boolean ativo;
    
    @ManyToMany(cascade = {CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinTable(name = "SC_SEC_USUARIO_GRUPO", 
               joinColumns = @JoinColumn(name = "ID_USUARIO"), 
               inverseJoinColumns = @JoinColumn(name = "ID_GRUPO"))
    @JsonIgnore
    private List<Grupo> grupos;

//    @ManyToMany
//    private List<Permissao> permissoes;

//	@Override
//	public String toString() {
//		return super.toString().replace( this.getSenha(), "[PROTEGIDO]");
//	}
    

}
