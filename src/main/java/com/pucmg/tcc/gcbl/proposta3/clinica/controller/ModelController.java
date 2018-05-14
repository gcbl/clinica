package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

public abstract class ModelController {

    public abstract String getModel();
    
    public String getViewPath(){
        return "views/" + getModel() + "/" + getModel() + "-"; // Exemplo: views/exame/exame-
    }
    
    

}
