package com.pucmg.tcc.gcbl.proposta3.clinica.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;


public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findByLogin(String login);
    
}