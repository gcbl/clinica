package com.pucmg.tcc.gcbl.proposta3.clinica.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Recepcionista;

@Repository
public interface RecepcionistaRepository extends JpaRepository<Recepcionista, String> {

}