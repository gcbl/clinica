package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_PACIENTE")
public class Paciente extends Pessoa {

    @Column(name = "PLANO_SAUDE")
    // @NotEmpty(message = "*Por favor informe plano de saude")
    private String planoSaude;

    
//    @OneToMany(mappedBy = "paciente")
//    private List<Receita> receitas = new ArrayList<Receita>();
     
    
}
