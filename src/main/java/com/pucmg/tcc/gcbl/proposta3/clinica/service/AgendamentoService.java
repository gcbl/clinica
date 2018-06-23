package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AgendamentoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.StringUtils;

import lombok.NonNull;

@Service
public class AgendamentoService{

    @Autowired
	private AgendamentoRepository repository;

    public List<Agendamento> getAgendaMedico(Medico medico) {
        return repository.findByMedico(medico);
    }

    public List<Agendamento> getHorarioDisponivelList() {
        return repository.findByPacienteIsNull();
    }    

    public List<Agendamento> getHorarioDisponivelList(LocalDate dataInicio, LocalDate datafim) {
        // TODO: Producao: Limitar a distancia maxima entre uma data e outra
        return repository.findByPacienteIsNullAndDataBetween(dataInicio, datafim);
    }    
    
    
    public List<Agendamento> getHorarioDisponivelMedicoList(Medico medico) {
        return repository.findByMedicoAndPacienteIsNull(medico);
    }
    
    public List<Agendamento> getHorarioDisponivelMedicoList(Medico medico, LocalDate dataInicio, LocalDate datafim) {
        return repository.findByMedicoAndPacienteIsNullAndDataBetween(medico, dataInicio, datafim);
    }    

    public List<Agendamento> getHorarioOcupadoMedicoList(Medico medico) {
        return repository.findByMedicoAndPacienteIsNotNull(medico);
    }
    
    public List<Agendamento> getHorarioOcupadoList() {
        return repository.findByMedicoIsNotNullAndPacienteIsNotNull();
    }

    public List<Agendamento> getHorarioOcupadoList(LocalDate dataInicio, LocalDate datafim) {
        // TODO: Producao: Limitar a distancia maxima entre uma data e outra
        return repository.findByMedicoIsNotNullAndPacienteIsNotNull();
    }

    public List<Agendamento> getHorarioOcupadoList(Medico medico, LocalDate dataInicio, LocalDate datafim) {
        return repository.findByMedicoAndPacienteIsNotNullAndDataBetween(medico, dataInicio, datafim);
    }    
    
    
    public List<Agendamento> findByLikeDataHoraInicioHoraFim(Medico medico, String queryTerm) {
        queryTerm = StringUtils.removerAcentos(queryTerm);
        queryTerm = queryTerm.toUpperCase();
        queryTerm = queryTerm.replaceAll(" ", "%");
        
        String idMedico = medico == null ? "" : medico.getId();
        List<Agendamento> agendamentoList = null;
        
        agendamentoList = repository.findByLikeDataHoraInicioHoraFimNative(medico.getId(), queryTerm);
        
        //agendamentoList = repository.findByLikeDataHoraInicioHoraFimQL(medico, queryTerm);
        return agendamentoList;
    }

    public void preencherAgendamento(@NonNull Agendamento agendamento, @NonNull Paciente paciente) {
        // TODO: Fazer verificação de NULL 
        agendamento.setPaciente(paciente);
        salvar(agendamento);
    }
    
    public void liberarAgendamento(@NonNull Agendamento agendamento, Paciente paciente) {
        // TODO: Fazer verificacoes se o paciente liberado é o que estava marcado no agendamento
        agendamento.setPaciente(null);
        salvar(agendamento);
    }    
    
    //-------------
    
    
    public void salvar(Agendamento item) {
        repository.save(item);
    }
    
    public void salvar(List<Agendamento> agendamentos) {
        repository.save(agendamentos);
    }

    public void excluir(String id) {
        repository.delete(id);
    }

    public boolean exists(String id) {
        return repository.exists(id);
    }
    
    public Agendamento findOne(String id) {
        return repository.findOne(id);
    }
    
    public List<Agendamento> findAll() {
        return repository.findAll();
    }
    
    public List<Agendamento> findAll(Example<Agendamento> agendamentoExample) {
        return repository.findAll(agendamentoExample);
    }

    
}