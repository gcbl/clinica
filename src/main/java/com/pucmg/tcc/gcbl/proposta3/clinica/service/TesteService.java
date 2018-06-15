package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
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
    private AgendamentoService agendamentoService;

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
        
        
        // Criando agenda pra os medicos
        LocalDate diaInicioAgenda = DataUtils.asLocalDate( new Date() );
        diaInicioAgenda = diaInicioAgenda.plusDays(-10);
        for (Medico medicoElement : medicos) {
            agendaService.criarVagas(medicoElement, diaInicioAgenda, diaInicioAgenda.plusDays(20), 8, 12, 60);
        }
        
        // --- Marcando horarios ---
        List<Agendamento> horariosVagos = agendamentoService.getHorarioDisponivelList();
        Collections.shuffle(horariosVagos);
        
        int qtdPacientes = pacientes.size();
        
        List<Agendamento> horariosMarcados = new ArrayList<Agendamento>();
        // Marcando um horario pra cada paciente
        for(int contador = 0; contador < qtdPacientes; contador++){
            Agendamento agendamento = horariosVagos.get(contador);
            Paciente pacienteAgendando = pacientes.get(contador);
            
            // Setando o paciente no horario vago
            agendamento.setPaciente(pacienteAgendando);

            horariosMarcados.add(agendamento);
        }
        
        // Salvando a lista de agendamentos
        agendamentoService.salvar(horariosMarcados);
        // --- Fim de Marcando horarios ---

        // Encaixe
        Random random = new Random();
        
        // Hora aleatoria entre 8 e 20
        int horaInicioRandom = random.ints(8, (20 + 1)).findFirst().getAsInt();
        
        LocalTime horaInicio = LocalTime.of(horaInicioRandom, 00);
        LocalTime horaFim = LocalTime.of(horaInicioRandom+1, 00);
        LocalDate hoje = DataUtils.asLocalDate( new Date() );

        // Data aleatoria 2 dias pra tras ou 2 dias pra frente
        int diaOffset = random.ints(-2, (2 + 1)).findFirst().getAsInt(); // numero entre -2 e 2
        LocalDate diaConsulta = hoje.plusDays(diaOffset);
        
        Agendamento agendamento = new Agendamento();
        agendamento.setData(  diaConsulta  );
        agendamento.setHoraInicio(horaInicio);
        agendamento.setHoraFim(horaFim);
        agendamento.setMedico(medico);
        agendamento.setPaciente(paciente);
        
        
        agendamentoRepository.save(agendamento);

        LocalTime horaInicio2 = LocalTime.of(10, 00);
        LocalTime horaFim2 = LocalTime.of(14, 00);
        
        Agendamento agendamento2 = new Agendamento();
        
        
        agendamento2.setData( diaConsulta );
        agendamento2.setHoraInicio(horaInicio2);
        agendamento2.setHoraFim(horaFim2);
        agendamento2.setMedico(medico);

        agendamentoRepository.save(agendamento2);


        
        System.out.println("pausa");
        
        medico = medicoRepository.findOne("2");
        
        List<Agendamento> agendamentos = agendamentoService.findAll();
        List<Agendamento> agendamentosMedico = agendamentoService.getAgendaMedico(medico);
        List<Agendamento> agendaVagaMedico = agendamentoService.getHorarioDisponivelMedicoList(medico);
        List<Agendamento> agendaOcupadaMedico = agendamentoService.getHorarioOcupadoMedicoList(medico);
        
        System.out.println("pausa");
        
//        for (Agendamento agenda : agendamentos) {
//          System.out.println(agenda);
//      }
        
        System.out.println("para");
        

    }


    
}