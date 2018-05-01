package com.pucmg.tcc.gcbl.proposta3.clinica.service;


import java.util.Arrays;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pucmg.tcc.gcbl.proposta3.clinica.model.Role;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.User;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.RoleRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.UserRepository;

@Service("userService")
public class UserService implements IUserService{

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Override
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepository.findByRole("ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

}