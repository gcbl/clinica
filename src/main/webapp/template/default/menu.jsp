<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home">
  <%-- <img src="http://www.tre-sp.jus.br/temas/imagens/logo-tre-df.png" alt="Logo Tribunal Regional Eleitoral do Distrito Federal"> --%>
  <%--<img width="10%" height="10%" src="data:image/png;base64,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" alt="" /> --%>  
  <%-- <img width="10%" height="10%" src="https://seeklogo.com/images/B/bitcoin-logo-DDAEEA68FA-seeklogo.com.png"> --%>
  <span class="fa-stack fa-lg fa-2x">
	    <i class="fas fa-medkit fa-stack-1x text-info"></i>
  </span>NOME
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
            <div class="nav-link"><i class="far fa-user"></i> <b>${usuarioLogado.nom}</b> </div>
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