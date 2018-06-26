<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>
						
    <!-- timeline item 2 -->
    <div class="row">
        <div class="col-auto text-center flex-column d-none d-sm-flex">
            <div class="row h-50">
                <div class="col border-right">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
            <h5 class="m-2">
                <span class="badge badge-pill bg-success">&nbsp;</span>
            </h5>
            <div class="row h-50">
                <div class="col border-right">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
        </div>
        <div class="col py-2">
            <div class="card border-success">
                <div class="card-body">
                    <div class="float-right text-success">${historicoClinicoSession.dataCriacao}</div>
                    <h4 class="card-title text-success">${TIPO}</h4>
                    <p class="card-text">
                    id: ${historicoClinicoSession.id}
                    <br>Data da Solicitação: ${historicoClinicoSession.dataSolicitacao}
                    <br>Médico solicitante: ${historicoClinicoSession.medicoSolicitante.nome}

                    </p>
                    <button class="btn btn-sm btn-outline-secondary" type="button" data-target="#t2_details_${historicoClinicoSession.id}" data-toggle="collapse">Exames solicitados</button>
                    <div class="collapse border" id="t2_details_${historicoClinicoSession.id}">
                        <div class="p-2 ">
                        	<br>
                            <c:forEach items="${historicoClinicoSession.exames}" var="itemList">
                            	<li>${itemList.nome}</li>
                            </c:forEach>
                            <br>
                            <c:if test="${not empty historicoClinicoSession.observacao}">
							    Observação: ${historicoClinicoSession.observacao}
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/row-->
						