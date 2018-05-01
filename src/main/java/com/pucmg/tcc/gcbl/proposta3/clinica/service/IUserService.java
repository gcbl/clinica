package com.pucmg.tcc.gcbl.proposta3.clinica.service;


import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;

public interface UserService {
    public User findUserByEmail(String email);
    public void saveUser(User user);
}