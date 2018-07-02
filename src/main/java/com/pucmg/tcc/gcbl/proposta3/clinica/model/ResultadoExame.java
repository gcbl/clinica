package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
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
@Table(name = "SC_RESULTADO_EXAME")
public class ResultadoExame extends BaseEntity implements HistoricoClinico {
    /*
     Laboratorio
     Responsavel Tecnico
     Data do exame
     */
	
	
    @NotNull(message = "*Por favor informe o paciente")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PACIENTE")
    private Paciente paciente;    

    //@NotEmpty(message = "Por favor informe nome do laboratório")
    @Column(name = "TX_LABORATORIO")
    private String laboratorio;

    //@NotEmpty(message = "Por favor informe nome do responsável técnico")
    @Column(name = "TX_RESPONSAVEL_TECNICO")
    private String responsavelTecnico;

    @Column(name = "DT_EXAME")
    @DateTimeFormat(pattern = "dd/MM/yyyy" )
    //@NotNull(message = "*Por favor informe a data que o exame foi feito")
    private Date dataExame;
    
    @Column(name = "LOB_ANEXOS")
    private byte[] anexos;

    @NotEmpty(message = "Por favor informe o resultado")
    @Column(name = "TX_RESULTADO")
    private String resultado;

    @NotNull(message = "Por favor informe se o resultado deve ser disponibilizado ao paciente")
    @Column(name = "IS_DISPONIBILIZADO")
    private boolean disponibilizadoPaciente;
    
//    @OneToOne(mappedBy="resultadoExame")
//    private SolicitacaoExame solicitacaoExame;
    
	@Override
	public LocalDateTime getDataHistorico() {
		return this.getDataCriacao();
	}

}
