package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@MappedSuperclass
public abstract class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private String id;
    
//    @JsonIgnore    
//    @Column(name = "is_active")
//    private boolean isActive = true;

    
    @JsonIgnore
    @Column(name = "DT_CRIACAO")
    private LocalDateTime dataCriacao;

    @JsonIgnore
    @Column(name = "DT_ULTIMA_ATUALIZACAO")
    private LocalDateTime dataAtualizacao;
    
    
    @PrePersist
    public void prePersist() {
        if(dataCriacao == null){
            dataCriacao = LocalDateTime.now();
        }
        //createdBy = LoggedUser.get();
    }
    
    @PreUpdate
    public void preUpdate() {
        if(dataCriacao == null){
            dataCriacao = LocalDateTime.now();
        }

    	dataAtualizacao = LocalDateTime.now();
        //createdBy = LoggedUser.get();
    }
    

}
