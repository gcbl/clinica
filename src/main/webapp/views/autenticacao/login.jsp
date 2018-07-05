<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tiles:insertDefinition name="templatePublico">
    <tiles:putAttribute name="body">

<style>
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}

</style>    


        <div class="body">
      
            <!-- ------------------------------------------- -->
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <h1 class="text-center login-title">Efetue autenticação para continuar no sistema</h1>
                        <div class="account-wall">
                            <div class="text-center"><h3><b>SisClinica</b></h3></div>
                            <!-- <img class="profile-img" src="https://cdn2.iconfinder.com/data/icons/medical-12-1/512/xxx017-256.png"> -->
                            <img class="profile-img" src="resources/static/images/logo.png">
                            <div class="text-center"><h4>Sistema de Administração de Clínicas</h4></div>
                            
                            <hr>
                            <c:if test="${loginErrado}">
                                <h5 class="text-danger text-center">Email ou senha inválida, por favor verifique.</h5>
                            </c:if>
                            <form class="form-signin" action="/login" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>                            
                                <input type="text"     class="form-control" name="username" value="teste@teste.com" placeholder="Email" required autofocus>
                                <input type="password" class="form-control" name="password" value="teste" placeholder="Senha"     required>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar no sistema</button>
                            </form>
                        </div>
                        <c:if test="${not empty versao}">
                            <div class="text-center font-weight-light font-italic"><small>v. ${versao}</small></div>
                        </c:if>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            
            <!-- ------------------------------------------- -->

        </div>



    </tiles:putAttribute>
</tiles:insertDefinition>