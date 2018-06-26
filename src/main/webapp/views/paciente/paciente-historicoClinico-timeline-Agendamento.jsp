<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>

    <!-- timeline item 1 -->
    <div class="row">
        <div class="col-auto text-center flex-column d-none d-sm-flex">
            <div class="row h-50">
                <div class="col border-right">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
            <h5 class="m-2">
                <span class="badge badge-pill bg-info border">&nbsp;</span>
            </h5>
            <div class="row h-50">
                <div class="col border-right">&nbsp;</div>
                <div class="col">&nbsp;</div>
            </div>
        </div>
        <div class="col py-2">
            <div class="card">
                <div class="card-body">
                    <div class="float-right text-muted">${historicoClinicoSession.dataCriacao}</div>
                    <h4 class="card-title"><i class="far fa-calendar-alt"></i> ${TIPO}</h4>
                    <p>
                    id: ${historicoClinicoSession.id}
                    <br>Médico solicitante: ${historicoClinicoSession.medico.nome}
                    
                     ${historicoClinicoSession}
                    </p>
                    
                    <%--
                    <button class="btn btn-sm btn-outline-secondary" type="button" data-target="#t2_details_${historicoClinicoSession.id}" data-toggle="collapse">Medicamentos prescritos</button>
                    <div class="collapse border" id="t2_details_${historicoClinicoSession.id}">
                        <div class="p-2 ">
                            <br>
                            <c:forEach items="${historicoClinicoSession.medicamentos}" var="itemList">
                                <li>${itemList.nomeCompleto}</li>
                            </c:forEach>
                            <br>
                            <c:if test="${not empty historicoClinicoSession.conteudo}">
                                Conteúdo: ${historicoClinicoSession.conteudo}
                            </c:if>
                        </div>
                    </div>
                     --%>
                </div>
            </div>
        </div>
    </div>
    <!--/row-->