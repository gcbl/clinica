package com.pucmg.tcc.gcbl.proposta3.clinica.model.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.GrupoRepossitory;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.PermissaoRepository;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.UsuarioRepository;

@Component
public class CustomUserDetailsService implements UserDetailsService {
    
    @Autowired
    private UsuarioRepository usuarios;

    @Autowired
    private GrupoRepossitory grupos;
    
    @Autowired
    private PermissaoRepository permissoes;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarios.findByLogin(username);
        
        if (usuario == null) {
            throw new UsernameNotFoundException("Usuário não encontrado!");
        }
        
        return new UsuarioSistema(usuario.getNome(), usuario.getLogin(), usuario.getSenha(), authorities(usuario));
    }
    
    public Collection<? extends GrantedAuthority> authorities(Usuario usuario) {
        return authorities(grupos.findByUsuariosIn(usuario));
    }
    
    public Collection<? extends GrantedAuthority> authorities(List<Grupo> grupos) {
        Collection<GrantedAuthority> auths = new ArrayList<>();
        
        for (Grupo grupo: grupos) {
            List<Permissao> lista = permissoes.findByGruposIn(grupo);
            
            for (Permissao permissao: lista) {
                auths.add(new SimpleGrantedAuthority("ROLE_" + permissao.getNome()));
            }
        }
        
        return auths;
    }
}