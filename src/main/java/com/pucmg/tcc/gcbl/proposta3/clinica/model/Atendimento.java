package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_ATENDIMENTO")
public class Atendimento extends BaseEntity implements HistoricoClinico {

      @NotNull(message = "*Por favor informe o paciente")
      @ManyToOne(fetch=FetchType.LAZY)
      @JoinColumn(name="ID_PACIENTE")
      private Paciente paciente;

      @NotNull(message = "*Por favor informe o médico")
      @ManyToOne(fetch=FetchType.LAZY)
      @JoinColumn(name="ID_MEDICO")
      private Medico medico;

      @NotEmpty(message = "*Por favor informe o conteúdo do atendimento")
      @Column(name = "CONTEUDO")
      private String conteudo;

	@Override
	public LocalDateTime getDataHistorico() {
		return this.getDataCriacao();
	}
	
}
