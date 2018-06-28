<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<%@ page session="true"%>
<%@ page isELIgnored="false"%>
						
    <!-- timeline item 4 -->
    <div class="row">
        <div class="col-auto text-center flex-column d-none d-sm-flex">
            <div class="row h-50">
                <div class="col">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
            <h5 class="m-2">
                <i class="far fa-address-card fa-fw fa-2x"></i>
                <!-- <span class="badge badge-pill bg-primary border">&nbsp;</span> -->
            </h5>            
            <div class="row h-50">
                <div class="col">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
        </div>
        <div class="col py-2">
            <div class="card shadow">
                <div class="card-body">
                    <div class="float-right text-muted">${paciente.dataCriacao}</div>
                    <h4 class="card-title"><i class="far fa-address-card"></i> Ficha pessoal de <b>${paciente.nome}</b>:</h4>
                    <div class="">
                        <div class="row">
                            <div class="col-sm-3">
                              <br><b>Nome:</b> ${paciente.nome}
                              <br><b>Data de Nascimento:</b> <fmt:formatDate value="${paciente.dataNascimento}" pattern="dd/MM/yyyy"/>
                              <br><b>Idade:</b> ${paciente.idade}
                              <br><b>CPF:</b> ${paciente.cpf}
                              <br>
                              <br><b>Plano de Saúde:</b> ${paciente.planoSaude}
                            </div>
                            <div class="col-sm-3">
                              <br><i class="fas fa-map-marker-alt"></i> <b>Endereço:</b>
                              <br>${paciente.endereco}
                              <br>Bairro: ${paciente.bairro}
                              <br>${paciente.cidade} - ${paciente.estado}
                              <br>CEP: ${paciente.cep}
                              <br><br>
                            </div>
                        </div>
                    </div>                    
                    
                </div>
            </div>
        </div>
    </div>
    <!--/row-->
						