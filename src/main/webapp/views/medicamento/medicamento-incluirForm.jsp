<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1>Medicamentos</h1>
    
<hr><hr>
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Inserir medicamento</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nomeGenerico">Nome gen�rico</label>  
  <div class="col-md-4">
  <input id="nomeGenerico" name="nomeGenerico" placeholder="Nome gen�rico" class="form-control input-md" required="" type="text">
  <span class="help-block">Informe o nome gen�rico do medicamento</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nomeFabrica">Nome de F�brica</label>  
  <div class="col-md-4">
  <input id="nomeFabrica" name="nomeFabrica" placeholder="Nome de Fabrica" class="form-control input-md" required="" type="text">
  <span class="help-block">Informe o nome de f�brica do medicamento</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fabricante">Fabricante</label>  
  <div class="col-md-4">
  <input id="fabricante" name="fabricante" placeholder="Fabricante" class="form-control input-md" required="" type="text">
  <span class="help-block">Informe o nome do fabricante do medicamento</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="concentracaoFormaFarmaceutica">Concentra��oo e Forma Farmaceutica</label>  
  <div class="col-md-4">
  <input id="concentracaoFormaFarmaceutica" name="concentracaoFormaFarmaceutica" placeholder="Exemplo: Suspens�o oral 15mg/ml" class="form-control input-md" required="" type="text">
  <span class="help-block">Informe a concentra��o e forma farmaceutica ou uma breve descri��o </span>  
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <div class="col-md-4">
    <button id="btnSalvar" name="btnSalvar" class="btn btn-primary">Salvar</button>
  </div>
</div>

</fieldset>
</form>

<hr><hr>    
            
<%--           
            <!-- ----------------- -->
            <form class="form-horizontal">
             <fieldset>
         
              <!-- Form Name -->
              <legend>Medicamentos</legend>
         
              <!-- Text input-->
              <div class="form-group">
                  <label class="col-md-4 control-label" for="txtNomeGenerico">Nome gen�rico</label>
                  <div class="col-md-4">
                      <input id="txtNomeGenerico" name="txtNomeGenerico" placeholder="nome gen�rico" class="form-control input-md" required="" type="text">
                      <span class="help-block">Informe o nome gen�rico do medicamento</span>
                  </div>
              </div>
         
              <!-- Text input-->
              <div class="form-group">
                  <label class="col-md-4 control-label" for="txtNomeFabrica">Nome de f�brica</label>
                  <div class="col-md-4">
                      <input id="txtNomeFabrica" name="txtNomeFabrica" placeholder="nome de f�brica" class="form-control input-md" required="" type="text">
                      <span class="help-block">Informe o nome de f�brica/comercial do medicamento</span>
                  </div>
              </div>
         
              <!-- Text input-->
              <div class="form-group">
                  <label class="col-md-4 control-label" for="txtConcentracaoFormaFarmaceutica">Concentra��o/Forma Farmac�utica</label>
                  <div class="col-md-4">
                      <input id="txtConcentracaoFormaFarmaceutica" name="txtConcentracaoFormaFarmaceutica" placeholder="concentra��o/forma farmac�utica" class="form-control input-md" required="" type="text">
                      <span class="help-block">Informe a concentra��o ou forma farmac�utica do medicamento</span>
                  </div>
              </div>
         
              <!-- Button -->
              <div class="form-group">
                  <!-- <label class="col-md-4 control-label" for="btnSubmit">Salvar</label> -->
                  <div class="col-md-4">
                      <button id="btnSubmit" name="btnSubmit" class="btn btn-primary">Salvar</button>
                  </div>
              </div>
         
             </fieldset>
            </form>
            <!-- ----------------- -->
--%>
            
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>