package com.pucmg.tcc.gcbl.proposta3.clinica.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;


public interface GrupoRepossitory extends JpaRepository<Grupo, Long> {
    
    //List<Grupo> findByUsuariosIn(Usuario usuario);

}