package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class UsuarioSistema extends User {

    private static final long serialVersionUID = 1L;
    
    private Usuario usuario;
    
    
    public UsuarioSistema(Usuario usuario, String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        
        this.usuario = usuario;
    }
    
    public String getNome() {
        return getUsuario().getNome();
    }
}