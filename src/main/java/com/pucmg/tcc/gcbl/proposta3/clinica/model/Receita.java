package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_RECEITA")
public class Receita extends BaseEntity {


      @NotNull(message = "*Por favor informe o paciente")
      @ManyToOne(fetch=FetchType.LAZY)
      @JoinColumn(name="ID_PACIENTE")
      private Paciente paciente;

      @NotNull(message = "*Por favor informe o medico")
      @ManyToOne(fetch=FetchType.LAZY)
      @JoinColumn(name="ID_MEDICO")
      private Medico medico;

      // Lista de medicamentos
      
      @NotEmpty(message = "*Por favor informe o texto da receita")
      @Column(name = "CONTEUDO")
      private String conteudo;
      
      //@NotEmpty(message = "*Por favor informe os medicamentos da receita")
      //@Size(min=1, message = "*Por favor informe os medicamentos da receita")
      @NotEmpty(message = "*Por favor informe os medicamentos da receita")
      @ManyToMany(cascade = { CascadeType.REFRESH }, 
                  fetch=FetchType.LAZY )
      @JoinTable(name = "SC_RECEITA_MEDICAMENTO", 
                 joinColumns = @JoinColumn(name = "ID_RECEITA"), 
                 inverseJoinColumns = @JoinColumn(name = "ID_MEDICAMENTO"))
      private Set<Medicamento> medicamentos = new HashSet<>();
	
}
