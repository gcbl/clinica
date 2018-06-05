<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
        <div class="body">

                <form:form action="${acao}-${MODEL}" class="form-horizontal" modelAttribute="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    <!-- Form Name -->
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nomeGenerico">Nome genérico</label>  
                      <div class="col-md-4">
                      <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                      <form:input path="nomeGenerico" placeholder="Nome genérico" class="form-control input-md"/> <form:errors path="nomeGenerico" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome genérico do medicamento</span> -->   
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nomeFabrica">Nome de Fábrica</label>  
                      <div class="col-md-4">
                      <form:input path="nomeFabrica" placeholder="Nome de Fábrica" class="form-control input-md"/> <form:errors path="nomeFabrica" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome de fábrica do medicamento</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="fabricante">Fabricante</label>  
                      <div class="col-md-4">
                      <form:input path="fabricante" placeholder="Fabricante" class="form-control input-md"/> <form:errors path="fabricante" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe o nome do fabricante do medicamento</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="concentracaoFormaFarmaceutica">Concentraçãoo e Forma Farmaceutica</label>  
                      <div class="col-md-4">
                      <form:input path="concentracaoFormaFarmaceutica" placeholder="Exemplo: Suspensão oral 15mg/ml" class="form-control input-md"/> <form:errors path="concentracaoFormaFarmaceutica" cssClass="text-danger" />
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