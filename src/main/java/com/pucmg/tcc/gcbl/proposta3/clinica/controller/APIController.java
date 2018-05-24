package com.pucmg.tcc.gcbl.proposta3.clinica.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Exame;
import com.pucmg.tcc.gcbl.proposta3.clinica.service.ExameService;
import com.pucmg.tcc.gcbl.proposta3.clinica.util.Constantes;


@Controller
@RequestMapping("/privado/api/**")
public class APIController extends BaseController {
    
    private static Log log = LogFactory.getLog(APIController.class);
    
    @Autowired
    private ExameService modelService;


    // -----------------------------------------------------------------------------------
    
    @ResponseBody
    @RequestMapping(value={"/listar-exame-json"}, method = RequestMethod.GET)
    public List<Exame> consultarJson(@RequestParam("q") String q){
        List<Exame> itemList = modelService.findByNomeContainingIgnoreCase(q);
        return itemList;
    }    

    @ResponseBody
    @RequestMapping(value={"/listar-all-exame-json-"}, method = RequestMethod.GET)
    public List<Exame> consultarJson(){
        List<Exame> itemList = modelService.findAll();
        return itemList;
    }    
    

}