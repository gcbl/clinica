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

                <form:form action="${acao}-consulta-${MODEL}" class="form-horizontal " modelAttribute="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    <!-- Form Name -->
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">Marcar Consulta: ${acao} ${MODEL}</h2>
                    <br><br>                    

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="paciente">Paciente:</label>  
                      <div class="col-md-4">
                          <form:select path="paciente" id="paciente" style="width: 100%">
                              <!-- No caso de estar editando -->
                              <c:if test="${not empty agendamento}">
                                  <form:option value="${agendamento.paciente.id}" label="${agendamento.paciente.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="paciente" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>  

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medico">M�dico :</label>  
                      <div class="col-md-4">
                          <form:select path="medico" id="medico" style="width: 100%">
                              <!-- No caso de estar editando -->
                              <c:if test="${not empty agendamento}">
                                  <form:option value="${agendamento.medico.id}" label="${agendamento.medico.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="medico" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="data">Data:</label>  
                      <div class="col-md-4">
                        <select id="selectAgendamento" name="selectAgendamento" size="1" class="form-control" style="width: 100%">
                            <option></option>
                        </select>
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
            placeholder: "Selecione o m�dico",
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
        
        $("#selectAgendamento").select2({
        	  placeholder: 'Selecione o hor�rio',
        	  language: "pt-BR",
        	  theme: "bootstrap",
        	  allowClear: true,
              minimumInputLength: 1,
              closeOnSelect: true,        	  
        	  ajax: {
        	    url: 'api/listar-horario-vago-json',
        	    type: 'GET',
        	    dataType: 'json',
        	    data: function (params) {
        	      return {
        	        idMedico: $("#medico").val(),
        	        //debug: JSON.stringify(params, null, 2),
        	        _type: params._type,
        	        term: params.term,
        	        q: params.term
        	      }
        	    },
        	    processResults: function (data, params) {
                        var resultsData = $.map(data, function (obj) {
                        obj.id = obj.id || obj.horarioCompleto; // replace name with the property used for the id
                        obj.text = obj.text || obj.horarioCompleto; // replace name with the property used for the text
                        return obj;
                      });
    
                      return {
                        results: resultsData
                      };
                  },        	    
        	  }
        });        
        
        $('#horarioVago').select2({
            placeholder: "Selecione o horario",
            language: "pt-BR",          
            theme: "bootstrap",
            allowClear: true,
            minimumInputLength: 1,
            closeOnSelect: true,
            ajax: {
            	url: 'api/listar-horario-vago-json',
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