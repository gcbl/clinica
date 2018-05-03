package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_RECEITA")
public class Receita extends BaseEntity {


      @NotNull(message = "*Por favor informe o paciente")
      @ManyToOne(fetch=FetchType.LAZY)
      private Paciente paciente;

      @NotNull(message = "*Por favor informe o medico")
      @ManyToOne(fetch=FetchType.LAZY)
      private Medico medico;
      
//    @NotEmpty(message = "*Por favor informe o medicamento")
//    private List<Medicamento> medicamentos;

    
//    @NotEmpty(message = "*Por favor informe o medicamento")
//    private List<Medicamento> medicamentos;

	
}
