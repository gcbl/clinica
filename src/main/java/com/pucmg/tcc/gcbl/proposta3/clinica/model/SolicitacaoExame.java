package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDateTime;
import java.util.Date;
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
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SOLICITACAO_EXAME")
public class SolicitacaoExame extends BaseEntity implements HistoricoClinico{

    @Column(name = "DT_SOLICITACAO")
    @DateTimeFormat(pattern = "dd/MM/yyyy" )
    @NotNull(message = "*Por favor informe a data de solicitação")
    private Date dataSolicitacao;

    @NotNull(message = "*Por favor informe o paciente")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PACIENTE")
    private Paciente paciente;

    @NotNull(message = "*Por favor informe o médico")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_MEDICO")
    private Medico medicoSolicitante;

    @Column(name = "OBSERVACAO")
    //@NotEmpty(message = "*Por favor informe a observacao da solicitação")
    private String observacao;

    // Lista de exames 
    @NotEmpty(message = "*Por favor informe os exames a serem solicitados")
    @ManyToMany(cascade = { CascadeType.REFRESH }, 
                fetch=FetchType.LAZY )
    @JoinTable(name = "SC_EXAME_SOLICITACAO_EXAME", 
               joinColumns = @JoinColumn(name = "ID_SOLICITACAO"), 
               inverseJoinColumns = @JoinColumn(name = "ID_EXAME"))
    private Set<Exame> exames = new HashSet<>();

	@Override
	public LocalDateTime getDataHistorico() {
		return this.getDataCriacao();
	}

    
}

