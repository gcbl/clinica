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

                <form:form action="${acao}-${MODEL}" class="form-horizontal " modelAttribute="${MODEL}" id="${acao}-${MODEL}">
                    <fieldset>
                    
                    
                    
                    <!-- Form Name -->
                    <hr>
                    <c:if test = "${acao != ACAO_INCLUIR}">
                       <form:hidden path="id" placeholder="id" class="form-control input-md"/> <form:errors path="id" cssClass="text-danger" />
                    </c:if>
                    
                    <h2 class="text-capitalize">${acao} ${MODEL}</h2>
                    <br><br>                    

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="dataSolicitacao">Nome:</label>  
                      <div class="col-md-4">
                      <form:input path="nome" placeholder="nome" class="form-control input-md"/>
                      <form:errors path="nome" cssClass="text-danger" />
                      <!-- <span class="help-block">help block</span> -->  
                      </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="descricao">Descricao:</label>  
                      <div class="col-md-4">
                      <form:input path="descricao" placeholder="descricao" class="form-control input-md"/> <form:errors path="descricao" cssClass="text-danger" />
                      <!-- <span class="help-block">Informe a concentra��o e forma farmaceutica ou uma breve descri��o </span> -->  
                      </div>
                    </div>                      

                    <!-- Select input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="permissoes">Permiss�es:</label>  
                      <div class="col-md-4"> 
                          <%--
                          <form:select path="permissoes" multiple="true" style="width: 100%">
                              <!-- No caso de estar editando -->
                              <c:if test="${not empty todasPermissoes}">
                                  <form:options items="${todasPermissoes}" itemValue="id" itemLabel="nome"/>
                              </c:if>
                          </form:select>
                          --%>
                          
                          <!-- <span class="help-block">texto de help-block</span> -->
                          <form:checkboxes items="${permissoesList}" path="permissoes" delimiter="<br/><br/>" itemLabel="nome" data-toggle="toggle" data-on="<i class='fas fa-lock-open'></i>" data-off="<i class='fas fa-lock'></i>" data-onstyle="success" data-offstyle="danger" data-style="android"/>
                          <form:errors path="permissoes" cssClass="text-danger" />
                          
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
 
        $('#permissoes2').select2({
            placeholder: "Selecione as permiss�es",
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