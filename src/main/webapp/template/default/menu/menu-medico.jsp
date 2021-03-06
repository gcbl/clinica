<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home">
  <span class="fa-stack fa-lg fa-2x">
	    <i class="fas fa-medkit fa-stack-1x text-info"></i>
  </span>TCC MED
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
 <!-- 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-notes-medical"></i> Atendimento
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="#">Emitir receita</a>
          <a class="dropdown-item" href="#">Receber exame</a>
          <a class="dropdown-item disabled" href="#">-</a>
          <a class="dropdown-item disabled" href="#">-</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">-</a>
        </div>
      </li>
 -->      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-calendar-alt"></i> Agenda
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="exibir-calendario-vagas-agendamento">Exibir Calendário</a>
          <a class="dropdown-item" href="incluir-agendamento">Agendar "Encaixe"</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="pesquisar-agendamento">Pesquisar Agendamentos</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="incluir-agendaForm">Criar agenda</a>
		  <a class="dropdown-item" href="listar-agendamento">Listar Agendamentos</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="exibir-calendario-agendamento"><i class="fas fa-flask"></i> Exibir Marcações Calendario</a>
          <a class="dropdown-item" href="exibir-calendario-vagas-agendamento"><i class="fas fa-flask"></i> Exibir Vagas Calendario</a>
          <a class="dropdown-item" href="incluir-consulta-agendamento"><i class="fas fa-flask"></i> Marcar Consulta</a>
        </div>
      </li>        
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-vials"></i> Exame
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-exame">Consultar</a>
          <a class="dropdown-item" href="incluir-exame">Incluir</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="listar-solicitacaoExame">Listar Solicitações de Exames</a>
          <a class="dropdown-item" href="incluir-solicitacaoExame">Solicitar exame</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="listar-resultadoExame">Listar Resultado de Exames</a>
          <a class="dropdown-item" href="incluir-resultadoExame">Receber resultado</a>
                    
          <a class="dropdown-item disabled" href="#">Receber exame</a>
        </div>
      </li>      

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-file-alt"></i> Receita
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-receita">Consultar</a>
          <a class="dropdown-item" href="incluir-receita">Incluir</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>      

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-file-alt"></i> Atendimento
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-atendimento">Consultar</a>
          <a class="dropdown-item" href="incluir-atendimento">Incluir</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>      

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-pills"></i> Medicamentos
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-medicamento">Consultar</a>
          <a class="dropdown-item" href="incluir-medicamento">Incluir</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-md"></i> Médicos
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-medico">Consultar</a>
          <a class="dropdown-item" href="incluir-medico">Incluir</a>          
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-users"></i> Pacientes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-paciente">Consultar</a>
          <a class="dropdown-item" href="incluir-paciente">Incluir</a>          
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="listar-historico-clinico-paciente-form">Exibir Historico</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-id-card"></i> Recepcionista
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
          <a class="dropdown-item" href="listar-recepcionista">Consultar</a>
          <a class="dropdown-item" href="incluir-recepcionista">Incluir</a>          
          <div class="dropdown-divider"></div>
          <a class="dropdown-item disabled" href="#">Estatisticas</a>
        </div>
      </li>      
      
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
            <div class="nav-link"><i class="far fa-user"></i> <b>${principalLogado.principal.nome}</b> </div>
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