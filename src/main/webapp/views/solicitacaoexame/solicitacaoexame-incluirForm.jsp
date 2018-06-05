<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <form:form action="${acao}-${MODEL}" class="form-horizontal " commandName="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    <hr>
                    <br>form:errors: <form:errors/>
                    <br>form:errors path: <form:errors path="*" cssClass="error" />
                    <hr>
                    
                    <!-- Form Name -->
                    <hr>
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="dataSolicitacao">Data da Solicitação:</label>  
                      <div class="col-md-4">
                          <form:input path="dataSolicitacao" placeholder="dd/mm/aaa" class="form-control input-md"/> <form:errors path="dataSolicitacao" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Paciente:</label>  
                      <div class="col-md-4">
                          <form:select path="paciente" id="paciente" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty solicitacaoexame}">
                                  <form:option value="${solicitacaoexame.paciente.id}" label="${solicitacaoexame.paciente.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="paciente" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->
                      </div>
                    </div>

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Médico Solicitante:</label>  
                      <div class="col-md-4">
                          <form:select path="medicoSolicitante" id="medicoSolicitante" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty solicitacaoexame}">
                                  <form:option value="${solicitacaoexame.medicoSolicitante.id}" label="${solicitacaoexame.medicoSolicitante.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="medicoSolicitante" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->
                      </div>
                    </div>
                    
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Exames:</label>  
                      <div class="col-md-4">
                          <form:select path="exames" multiple="true" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty solicitacaoexame}">
                                  <form:options items="${solicitacaoexame.exames}" itemValue="id" itemLabel="nome"/>
                              </c:if>
                          </form:select>
                          <form:errors path="exames" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>                

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="observacao">Observação:</label>  
                      <div class="col-md-4">
                      <form:textarea path="observacao" placeholder="Exemplo: o exame deve ser feito com no mínimo 8 horas de jejum" class="form-control input-md"/> <form:errors path="observacao" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe a concentração e forma farmaceutica ou uma breve descrição </span> -->  
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
            
            <hr>
           
        </div>
 
 <script>
 $(document).ready(function() {
 
        $('#paciente').select2({
              placeholder: "Selecione o paciente",
              language: "pt-BR",          
              theme: "bootstrap",
              allowClear: true,
              minimumInputLength: 1,
              closeOnSelect: true,
              ajax: {
                  url: 'api/listar-paciente-json',
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
        
        $('#medicoSolicitante').select2({
            placeholder: "Selecione o médico solicitante",
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
     
        $('#exames').select2({
            placeholder: "Selecione os exames",
            language: "pt-BR",
            theme: "bootstrap",
            allowClear: true,
            minimumInputLength: 1,
            closeOnSelect: true,
            ajax: {
                url: 'api/listar-exame-json',
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