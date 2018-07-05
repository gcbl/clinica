<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1 class="animated bounceIn text-danger">Acesso negado!</h1>

            <p class="text-danger">Acesso negado!</p>
            
            <hr>
            ${usuarioLogado}
            <hr>
            ${usuarioLogado.principal.authorities}
            <hr>
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>