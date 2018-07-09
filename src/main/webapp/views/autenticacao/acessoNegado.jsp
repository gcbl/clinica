<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 
 
        <div class="body">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="animated fadeIn">
                        <div class="alert alert-warning show animated bounceIn" role="alert">
                          <h3 class="text-center">Acesso negado!</h3>
                          <br><hr><br>
                          <h4 class="text-center">Você não tem permissão para acessar esta funcionalidade.<br>Entre em contato com o adminstrador do sistema.</h4>
                        </div>
                    </div>
                    <br><br>
                                
                </div>
                <div class="col-2"></div>

            <hr>
            
            
        </div>
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>