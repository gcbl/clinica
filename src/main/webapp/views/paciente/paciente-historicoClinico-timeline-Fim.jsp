<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>
						
    <!-- timeline item 1 -->
    <div class="row">
        <!-- timeline item 1 left dot -->
        <div class="col-auto text-center flex-column d-none d-sm-flex">
            <div class="row h-50">
                <div class="col">&nbsp;</div>
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
        <!-- timeline item 1 event content -->
        <div class="col py-2">
            <div class="card shadow">
                <div class="card-body">
                    <div class="float-right text-muted">&nbsp;</div>
                    <h4 class="card-title">Fim hist�rico cl�nico ${historicoClinicoSession.paciente.nome}</h4>
                    <!-- <p class="card-text">&nbsp;</p> -->
                </div>
            </div>
        </div>
    </div>
    <!--/row-->


						