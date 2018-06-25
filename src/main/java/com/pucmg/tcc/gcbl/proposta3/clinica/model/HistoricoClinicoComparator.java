package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.util.Comparator;

public class HistoricoClinicoComparator implements Comparator<HistoricoClinico> {
    
    public int compare(HistoricoClinico conta, HistoricoClinico outraConta) {
        return outraConta.getDataCriacao().compareTo(conta.getDataCriacao());
    }
}
