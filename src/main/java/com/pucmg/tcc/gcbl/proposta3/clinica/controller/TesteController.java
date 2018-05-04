package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ReceitaRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.SolicitacaoExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.MedicamentoService;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.UserService;




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
    private UserService userService;
    
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
        
    	List<Medicamento> medicamentos = medicamentoService.findAll();
    	Collections.shuffle(medicamentos);
    	
    	List<Exame> exames = exameRepository.findAll();
    	Collections.shuffle(exames);
    	
        model.addAttribute("medicamentos", medicamentos);
        
        // medico
        Medico medico = new Medico();
        medico.setNome("Fulano");
        medico.setDataNascimento(new Date());
        medico.setCpf("02782580426");
        medico.setEndereco("rua tal");
        medico.setCrm("1234");
        medicoRepository.save(medico);
        
        // Inserir paciente
        Paciente paciente = new Paciente();
        paciente.setNome("Fulano");
        paciente.setDataNascimento(new Date());
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
        solicitacaoExame.setDataSolicitacao( "isto aqui E PRA SER UM dATE" );
        solicitacaoExame.setPaciente(paciente);
        solicitacaoExame.setMedicoSolicitante(medico);
        
        Set<Exame> examesSolicitacao = new HashSet<>();
        examesSolicitacao.add(exames.get(0));
        examesSolicitacao.add(exames.get(1));
        examesSolicitacao.add(exames.get(2));
        
        solicitacaoExame.setExames(examesSolicitacao);
        
        solicitacaoExameRepository.save(solicitacaoExame);
        
        List<SolicitacaoExame> solicitacaoExameList = solicitacaoExameRepository.findAll();
        
        System.out.println("para");
        
        return "views/listaMedicamentos";
    }

}