package com.pucmg.tcc.gcbl.proposta3.clinica.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;


@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, String> {

    Usuario findByLogin(String login);
    
}