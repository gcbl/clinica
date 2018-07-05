<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1 class="animated fadeInLeft">Bem vindo INICIO</h1>

            <p>${usuarioLogado}</p>
            
            <hr>
            ${usuarioLogado.principal.authorities}
            <hr>
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>