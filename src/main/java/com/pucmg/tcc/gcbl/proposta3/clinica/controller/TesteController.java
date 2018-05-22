package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.validator.constraints.br.CPF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.PessoaBDApague;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.AgendaService;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AgendamentoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PessoaBDRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ReceitaRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.SolicitacaoExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.UserService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.DataUtils;




@Controller
public class TesteController extends BaseController {
    
    private static Log log = LogFactory.getLog(TesteController.class);
    
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

    
    @Autowired
    private UserService userService;
    
    @Autowired
    private PessoaBDRepository pessoaBDRepository;    
    
    /**
     * TESTE
     * @param model
     * @return
     */
    @RequestMapping(value={"/publico/teste"}, method = RequestMethod.GET)
    public String loginErrado(Model model){
        User userForm = new User();
        userForm.setEmail("teste@teste.com");
        userForm.setPassword("teste");
        userForm.setLastName("last name");
        userForm.setName("name");
        //userService.saveUser(userForm);
        
        PessoaBDApague p = new PessoaBDApague();
        p.setNome("NOME");
        p.setCpf("02782580426");
        p.setDataNascimento(LocalDate.now());
        p.setEndereco("ENDERECO"); 
        p.setBairro("BAIRRO");
        p.setCep("50000000");
        p.setCidade("CIDADE");
        p.setEstado("UF");
        
        pessoaBDRepository.save(p);
        /*
    @Column(name = "NOME")
    private String nome;

    @Column(name = "SOBRENOME")
    private String sobrenome;
    
    @Column(name = "CPF")
    @CPF
    private String cpf;
    
    @Column(name = "DT_NASCIMENTO")
    private LocalDate dataNascimento;

    @Column(name = "RUA")
    private String rua;

    @Column(name = "NUMERO")
    private long numero;

    @Column(name = "BAIRRO")
    private String bairro;
    
    @Column(name = "CEP")
    private String cep;

    @Column(name = "CIDADE")
    private String cidade;

    @Column(name = "ESTADO")
    private String estado;        
        
        */
        
    	List<Medicamento> medicamentos = medicamentoService.findAll();
    	Collections.shuffle(medicamentos);
    	
    	List<Exame> exames = exameRepository.findAll();
    	Collections.shuffle(exames);

        List<Medico> medicos = medicoRepository.findAll();
        Collections.shuffle(medicos);
    	
        Medico medico = medicos.get(0);
        
        model.addAttribute("medicamentos", medicamentos);
        

        
        // Inserir paciente
        Paciente paciente = new Paciente();
        paciente.setNome("Fulano");
        paciente.setDataNascimento( new Date() );
        paciente.setCpf("02782580426");
        paciente.setEndereco("rua tal");
        paciente.setPlanoSaude("UNIMED");
        
        pacienteRepository.save(paciente);
        
        Receita receita = new Receita();
        receita.setPaciente(paciente);
        receita.setMedico(medico);
        
        Set<Medicamento> medicamentosReceita = new HashSet<>();
        medicamentosReceita.add(medicamentos.get(0));
        medicamentosReceita.add(medicamentos.get(1));
        medicamentosReceita.add(medicamentos.get(2));
        
        receita.setMedicamentos(medicamentosReceita);
        
        receita.setConteudo("1 comprimido de 8 em 8 horas");
        receitaRepository.save(receita);
        
        //Receita receita2 = new Receita();
        //receitaRepository.save(receita2);
        
        List<Paciente> pacientes = pacienteRepository.findAll();
        List<Receita> receitas = receitaRepository.findAll();
        
        
        
        SolicitacaoExame solicitacaoExame = new SolicitacaoExame();
        solicitacaoExame.setDataSolicitacao(new Date());
        solicitacaoExame.setPaciente(paciente);
        solicitacaoExame.setMedicoSolicitante(medico);
        
        Set<Exame> examesSolicitacao = new HashSet<>();
        examesSolicitacao.add(exames.get(0));
        examesSolicitacao.add(exames.get(1));
        examesSolicitacao.add(exames.get(2));
        
        solicitacaoExame.setExames(examesSolicitacao);
        
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
//			System.out.println(agenda);
//		}
        
        System.out.println("para");
        
        return "views/listaMedicamentos";
    }


}