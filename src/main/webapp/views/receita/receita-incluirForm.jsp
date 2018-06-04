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
                    
                    
                    
                    <!-- Form Name -->
                    <hr>
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Paciente:</label>  
                      <div class="col-md-4">
                      <form:select path="paciente" items="${pacienteList}" itemLabel="nome" itemValue="id" /> <form:errors path="paciente" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome genérico do medicamento</span> -->   
                      </div>
                    </div>

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Medico:</label>  
                      <div class="col-md-4">
                      <form:select path="medico" items="${medicoList}" itemLabel="nome" itemValue="id" /> <form:errors path="medico" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome genérico do medicamento</span> -->   
                      </div>
                    </div>
                    
                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Medicamento:</label>  
                      <div class="col-md-4">
                      <form:select path="medicamentos" items="${medicamentoList}" itemLabel="nomeGenerico" itemValue="id" multiple="true" />
                      <br>
                      <form:errors path="medicamentos" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome genérico do medicamento</span> -->   
                      </div>
                    </div>                

                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="conteudo">Conteúdo da receita:</label>  
                      <div class="col-md-4">
                      <form:textarea path="conteudo" placeholder="Exemplo: 1 comprimido de 8 em 8 horas" class="form-control input-md"/> <form:errors path="conteudo" cssClass="text-danger" />
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
 
    </tiles:putAttribute>
</tiles:insertDefinition>