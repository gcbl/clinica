package com.pucmg.tcc.gcbl.proposta3.clinica.repository.security;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;

@Repository
public interface GrupoRepository extends JpaRepository<Grupo, String> {

    public List<Grupo> findByNome(String nome);
 
}

