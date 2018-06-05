package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AgendamentoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ReceitaRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.SolicitacaoExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.DataUtils;

@Service
public class TesteService{
    
    private static Log log = LogFactory.getLog(TesteService.class);
    
    @Autowired
    private MedicamentoService medicamentoService;

    @Autowired
    private PacienteRepository pacienteRepository;
    
    @Autowired
    private ReceitaRepository receitaRepository;

    @Autowired
    private MedicoRepository medicoRepository;
    
    @Autowired
    private ExameRepository exameRepository;
    
    @Autowired
    private SolicitacaoExameRepository solicitacaoExameRepository;

    @Autowired
    private AgendamentoRepository agendamentoRepository;
    
    @Autowired
    private AgendaService agendaService;

    
    public void popula(){
        User userForm = new User();
        userForm.setEmail("teste@teste.com");
        userForm.setPassword("teste");
        userForm.setLastName("last name");
        userForm.setName("name");
        //userService.saveUser(userForm);
        
//        PessoaBDApague p = new PessoaBDApague();
//        p.setNome("NOME");
//        p.setCpf("02782580426");
//        p.setDataNascimento(LocalDate.now());
//        p.setEndereco("ENDERECO"); 
//        p.setBairro("BAIRRO");
//        p.setCep("50000000");
//        p.setCidade("CIDADE");
//        p.setEstado("UF");
//        
//        pessoaBDRepository.save(p);
 
        
        List<Medicamento> medicamentos = medicamentoService.findAll();
        Collections.shuffle(medicamentos);
        
        List<Exame> exames = exameRepository.findAll();
        Collections.shuffle(exames);

        List<Medico> medicos = medicoRepository.findAll();
        Collections.shuffle(medicos);
        
        List<Paciente> pacientes = pacienteRepository.findAll();
        Collections.shuffle(pacientes);        
        
        Medico medico = medicos.get(0);
        Paciente paciente = pacientes.get(0);
        
        
        Receita receita = new Receita();
        receita.setPaciente(paciente);
        receita.setMedico(medico);
        
        Set<Medicamento> medicamentosReceitaSet = new HashSet<>();
        medicamentosReceitaSet.add(medicamentos.get(0));
        medicamentosReceitaSet.add(medicamentos.get(1));
        medicamentosReceitaSet.add(medicamentos.get(2));
        
        receita.setMedicamentos(medicamentosReceitaSet);
        
//        List<Medicamento> list = new ArrayList<Medicamento>(medicamentosReceitaSet);
//        receita.setMedicamentos(list);        
        
        receita.setConteudo("1 comprimido de 8 em 8 horas");
        receitaRepository.save(receita);
        
        //Receita receita2 = new Receita();
        //receitaRepository.save(receita2);
        
        List<Receita> receitas = receitaRepository.findAll();
        
        
        
        SolicitacaoExame solicitacaoExame = new SolicitacaoExame();
        solicitacaoExame.setDataSolicitacao(new Date());
        solicitacaoExame.setPaciente(paciente);
        solicitacaoExame.setMedicoSolicitante(medico);
        
        Set<Exame> examesSolicitacaoSet = new HashSet<>();
        examesSolicitacaoSet.add(exames.get(0));
        examesSolicitacaoSet.add(exames.get(1));
        examesSolicitacaoSet.add(exames.get(2));
        
        solicitacaoExame.setExames(examesSolicitacaoSet);
        
//        List<Exame> list = new ArrayList<Exame>(examesSolicitacaoSet);
//        solicitacaoExame.setExames(list);
        
        solicitacaoExameRepository.save(solicitacaoExame);
        
        List<SolicitacaoExame> solicitacaoExameList = solicitacaoExameRepository.findAll();
        
        // Agendamento
        LocalTime horaInicio = LocalTime.of(10, 00);
        LocalTime horaFim = LocalTime.of(14, 00);
        LocalDate hoje = DataUtils.asLocalDate( new Date() );
        
        Agendamento agendamento = new Agendamento();
        agendamento.setData(  hoje  );
        agendamento.setHoraInicio(horaInicio);
        agendamento.setHoraFim(horaFim);
        agendamento.setMedico(medico);
        agendamento.setPaciente(paciente);
        
        
        agendamentoRepository.save(agendamento);

        LocalTime horaInicio2 = LocalTime.of(10, 00);
        LocalTime horaFim2 = LocalTime.of(14, 00);
        
        Agendamento agendamento2 = new Agendamento();
        
        
        agendamento2.setData( hoje );
        agendamento2.setHoraInicio(horaInicio2);
        agendamento2.setHoraFim(horaFim2);
        agendamento2.setMedico(medico);

        agendamentoRepository.save(agendamento2);

        
        
        for (Medico medicoElement : medicos) {
            agendaService.criarVagas(hoje, hoje.plusDays(90), medicoElement);
        }
        
        System.out.println("pausa");
        
        medico = medicoRepository.findOne("2");
        
        List<Agendamento> agendamentos = agendaService.findAll();
        List<Agendamento> agendamentosMedico = agendaService.getAgendaMedico(medico);
        List<Agendamento> agendaVagaMedico = agendaService.getHorarioDisponivelMedico(medico);
        List<Agendamento> agendaOcupadaMedico = agendaService.getHorariosOcupadosMedico(medico);
        
        System.out.println("pausa");
        
//        for (Agendamento agenda : agendamentos) {
//          System.out.println(agenda);
//      }
        
        System.out.println("para");
        

    }


    
}