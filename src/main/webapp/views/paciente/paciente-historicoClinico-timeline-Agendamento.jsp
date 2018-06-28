<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

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
                    <div class="">
                        <br>
                        <div><i class="fas fa-user-md"></i> <b>M�dico:</b> <div>${historicoClinicoSession.medico.nome}</div> </div>
                        <br>
                        <div><i class="far fa-clock"></i> <b>Hor�rio:</b> <div>${historicoClinicoSession.horarioCompleto}</div>  </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/row-->