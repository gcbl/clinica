package com.pucmg.tcc.gcbl.proposta3.clinica.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "SC_PACIENTE")
public class Paciente extends Pessoa {

    @Column(name = "PLANO_SAUDE")
    // @NotEmpty(message = "*Por favor informe plano de saude")
    private String planoSaude;

    
//    @OneToMany(mappedBy = "paciente")
//    private List<Receita> receitas = new ArrayList<Receita>();
     
    
}
