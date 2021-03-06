package com.pucmg.tcc.gcbl.proposta3.clinica.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Agendamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Atendimento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.HistoricoClinico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medicamento;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Medico;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Paciente;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Receita;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.Recepcionista;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.ResultadoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.SolicitacaoExame;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.AtendimentoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.MedicoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.PacienteRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ReceitaRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.ResultadoExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.SolicitacaoExameRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.DataUtils;

@Service
public class TesteService{
    
    private String queixas[] = {"cefaléia", "dor abdominal", "dor na coluna", "insônia", "visão cansada", "dor no peito"};
    private String frequencia[] = {"dias", "semanas", "meses"};
    private String planosDeSaude[] = {"AMIL", "Unimed", "GEAP", "Hapvida", "Bradesco Saúde"};
    private String laboratorios[] = {"Exato Laboratório", "Laboratório Pasteur", "Laboratório Sabin", "Cerpe Diagnósticos", "Ciac - Centro Integrado de Análises Clínicas"};
    private String responsavelTecnico[] = {"Beatriz Osório", "Letícia Bivar", "Horácio Amarante", "Hélio Castilhos", "Vanderlei Silvestre"};
	
    
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
    private ResultadoExameRepository resultadoExameRepository;    
    
    @Autowired
    private AgendamentoService agendamentoService;

    @Autowired
    private AtendimentoRepository atendimentoRepository;
    
    
    @Autowired
    private AgendaService agendaService;

    @Autowired
    private HistoricoClinicoService historicoClinicoService;

    @Autowired
    private GrupoService grupoService;

    @Autowired
    private RecepcionistaService recepcionistaService;
    
    
    public void popula(){
        
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
        
        
        
 
        // Limpandos os atendimentos
        List<Atendimento> atendimentoRemover = atendimentoRepository.findAll();
        atendimentoRepository.delete(atendimentoRemover);        
        
        
        // Limpandos as solicitacoes de exames
        List<SolicitacaoExame> solicitacoesRemover = solicitacaoExameRepository.findAll();
        solicitacaoExameRepository.delete(solicitacoesRemover);        
        
        // Limpando as receitas
        List<Receita> receitasRemover = receitaRepository.findAll();
        receitaRepository.delete(receitasRemover);        

        // Limpando os resultados dos exames
        List<ResultadoExame> resultadoExameRemover = resultadoExameRepository.findAll();
        resultadoExameRepository.delete(resultadoExameRemover);        
        
        
        List<Medicamento> medicamentos = medicamentoService.findAll();
        Collections.shuffle(medicamentos);
        
        List<Exame> exames = exameRepository.findAll();
        Collections.shuffle(exames);

        List<Medico> medicos = medicoRepository.findAll();
        Collections.shuffle(medicos);
        
        List<Recepcionista> recepcionistas = recepcionistaService.findAll();
        Collections.shuffle(recepcionistas);

        List<Paciente> pacientes = pacienteRepository.findAll();
        Collections.shuffle(pacientes);
        
        // Usuarios nos grupos:
        // Adicionando os usuarios aos grupos
        
        // Preenchendo grupo dos recepcionistas
        List<Grupo> grupos = grupoService.findByNome("RECEPCIONISTAS");
        // Zera o grupo
        for (Grupo grupo : grupos) {
            grupoService.removerUsuarios(grupo);
            // grupoService.limparGrupo(grupo);
        }

        // Adiciona todos os recepcionistas
        for (Grupo grupo : grupos) {
            grupoService.adicionarUsuario(grupo, recepcionistas);
        }
        
        // Remove o recepcionista 100 que é o de teste
        Recepcionista usuarioTeste = recepcionistaService.findOne("100");
        for (Grupo grupo : grupos) {
            grupoService.removerUsuario(grupo, usuarioTeste);
        }

        

        grupos = grupoService.findByNome("MEDICOS");
        // Zera o grupo
        for (Grupo grupo : grupos) {
            grupoService.removerUsuarios(grupo);
            //grupoService.limparGrupo(grupo);
        }

        // Adiciona todos os medicos
        for (Grupo grupo : grupos) {
            grupoService.adicionarUsuario(grupo, medicos);
        }
        // Fim do preenchimento dos grupos

        grupos = grupoService.findAll();
        
        
        // Atualiza plano de Saude
        int contadorPlano = 0;
        for (Paciente paciente : pacientes) {
			paciente.setPlanoSaude( planosDeSaude[ contadorPlano % planosDeSaude.length ] );
			contadorPlano++;
			if ( !DataUtils.isCPF( paciente.getCpf() )) {
				System.out.println("invalido!");
			}
			//System.out.println("Salvando: " + contadorPlano + " " + paciente.getId() +  " " + paciente.getNome());
		}
        pacienteRepository.save(pacientes);
        
        Medico medico = medicos.get(0);
        Paciente paciente = pacientes.get(0);
        
        
        Receita receitaNova = new Receita();
        receitaNova.setPaciente(paciente);
        receitaNova.setMedico(medico);
        
        Set<Medicamento> medicamentosReceitaNovaSet = new HashSet<>();
        medicamentosReceitaNovaSet.add(medicamentos.get(0));
        medicamentosReceitaNovaSet.add(medicamentos.get(1));
        medicamentosReceitaNovaSet.add(medicamentos.get(2));
        
        receitaNova.setMedicamentos(medicamentosReceitaNovaSet);
        
//        List<Medicamento> list = new ArrayList<Medicamento>(medicamentosReceitaSet);
//        receita.setMedicamentos(list);        
        
        receitaNova.setConteudo("1 comprimido de 8 em 8 horas");
        receitaRepository.save(receitaNova);
        
        //Receita receita2 = new Receita();
        //receitaRepository.save(receita2);
        
        List<Receita> receitas = receitaRepository.findAll();
        
        
//        SolicitacaoExame solicitacaoExame = new SolicitacaoExame();
//        solicitacaoExame.setDataSolicitacao(new Date());
//        solicitacaoExame.setPaciente(paciente);
//        solicitacaoExame.setMedicoSolicitante(medico);
//        
//        Set<Exame> examesSolicitacaoSet = new HashSet<>();
//        examesSolicitacaoSet.add(exames.get(0));
//        examesSolicitacaoSet.add(exames.get(1));
//        examesSolicitacaoSet.add(exames.get(2));
//        
//        solicitacaoExame.setExames(examesSolicitacaoSet);
//        solicitacaoExameRepository.save(solicitacaoExame);
        
//        List<SolicitacaoExame> solicitacaoExameList = solicitacaoExameRepository.findAll();
        
        
        // Criando agenda pra os medicos
        LocalDate diaInicioAgenda = DataUtils.asLocalDate( new Date() );
        diaInicioAgenda = diaInicioAgenda.plusDays(-10);
        
        LocalTime horaInicio = LocalTime.of(8, 0);
        LocalTime horaFim = LocalTime.of(18, 0);
        for (Medico medicoElement : medicos) {
            agendaService.criarVagas(medicoElement, diaInicioAgenda, diaInicioAgenda.plusDays(20), horaInicio, horaFim, 60);
        }
        
        // --- Marcando horarios ---
        List<Agendamento> horariosVagosTudo = agendamentoService.getHorarioDisponivelList();
        
        // Agenda consultas "até ontem"
        List<Agendamento> horariosVagos = agendamentoService.getHorarioDisponivelList(diaInicioAgenda, LocalDate.now().minusDays(1) );
        Collections.shuffle(horariosVagos);
        
        int qtdPacientes = pacientes.size();
        
        List<Agendamento> horariosMarcados = new ArrayList<Agendamento>();
        List<SolicitacaoExame> solicitacaoExameList = new ArrayList<SolicitacaoExame>();
        List<Receita> receitasList = new ArrayList<Receita>();
        List<ResultadoExame> resultadoExameList = new ArrayList<ResultadoExame>();
        List<Atendimento> atendimentoList = new ArrayList<Atendimento>();

        // *** POPULANDO DADOS! ***
        // Loop em todos os pacientes
        for(int contador = 0; contador < qtdPacientes; contador++){
            // Marcando *TRES* horario pra cada paciente
            Paciente pacienteAgendando = pacientes.get(contador);

            Agendamento agendamento1 = horariosVagos.get(3*contador);
            Agendamento agendamento2 = horariosVagos.get(3*contador + 1);
            Agendamento agendamento3 = horariosVagos.get(3*contador + 2);

            // Setando o paciente no horario vago
            agendamento1.setPaciente(pacienteAgendando);
            agendamento2.setPaciente(pacienteAgendando);
            agendamento3.setPaciente(pacienteAgendando);

            horariosMarcados.add(agendamento1);
            horariosMarcados.add(agendamento2);
            horariosMarcados.add(agendamento3);
            // Fim da marcação de horarios
            
            Agendamento[] agendamentos = {agendamento1, agendamento2, agendamento3};
            
            // Loop nos agendamentos
            for(int s = 0; s < agendamentos.length ; s++){
            	// Incluindo 1 atendimento pra cada agendamento
                int zero_a_dez = geraValor(0, 10); // valor entre 2 e 10

                Atendimento atendimento = new Atendimento();
                LocalDateTime dataCriacaoAtendimento =  LocalDateTime.of( agendamentos[s].getData(), agendamentos[s].getHoraInicio().plusMinutes( zero_a_dez ) ); 
                atendimento.setDataCriacao(  dataCriacaoAtendimento   );

                atendimento.setPaciente(agendamentos[s].getPaciente());
                atendimento.setMedico( agendamentos[s].getMedico() );
                atendimento.setConteudo("Paciente com queixa de " + queixas[zero_a_dez % queixas.length] + " há " + (zero_a_dez + 1) + " " + frequencia[ zero_a_dez % frequencia.length]);
                atendimentoList.add(atendimento);
                
            	// Incluindo 1 solicitacoes de exames pra cada agendamento
                SolicitacaoExame solicitacaoExame = new SolicitacaoExame();
                
                int qtdMinutos = geraValor(15, 20); // Valor entre 15 e 20
                // Seta dataCriacao para "um pouco depois" de iniciar a consulta
                LocalDateTime dataCriacaoSolicitacaoExame =  LocalDateTime.of( agendamentos[s].getData(), agendamentos[s].getHoraInicio().plusMinutes( qtdMinutos ) ); 
                solicitacaoExame.setDataCriacao(  dataCriacaoSolicitacaoExame   );
                
                solicitacaoExame.setDataSolicitacao( DataUtils.asDate( agendamentos[s].getData() )  );
                solicitacaoExame.setPaciente(agendamentos[s].getPaciente());
                solicitacaoExame.setMedicoSolicitante( agendamentos[s].getMedico() );
                
                
                Set<Exame> examesSolicitacaoSet = new HashSet<>();

                int qtdExames = geraValor( 1, 10 ); // Valor entre 1 e 10 exames na solicitacao
                for(int e = 0; e < qtdExames; e++){
                    examesSolicitacaoSet.add(exames.get(e));    
                }
                
                solicitacaoExame.setExames(examesSolicitacaoSet);
                
                solicitacaoExameList.add(solicitacaoExame);
                Collections.shuffle(exames);
                
                // Fim da inclusao dos exames
                
                
                // ----- Inclusao de Resultado de exames -----
                ResultadoExame resultadoExame = new ResultadoExame();
                
                boolean disponibilizadoPaciente = ( geraValor(0, 1) == 0 ) ? true : false;
                int valorResultado = geraValor(20, 200); // Valor entre 20 e 200
                
                resultadoExame.setPaciente( agendamentos[s].getPaciente() );
                resultadoExame.setDisponibilizadoPaciente(disponibilizadoPaciente);
                resultadoExame.setLaboratorio( laboratorios[s % laboratorios.length] );
                resultadoExame.setResponsavelTecnico(responsavelTecnico[s % responsavelTecnico.length] );
                //resultadoExame.setData( agendamentos[s].getData().plusDays( s % 3 )  );
                resultadoExame.setData( DataUtils.asLocalDate( solicitacaoExame.getDataSolicitacao() ) );
                resultadoExame.setDataCriacao( solicitacaoExame.getDataCriacao().plusMinutes( geraValor(300, 1000) )  );
                resultadoExame.setResultado("O resultado deste exame é " + valorResultado + "mg/dl.");
                // Resultado pra 1/3 dos exames
                
                boolean persistirResultado = ( geraValor(0, 1) == 0 ) ? true : false;
                if(persistirResultado){
                    resultadoExameList.add(resultadoExame);
                }

                // ----- Fim da inclusao de Resultado de exames -----
                
                // Inclusao de receitas
                Receita receita = new Receita();
                
                qtdMinutos = geraValor(15, 20); // Valor entre 15 e 20 
                // Seta dataCriacao para "um pouco depois" de iniciar a consulta
                LocalDateTime dataCriacaoReceita =  LocalDateTime.of( agendamentos[s].getData(), agendamentos[s].getHoraInicio().plusMinutes( qtdMinutos ) ); 
                receita.setDataCriacao(  dataCriacaoReceita   );
                
                receita.setPaciente( agendamentos[s].getPaciente() );
                receita.setMedico( agendamentos[s].getMedico() );
                
                Set<Medicamento> medicamentosReceitaSet = new HashSet<>();
                
                int qtdMedicamentos = geraValor(1, 5); // Inclui entre 1 e 5 medicamentos na receita
                for(int qtd = 0; qtd < qtdMedicamentos; qtd++){
                    medicamentosReceitaSet.add(medicamentos.get(qtd));
                }
                receita.setMedicamentos(medicamentosReceitaSet);
                
//                List<Medicamento> list = new ArrayList<Medicamento>(medicamentosReceitaSet);
//                receita.setMedicamentos(list);        
                
                int intervaloHora = geraValor(1, 12); // Valor entre 1 e 12
                receita.setConteudo("1 comprimido de " + intervaloHora + " em " + intervaloHora + " horas");
                receitasList.add(receita);
                
                Collections.shuffle(medicamentos);
                // fim da inclusao de receitas
                
            }
            
            
        }
        
        // Salvando a lista de agendamentos
        agendamentoService.salvar(horariosMarcados);
        atendimentoRepository.save(atendimentoList);
        solicitacaoExameRepository.save(solicitacaoExameList);
        receitaRepository.save(receitasList);
        resultadoExameRepository.save(resultadoExameList);
        // --- Fim de Marcando horarios ---

        
        List<HistoricoClinico> historicoClinicoList = historicoClinicoService.getHistoricoClinico(paciente);
        
//-------------------------------------------------------------------
/*        
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
*/        
//-------------------------------------------------------------------
//        SolicitacaoExame solicitacaoExame = solicitacaoExameList.get(0);
//        ResultadoExame resultadoExame = new ResultadoExame();
//        resultadoExame.setResultado("este eh o resultado");
//        resultadoExame.setDisponibilizadoPaciente(true);
//        
//        
//        solicitacaoExame.setResultadoExame(resultadoExame);
//        
//        solicitacaoExameRepository.save(solicitacaoExame);
        
        // System.out.println("pausa");
        
        medico = medicoRepository.findOne("2");
        
        List<Agendamento> agendamentos = agendamentoService.findAll();
        List<Agendamento> agendamentosMedico = agendamentoService.getAgendaMedico(medico);
        List<Agendamento> agendaVagaMedico = agendamentoService.getHorarioDisponivelMedicoList(medico);
        List<Agendamento> agendaOcupadaMedico = agendamentoService.getHorarioOcupadoMedicoList(medico);
        
        // System.out.println("pausa");
        
//        for (Agendamento agenda : agendamentos) {
//          System.out.println(agenda);
//      }
        

    }

    private int geraValor(int valorInicio, int valorFim){
        return ThreadLocalRandom.current().nextInt(valorInicio, valorFim + 1);
    }
    
}