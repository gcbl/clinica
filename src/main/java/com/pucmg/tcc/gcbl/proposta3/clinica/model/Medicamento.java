package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_MEDICAMENTO")
public class Medicamento extends BaseEntity {


    @Column(name = "NOME_GENERICO")
    @NotEmpty(message = "*Por favor informe o nome generico")
    private String nomeGenerico;

    @Column(name = "NOME_FABRICA")
    @NotEmpty(message = "*Por favor informe o nome de fabrica")
    private String nomeFabrica;

    @Column(name = "FABRICANTE")
    @NotEmpty(message = "*Por favor informe o fabricante")
    private String fabricante;

    @Column(name = "CONCENTRACAO_FORMA_FARMACEUTICA")
    @NotEmpty(message = "*Por favor informe a descricao")
    private String concentracaoFormaFarmaceutica;
	
//    @ManyToMany(mappedBy="medicamentos",
//                fetch=FetchType.LAZY,
//                cascade=CascadeType.REFRESH)
//    private Set<Receita> receitas = new HashSet<>();
    
}
