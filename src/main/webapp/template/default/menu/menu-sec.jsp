<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%-- ################################################################################################## --%>
<%-- ###   INICIO DAS VARIAVEIS DE SEGURANCA                                                        ### --%>
<%-- ################################################################################################## --%>
<%-- Medico --%>
<sec:authorize access="hasRole('ROLE_LISTAR_MEDICO'  )" var="listarMedico"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_MEDICO' )" var="incluirMedico" />
<sec:authorize access="hasRole('ROLE_EDITAR_MEDICO'  )" var="editarMedico" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_MEDICO' )" var="excluirMedico" />
<c:set var="funcoesMedico" value="${listarMedico || incluirMedico || editarMedico || excluirMedico}"/>

<%-- Paciente --%>
<sec:authorize access="hasRole('ROLE_LISTAR_PACIENTE'  )" var="listarPaciente"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_PACIENTE' )" var="incluirPaciente" />
<sec:authorize access="hasRole('ROLE_EDITAR_PACIENTE'  )" var="editarPaciente" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_PACIENTE' )" var="excluirPaciente" />
<sec:authorize access="hasRole('ROLE_LISTAR_HISTORICO_CLINICO_PACIENTE' )" var="listarHistoricoClinicoPaciente" />
<c:set var="funcoesPaciente" value="${listarPaciente || incluirPaciente || editarPaciente || excluirPaciente || listarHistoricoClinicoPaciente}"/>

<%-- Recepcionista --%>
<sec:authorize access="hasRole('ROLE_LISTAR_RECEPCIONISTA'  )" var="listarRecepcionista"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_RECEPCIONISTA' )" var="incluirRecepcionista" />
<sec:authorize access="hasRole('ROLE_EDITAR_RECEPCIONISTA'  )" var="editarRecepcionista" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_RECEPCIONISTA' )" var="excluirRecepcionista" />
<c:set var="funcoesRecepcionista" value="${listarRecepcionista || incluirRecepcionista || editarRecepcionista || excluirRecepcionista}"/>

<%-- Profissional [Medico || Recepcionista] --%>
<c:set var="funcoesProfissional" value="${funcoesMedico || funcoesRecepcionista}"/>

<%-- Grupo --%>
<sec:authorize access="hasRole('ROLE_LISTAR_GRUPO'  )" var="listarGrupo"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_GRUPO' )" var="incluirGrupo" />
<sec:authorize access="hasRole('ROLE_EDITAR_GRUPO'  )" var="editarGrupo" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_GRUPO' )" var="excluirGrupo" />
<c:set var="funcoesGrupo" value="${listarGrupo || incluirGrupo || editarGrupo || excluirGrupo}"/>

<%-- Medicamento --%>
<sec:authorize access="hasRole('ROLE_LISTAR_MEDICAMENTO'  )" var="listarMedicamento"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_MEDICAMENTO' )" var="incluirMedicamento" />
<sec:authorize access="hasRole('ROLE_EDITAR_MEDICAMENTO'  )" var="editarMedicamento" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_MEDICAMENTO' )" var="excluirMedicamento" />
<c:set var="funcoesMedicamento" value="${listarMedicamento || incluirMedicamento || editarMedicamento || excluirMedicamento}"/>

<%-- Atendimento --%>
<sec:authorize access="hasRole('ROLE_LISTAR_ATENDIMENTO'  )" var="listarAtendimento"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_ATENDIMENTO' )" var="incluirAtendimento" />
<sec:authorize access="hasRole('ROLE_EDITAR_ATENDIMENTO'  )" var="editarAtendimento" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_ATENDIMENTO' )" var="excluirAtendimento" />
<c:set var="funcoesAtendimento" value="${listarAtendimento || incluirAtendimento || editarAtendimento || excluirAtendimento}"/>

<%-- Receita --%>
<sec:authorize access="hasRole('ROLE_LISTAR_RECEITA'  )" var="listarReceita"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_RECEITA' )" var="incluirReceita" />
<sec:authorize access="hasRole('ROLE_EDITAR_RECEITA'  )" var="editarReceita" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_RECEITA' )" var="excluirReceita" />
<c:set var="funcoesReceita" value="${listarReceita || incluirReceita || editarReceita || excluirReceita}"/>

<%-- # Exames # --%>
<%-- ResultadoExame --%>
<sec:authorize access="hasRole('ROLE_LISTAR_RESULTADOEXAME'  )" var="listarResultadoExame"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_RESULTADOEXAME' )" var="incluirResultadoExame" />
<sec:authorize access="hasRole('ROLE_EDITAR_RESULTADOEXAME'  )" var="editarResultadoExame" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_RESULTADOEXAME' )" var="excluirResultadoExame" />
<c:set var="funcoesResultadoExame" value="${listarResultadoExame || incluirResultadoExame || editarResultadoExame || excluirResultadoExame}"/>

<%-- SolicitacaoExame --%>
<sec:authorize access="hasRole('ROLE_LISTAR_SOLICITACAOEXAME'  )" var="listarSolicitacaoExame"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_SOLICITACAOEXAME' )" var="incluirSolicitacaoExame" />
<sec:authorize access="hasRole('ROLE_EDITAR_SOLICITACAOEXAME'  )" var="editarSolicitacaoExame" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_SOLICITACAOEXAME' )" var="excluirSolicitacaoExame" />
<c:set var="funcoesSolicitacaoExame" value="${listarSolicitacaoExame || incluirSolicitacaoExame || editarSolicitacaoExame || excluirSolicitacaoExame}"/>

<%-- Exame --%>
<sec:authorize access="hasRole('ROLE_LISTAR_EXAME'  )" var="listarExame"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_EXAME' )" var="incluirExame" />
<sec:authorize access="hasRole('ROLE_EDITAR_EXAME'  )" var="editarExame" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_EXAME' )" var="excluirExame" />
<c:set var="funcoesExame" value="${listarExame || incluirExame || editarExame || excluirExame}"/>

<%-- Agendamento --%>
<sec:authorize access="hasRole('ROLE_LISTAR_AGENDAMENTO'  )" var="listarAgendamento"  />
<sec:authorize access="hasRole('ROLE_INCLUIR_AGENDAMENTO' )" var="incluirAgendamento" />
<sec:authorize access="hasRole('ROLE_EDITAR_AGENDAMENTO'  )" var="editarAgendamento" />
<sec:authorize access="hasRole('ROLE_EXCLUIR_AGENDAMENTO' )" var="excluirAgendamento" />

<sec:authorize access="hasRole('ROLE_PESQUISAR_AGENDAMENTO' )" var="pesquisarAgendamento" />
<sec:authorize access="hasRole('ROLE_INCLUIR_AGENDAFORM' )" var="incluirAgendaForm" />

<sec:authorize access="hasRole('ROLE_EXIBIR_CALENDARIO_AGENDAMENTO' )" var="exibirCalendarioAgendamento" />
<sec:authorize access="hasRole('ROLE_EXIBIR_CALENDARIO_VAGAS_AGENDAMENTO' )" var="exibirCalendarioVagasAgendamento" />

<c:set var="funcoesAgendamento" value="${listarAgendamento || incluirAgendamento || editarAgendamento || excluirAgendamento || pesquisarAgendamento || incluirAgendaForm || exibirCalendarioAgendamento || exibirCalendarioVagasAgendamento}"/>


<%-- ################################################################################################## --%>
<%-- ###   FIM DAS VARIAVEIS DE SEGURANCA                                                        ### --%>
<%-- ################################################################################################## --%>


<%-- ################################################################################################## --%>
<%-- ###   INICIO DO MENU                                                                           ### --%>
<%-- ################################################################################################## --%>
<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home">
  <span class="fa-stack fa-lg fa-2x">
	    <i class="fas fa-medkit fa-stack-1x text-info"></i>
  </span>${nomeSistema}
  </a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
<!--
      <li class="nav-item active">
        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
      </li>
 -->
       
        <%-- OK - Agendamento --%>
        <c:if test = "${funcoesAgendamento}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="far fa-calendar-alt"></i> Agenda
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                <c:if test = "${exibirCalendarioVagasAgendamento}">
                    <a class="dropdown-item" href="exibir-calendario-vagas-agendamento">Exibir Calendário</a>
                </c:if>
                <c:if test = "${incluirAgendamento}">
                    <a class="dropdown-item" href="incluir-agendamento">Agendar "Encaixe"</a>
                </c:if>
                <div class="dropdown-divider"></div>
                <c:if test = "${pesquisarAgendamento}">
                    <a class="dropdown-item" href="pesquisar-agendamento">Pesquisar Agendamentos</a>
                </c:if>
                <div class="dropdown-divider"></div>
                <c:if test = "${incluirAgendaForm}">
                    <a class="dropdown-item" href="incluir-agendaForm">Criar agenda</a>
                </c:if>
                <c:if test = "${listarAgendamento}">
                    <a class="dropdown-item" href="listar-agendamento">Listar Agendamentos</a>
                </c:if>
                <div class="dropdown-divider"></div>
                
                <c:if test = "${exibirCalendarioAgendamento}">
                    <a class="dropdown-item" href="exibir-calendario-agendamento"><i class="fas fa-flask"></i> Exibir Marcações Calendário</a>
                </c:if>
                <%--
                <c:if test = "${exibirCalendarioVagasAgendamento}">
                    <a class="dropdown-item" href="exibir-calendario-vagas-agendamento"><i class="fas fa-flask"></i> Exibir Vagas Calendário</a>
                </c:if>
                --%>
                <%--
                <a class="dropdown-item" href="incluir-consulta-agendamento"><i class="fas fa-flask"></i> Marcar Consulta</a>
                --%>
                </div>
            </li>
        </c:if>        
      
        <%-- OK - Exame --%>
        <c:if test = "${funcoesExame || funcoesResultadoExame || funcoesSolicitacaoExame}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-vials"></i> Exame
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                    <c:if test = "${listarExame || editarExame || excluirExame}">
                        <a class="dropdown-item" href="listar-exame">Consultar</a>
                    </c:if>
                    <c:if test = "${incluirExame}">
                        <a class="dropdown-item" href="incluir-exame">Incluir</a>
                    </c:if>
                  
                    <div class="dropdown-divider"></div>
                    <c:if test = "${listarSolicitacaoExame || editarSolicitacaoExame || excluirSolicitacaoExame}">
                        <a class="dropdown-item" href="listar-solicitacaoExame">Listar Solicitações de Exames</a>
                    </c:if>
                    <c:if test = "${incluirSolicitacaoExame}">
                        <a class="dropdown-item" href="incluir-solicitacaoExame">Solicitar exame</a>
                    </c:if>
                  
                    <div class="dropdown-divider"></div>
                    <c:if test = "${listarResultadoExame || editarResultadoExame || excluirResultadoExame}">
                        <a class="dropdown-item" href="listar-resultadoExame">Listar Resultado de Exames</a>
                    </c:if>
                    <c:if test = "${incluirResultadoExame}">                
                        <a class="dropdown-item" href="incluir-resultadoExame">Receber resultado</a>
                    </c:if>                
                </div>
            </li>   
        </c:if>   

        <%-- OK - Receita --%>
        <c:if test = "${funcoesReceita}">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="far fa-file-alt"></i> Receita
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                  <c:if test = "${listarReceita || editarReceita || excluirReceita}">
                      <a class="dropdown-item" href="listar-receita">Consultar</a>
                  </c:if>
                  <c:if test = "${incluirReceita}">                
                      <a class="dropdown-item" href="incluir-receita">Incluir</a>
                  </c:if>
                  <div class="dropdown-divider"></div>
              </div>
            </li>
        </c:if>      

        <%-- OK - Atendimento --%>
        <c:if test = "${funcoesAtendimento}">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-briefcase-medical"></i> Atendimento
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                  <c:if test = "${listarAtendimento || editarAtendimento || excluirAtendimento}">
                      <a class="dropdown-item" href="listar-atendimento">Consultar</a>
                  </c:if>
                  <c:if test = "${incluirAtendimento}">
                      <a class="dropdown-item" href="incluir-atendimento">Incluir</a>
                  </c:if>
                  <div class="dropdown-divider"></div>
              </div>
            </li>      
        </c:if>

        <%-- OK - Medicamento --%>
        <c:if test = "${funcoesMedicamento}">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-pills"></i> Medicamentos
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                  <c:if test = "${listarMedicamento || editarMedicamento || excluirMedicamento}">
                      <a class="dropdown-item" href="listar-medicamento">Consultar</a>
                  </c:if>
                  <c:if test = "${incluirMedicamento}">
                      <a class="dropdown-item" href="incluir-medicamento">Incluir</a>
                  </c:if>
                  <div class="dropdown-divider"></div>
              </div>
            </li>
        </c:if>
      
      	<%-- Profissional --%>
        <c:if test = "${funcoesProfissional}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-md"></i> Profissionais
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                    <c:if test = "${listarMedico || editarMedico || excluirMedico}">
                        <a class="dropdown-item" href="listar-medico">Consultar Médico</a>
                    </c:if>
                    <c:if test = "${incluirMedico}">  
                        <a class="dropdown-item" href="incluir-medico">Incluir Médico</a>          
                    </c:if>
                    <div class="dropdown-divider"></div>
                    <c:if test = "${listarRecepcionista || editarRecepcionista || excluirRecepcionista}">
                        <a class="dropdown-item" href="listar-recepcionista">Consultar Recepcionista</a>
                    </c:if>
                    <c:if test = "${incluirRecepcionista}">
                        <a class="dropdown-item" href="incluir-recepcionista">Incluir Recepcionista</a>
                    </c:if>          
                    <div class="dropdown-divider"></div>
                </div>
            </li>
        </c:if>

      
        <%-- OK - Medico --%>
		<%--
        <c:if test = "${funcoesMedico}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-md"></i> Médicos
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                    <c:if test = "${listarMedico || editarMedico || excluirMedico}">
                        <a class="dropdown-item" href="listar-medico">Consultar</a>
                    </c:if>
                    <c:if test = "${incluirMedico}">  
                        <a class="dropdown-item" href="incluir-medico">Incluir</a>          
                    </c:if>
                    <div class="dropdown-divider"></div>
                </div>
            </li>
        </c:if>
		--%>

        <%-- OK - Paciente --%>
        <c:if test = "${funcoesPaciente}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-users"></i> Pacientes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                    <c:if test = "${listarPaciente || editarPaciente || excluirPaciente}">
                        <a class="dropdown-item" href="listar-paciente">Consultar</a>
                    </c:if>
                    <c:if test = "${incluirPaciente}">
                        <a class="dropdown-item" href="incluir-paciente">Incluir</a>
                    </c:if>          
                    <div class="dropdown-divider"></div>
                    <c:if test = "${listarHistoricoClinicoPaciente}">
                        <a class="dropdown-item" href="listar-historico-clinico-paciente-form">Exibir Historico</a>
                    </c:if>
                    <div class="dropdown-divider"></div>
                </div>
            </li>
        </c:if>

        <%-- OK - Recepcionista --%>
        <%-- 
        <c:if test = "${funcoesRecepcionista}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="far fa-id-card"></i> Recepcionista
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                    <c:if test = "${listarRecepcionista || editarRecepcionista || excluirRecepcionista}">
                        <a class="dropdown-item" href="listar-recepcionista">Consultar</a>
                    </c:if>
                    <c:if test = "${incluirRecepcionista}">
                        <a class="dropdown-item" href="incluir-recepcionista">Incluir</a>
                    </c:if>          
                    <div class="dropdown-divider"></div>
                </div>
            </li>
        </c:if>
      	--%>
      
        <%-- OK - Grupo --%>
        <c:if test = "${funcoesGrupo}">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="far fa-id-badge"></i> Autorizações
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                  <c:if test = "${listarGrupo || editarGrupo || excluirGrupo}">
                      <a class="dropdown-item" href="listar-grupo">Consultar Grupo</a>
                  </c:if>
                  <c:if test = "${incluirGrupo}">
                      <a class="dropdown-item" href="incluir-grupo">Incluir Grupo</a>
                  </c:if>          
                  <div class="dropdown-divider"></div>
                </div>
            </li>      
        </c:if>      
      
      <!-- 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-gear" aria-hidden="true"></i> Configuração
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
            <a class="dropdown-item" href="config" disabled><i class="fa fa-university" aria-hidden="true"></i> Gerais</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item disabled" href="#" disabled> Outras configurações</a>            
        </div>
      </li>      
      <li class="nav-item">
        <a class="nav-link" href="about"><i class="fa fa-info-circle" aria-hidden="true"></i> Sobre</a>
      </li>
       -->
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
          <li class="nav-item">
            <div class="nav-link"><i class="far fa-user"></i> <b>${usuarioLogado.nome}</b> </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/logout"><i class="fa fa-sign-out-alt" aria-hidden="true"></i> Sair</a>
          </li>
    </ul>  
    
    <%-- 
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    --%>
  </div>
</nav>
<%-- ################################################################################################## --%>
<%-- FIM DO MENU --%>
<%-- ################################################################################################## --%>
