package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
public abstract class Usuario extends Pessoa implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @Column(name = "LOGIN", nullable=false, unique=true)
    @NotEmpty(message = "*Por favor informe o login")
    private String login;
    
    @Column(name = "SENHA", nullable=false, unique=false)
    @NotEmpty(message = "*Por favor informe a senha")
    @JsonIgnore
    private String senha;

    @Column(name = "PRIMEIRO_LOGIN")
    private Boolean primeiroLogin;
    
    @ManyToMany(mappedBy = "usuarios", cascade={CascadeType.MERGE}, fetch=FetchType.LAZY)
    @JsonIgnore
    private List<Grupo> grupos;

    
    public String getTipo(){
       return this.getClass().getSimpleName();
    }
    
//    @ManyToMany
//    private List<Permissao> permissoes;

//	@Override
//	public String toString() {
//		return super.toString().replace( this.getSenha(), "[PROTEGIDO]");
//	}
    
}
