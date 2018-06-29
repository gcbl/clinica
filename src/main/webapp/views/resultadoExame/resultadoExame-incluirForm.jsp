<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>




<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <form:form action="${acao}-${MODEL}" class="form-horizontal" modelAttribute="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    
                    
                    <!-- Form Name -->
                    <hr>
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente">Paciente:</label>  
                      <div class="col-md-4">
                          <form:select path="paciente" id="paciente" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty resultadoExame}">
                                  <form:option value="${resultadoExame.paciente.id}" label="${resultadoExame.paciente.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="paciente" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="resultado">Resultado do exame:</label>  
                      <div class="col-md-4">
                      <form:textarea path="resultado" placeholder="Digite aqui o resultado do exame" class="form-control input-md"/> <form:errors path="resultado" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe a concentração e forma farmaceutica ou uma breve descrição </span> -->  
                      </div>
                    </div>     
                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="disponibilizadoPaciente">disponibilizadoPaciente:</label>  
                      <div class="col-md-4">
                      <form:checkbox path="disponibilizadoPaciente" /></td>
                      <form:errors path="disponibilizadoPaciente" cssClass="text-danger" /></td>
                      <%-- <form:input path="disponibilizadoPaciente" placeholder="disponibilizadoPaciente" class="form-control input-md"/> <form:errors path="disponibilizadoPaciente" cssClass="text-danger" /> --%>
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
        
        $('#medico').select2({
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
     
        $('#medicamentos').select2({
            placeholder: "Selecione os medicamentos",
            language: "pt-BR",
            theme: "bootstrap",
            allowClear: true,
            minimumInputLength: 1,
            closeOnSelect: true,
            ajax: {
                url: 'api/listar-medicamento-json',
                dataType: 'json',
                processResults: function (data, params) {
                      
                      var resultsData = $.map(data, function (obj) {
                        obj.id = obj.id || obj.nomeCompleto; // replace name with the property used for the text
                        obj.text = obj.text || obj.nomeCompleto; // replace name with the property used for the text
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