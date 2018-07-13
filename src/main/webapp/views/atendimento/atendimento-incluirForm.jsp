<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
        <sec:authorize access="hasRole('ROLE_INCLUIR_ATENDIMENTO'  )" var="roleAtenderPaciente"  /> 
 
        <%-- So pode atender paciente se tem a ROLE e se é a mesma pessoa logada --%>
        <c:set var="podeAtenderPaciente"  scope="session" value="${roleAtenderPaciente && (medicoLogado eq atendimento.medico)}"/>    
        
        <div class="body">
        
            <c:if test = "${podeAtenderPaciente}">
      
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
                              <c:if test="${not empty atendimento}">
                                  <form:option value="${atendimento.paciente.id}" label="${atendimento.paciente.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="paciente" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->   
                      </div>
                    </div>

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="medico">Medico:</label>  
                      <div class="col-md-4">
                          <form:select path="medico" id="medico" style="width: 100%">
                              <%-- No caso de estar editando --%>
                              <c:if test="${not empty atendimento}">
                                  <form:option value="${atendimento.medico.id}" label="${atendimento.medico.nome}" />
                              </c:if>
                          </form:select>
                          <form:errors path="medico" cssClass="text-danger" />
                          <!-- <span class="help-block">texto de help-block</span> -->
                      </div>
                    </div>
                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="conteudo">Conteúdo da atendimento:</label>  
                      <div class="col-md-4">
                      <form:textarea path="conteudo" placeholder="Descreva queixas, sintomas, história clínica e procedimentos" class="form-control input-md"/> <form:errors path="conteudo" cssClass="text-danger" />
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

            </c:if>
            <c:if test = "${!podeAtenderPaciente}">
                Este atendimento está marcado para <b>${atendimento.medico.nome}</b> e não para você, <b>${medicoLogado.nome}</b>.
            </c:if>
            
            
            
            
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
	        placeholder: "Selecione o médico atendente",
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

	    // TODO: Fazer esta validacao no servidor
	    // Se ja vem com medico preenchido desabilita
	    if($('#medico').val().length > 0){
	    	$("#medico").prop("disabled", true);
	    }
	 
	 
});

<c:if test="${not empty ATENDER}">
	// Desabilita os selects se for um atendimento
	$("#paciente").prop("disabled", true);
    $("#medico").prop("disabled", true);
 
 	// Habilita novamente ao submeter
    $("#${acao}-${MODEL}").submit(function() {
	    $("#paciente").prop("disabled", false);
    	$("#medico").prop("disabled", false);
    });
</c:if>
 
 </script>
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>