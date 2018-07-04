package com.pucmg.tcc.gcbl.proposta3.clinica.repository.security;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Permissao;


public interface PermissaoRepository extends JpaRepository<Permissao, Long> {
    
    List<Permissao> findByGruposIn(Grupo grupo);

}