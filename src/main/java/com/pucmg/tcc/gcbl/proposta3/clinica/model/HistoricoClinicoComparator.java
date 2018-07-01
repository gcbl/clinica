package com.pucmg.tcc.gcbl.proposta3.clinica.model;

import java.util.Comparator;

public class HistoricoClinicoComparator implements Comparator<HistoricoClinico> {
    
    public int compare(HistoricoClinico conta, HistoricoClinico outraConta) {
        // Ordem inversa. O historico é mostrado dos eventos mais recentes para os mais antigos
        return conta.getDataHistorico().compareTo( outraConta.getDataHistorico() );
    }
}
