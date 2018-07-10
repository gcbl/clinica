package com.pucmg.tcc.gcbl.proposta3.clinica.service.security;

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

import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Grupo;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Permissao;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.Usuario;
import com.pucmg.tcc.gcbl.proposta3.clinica.model.security.UsuarioSistema;
import com.pucmg.tcc.gcbl.proposta3.clinica.repository.security.UsuarioRepository;

@Component
public class CustomUserDetailsService implements UserDetailsService {
    
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByLogin(username);

        
        if (usuario == null) {
            throw new UsernameNotFoundException("Usuário não encontrado!");
        }

        Collection<? extends GrantedAuthority> permissaoList = authorities(usuario);
        
        return new UsuarioSistema(usuario, usuario.getLogin(), usuario.getSenha(), permissaoList);
    }
    
    public Collection<? extends GrantedAuthority> authorities(Usuario usuario) {
    	//return authorities(grupoRepository.findByUsuariosIn(usuario));
    	return authorities(  usuario.getGrupos()  );
    }
    
    public Collection<? extends GrantedAuthority> authorities(List<Grupo> grupos) {
        Collection<GrantedAuthority> auths = new ArrayList<>();
        
        for (Grupo grupo: grupos) {
            //List<Permissao> lista = permissaoRepository.findByGruposIn(grupo);
        	List<Permissao> lista = grupo.getPermissoes();
        	
        	String nomePermissao = "";
            for (Permissao permissao: lista) {
            	nomePermissao = permissao.getNome();
            	
            	// Tratando
            	nomePermissao = nomePermissao.replaceAll("/", "");
            	nomePermissao = nomePermissao.replace("*", "");
            	nomePermissao = nomePermissao.replace("-", "_");
            	nomePermissao = nomePermissao.toUpperCase();
            	//---
            	
            	if(!"".equals(nomePermissao)) {
                    auths.add(new SimpleGrantedAuthority("ROLE_" + nomePermissao));
            	}
            	
            }
        }
        
        return auths;
    }
}