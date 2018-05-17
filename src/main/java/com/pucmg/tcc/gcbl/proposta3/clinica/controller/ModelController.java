package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class ModelController {

    public String getViewPath(){
        return "views/" + getModelName() + "/" + getModelName() + "-"; // Exemplo: views/exame/exame-
    }
    

    @ModelAttribute(BaseController.MODEL_STR)
    public String getModelName() {
        String modelName = getModelClass().getSimpleName().toLowerCase();
        return modelName;
    }    
    
    protected abstract Class getModelClass();

}
