package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.HistoricoClinico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.HistoricoClinicoComparator;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;

@Service
public class HistoricoClinicoService{

    @Autowired
    private ReceitaService receitaService;

    @Autowired
    private SolicitacaoExameService solicitacaoExameService;
    
    
    public List<HistoricoClinico> getHistoricoClinico(Paciente paciente){
        List<? extends HistoricoClinico> receitaList = receitaService.findByPaciente(paciente);
        List<? extends HistoricoClinico> solicitacaoExameList = solicitacaoExameService.findByPaciente(paciente);
        
        List<HistoricoClinico> historicoClinicoList = new ArrayList<HistoricoClinico>();
        
        historicoClinicoList.addAll(receitaList);
        historicoClinicoList.addAll(solicitacaoExameList);
        
        Collections.sort(historicoClinicoList, new HistoricoClinicoComparator());
        
        
        return historicoClinicoList;
        
    }

    
}