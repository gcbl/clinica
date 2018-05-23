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
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="nome">Nome:</label>  
                      <div class="col-md-4">
                      <form:input path="nome" placeholder="Nome" class="form-control input-md"/> <form:errors path="nome" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cpf">Cpf:</label>  
                      <div class="col-md-4">
                      <form:input path="cpf" placeholder="Cpf" class="form-control input-md"/> <form:errors path="cpf" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="concentracaoFormaFarmaceutica">Data de nascimento:</label>  
                      <div class="col-md-4">
                      <form:input path="dataNascimento" placeholder="Data de nascimento" class="form-control input-md"/> <form:errors path="dataNascimento" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="endereco">Endereço:</label>  
                      <div class="col-md-4">
                      <form:input path="endereco" placeholder="endereco" class="form-control input-md"/> <form:errors path="endereco" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="bairro">Bairro:</label>  
                      <div class="col-md-4">
                      <form:input path="bairro" placeholder="bairro" class="form-control input-md"/> <form:errors path="bairro" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>   
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cep">CEP:</label>  
                      <div class="col-md-4">
                      <form:input path="cep" placeholder="cep" class="form-control input-md"/> <form:errors path="cep" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div> 
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="cidade">Cidade:</label>  
                      <div class="col-md-4">
                      <form:input path="cidade" placeholder="cidade" class="form-control input-md"/> <form:errors path="cidade" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div> 
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="estado">Estado:</label>  
                      <div class="col-md-4">
                      <form:input path="estado" placeholder="estado" class="form-control input-md"/> <form:errors path="estado" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div> 

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="planoSaude">Plano de Saúde:</label>  
                      <div class="col-md-4">
                      <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                      <form:input path="planoSaude" placeholder="Plano de Saúde" class="form-control input-md"/> <form:errors path="planoSaude" cssClass="text-danger" />
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
            
            <hr>
           
        </div>
 
    </tiles:putAttribute>
</tiles:insertDefinition>