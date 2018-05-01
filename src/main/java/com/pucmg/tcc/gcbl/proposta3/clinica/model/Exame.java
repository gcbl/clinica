package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "SC_EXAME")
public class Exame extends BaseEntity {

	// http://www.unimedpelotas.com.br/downloads/tiss/download.php?arquivo=ExamesLaboratoriais.xls

	/**
	 * Nomeclatura usual
	 */
    @Column(name = "NOME")
    @NotEmpty(message = "*Por favor informe o nome do exame")
    private String nome;

    /**
     * Descricao Tabela TUSS
     */
    @Column(name = "DESCRICAO")
    @NotEmpty(message = "*Por favor informe a descricao do exame")
    private String descricao;

}
