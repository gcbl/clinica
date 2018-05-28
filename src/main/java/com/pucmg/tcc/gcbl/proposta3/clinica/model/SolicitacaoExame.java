package com.pucmg.tcc.gcbl.proposta3.clinica.model;

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

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_SOLICITACAO_EXAME")
public class SolicitacaoExame  extends BaseEntity {

    @Column(name = "DT_SOLICITACAO")
    @NotNull(message = "*Por favor informe a data de solicitacao")
    private Date dataSolicitacao;

    @NotNull(message = "*Por favor informe o paciente")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PACIENTE")
    private Paciente paciente;

    @NotNull(message = "*Por favor informe o medico")
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_MEDICO")
    private Medico medicoSolicitante;

    @Column(name = "OBSERVACAO")
    private String observacao;

    // Lista de exames 
    @ManyToMany(cascade = { CascadeType.REFRESH }, 
                fetch=FetchType.LAZY )
    @JoinTable(name = "SC_EXAME_SOLICITACAO_EXAME", 
               joinColumns = @JoinColumn(name = "ID_SOLICITACAO"), 
               inverseJoinColumns = @JoinColumn(name = "ID_EXAME"))
    private Set<Exame> exames = new HashSet<>();    

    
    
    
}

