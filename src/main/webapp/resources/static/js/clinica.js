
$(document).ready(function(){
	
	// ---------
	
	// ---------
	

});


function retirarFormatacao(campoTexto) {
    campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g,"");
}

function mascaraCpf(valor) {
    return valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g,"\$1.\$2.\$3\-\$4");
}

// --------------------------------------------------------------------

function habilitaBotao(idBotao, classe){
	$('#' + idBotao).prop("disabled", false);
	setButtonClass(idBotao, classe)
}

function desabilitaBotao(idBotao, classe){
    $('#' + idBotao).prop("disabled", true);
    setButtonClass(idBotao, classe)
}

function setButtonClass(idBotao, classe){    
    $('#' + idBotao).removeClass();
    $('#' + idBotao).addClass('btn');
    $('#' + idBotao).addClass(classe);
}