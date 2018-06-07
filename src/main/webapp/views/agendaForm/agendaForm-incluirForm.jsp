<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <form:form action="${acao}-${MODEL}" class="form-horizontal " modelAttribute="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    <!-- Form Name -->
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="data">Data inicial:</label>  
                      <div class="col-md-4">
                      <form:input path="dataInicio" placeholder="dd/MM/aaaa" class="form-control input-md"/>
                      <form:errors path="dataInicio" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="dataFim">Data final:</label>  
                      <div class="col-md-4">
                      <form:input path="dataFim" placeholder="dd/MM/aaaa" class="form-control input-md"/>
                      <form:errors path="dataFim" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="horaInicio">Hora inicial:</label>  
                      <div class="col-md-4">
                      <form:input path="horaInicio" placeholder="Número entre 0 e 23" class="form-control input-md"/>
                      <form:errors path="horaInicio" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="horaFim">Hora final:</label>  
                      <div class="col-md-4">
                      <form:input path="horaFim" placeholder="Número entre 0 e 23" class="form-control input-md"/>
                      <form:errors path="horaFim" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>                    

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medico">Médico :</label>  
                      <div class="col-md-4">
                          <form:select path="medico" id="medico" style="width: 100%">
                              <!-- No caso de estar editando -->
                              <c:if test="${not empty agendaForm}">
                                  <form:option value="${agendaForm.medico.id}" label="${agendaForm.medico.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="medico" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="duracao">Duração do atendimento:</label>  
                      <div class="col-md-4">
                      <form:input path="duracao" placeholder="10, 15, 20, 30 ou 60" class="form-control input-md"/>
                      <form:errors path="duracao" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>                    

                    <!-- Button -->
                    <div class="form-group">
                      <div class="col-md-4">
                        <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Salvar</button>
                      </div>
                    </div>
                    
                    </fieldset>
                </form:form>
            
        </div>
 
 <script>
 $(document).ready(function() {
 
        $('#medico').select2({
            placeholder: "Selecione o médico",
            language: "pt-BR",        
            theme: "bootstrap",
            allowClear: true,
            minimumInputLength: 1,
            closeOnSelect: true,
            ajax: {
                url: 'api/listar-medico-json',
                dataType: 'json',
                processResults: function (data, params) {
                      
                      var resultsData = $.map(data, function (obj) {
                        obj.id = obj.id || obj.nome; // replace name with the property used for the text
                        obj.text = obj.text || obj.nome; // replace name with the property used for the text
                        return obj;
                      });

                      return {
                        results: resultsData
                      };
                    },
            }
        });
     
});
 </script>
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>