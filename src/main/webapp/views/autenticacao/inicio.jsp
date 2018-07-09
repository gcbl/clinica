<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <h1 class="animated fadeInLeft">Bem vindo ${usuarioLogado.principal.usuario.primeiroNome}!</h1>

            <br><br><br>
            
            <p>O que você gostaria de fazer?</p>
            
            <hr>
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>