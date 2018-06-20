<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="pt-BR">
    <head>
        <tiles:insertAttribute name="head" />
    </head>
<body>

    <tiles:insertAttribute name="cabecalhoPublico" />
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-1">&nbsp;</div>
        <div class="col-sm-10">
          <tiles:insertAttribute name="body" />
        </div>
        <div class="col-sm-1">&nbsp;</div>
      </div>
    </div>    
        
 
<%--
    <div class="content">
        <tiles:insertAttribute name="body" />
    </div>
 --%>
     <tiles:insertAttribute name="rodapePublico" />

</body>
</html>