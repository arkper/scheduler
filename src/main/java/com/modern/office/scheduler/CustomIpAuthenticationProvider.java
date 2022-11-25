package com.modern.office.scheduler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import sun.util.logging.resources.logging;

@Component
@Slf4j
public class CustomIpAuthenticationProvider implements AuthenticationProvider {
    
   Set<String> whitelist = new HashSet<String>();

    public CustomIpAuthenticationProvider() {
        whitelist.add("18.189.210.54");
        whitelist.add("185.183.92.88");
        whitelist.add("127.0.0.1");
        whitelist.add("0:0:0:0:0:0:0:1");
    }

    public Authentication authenticate(Authentication auth) throws AuthenticationException {
        WebAuthenticationDetails details = (WebAuthenticationDetails) auth.getDetails();
        String userIp = details.getRemoteAddress();
        System.out.println("Remote IP address: " + userIp);
        if(! whitelist.contains(userIp)){
            throw new BadCredentialsException("Invalid IP Address");
        }
        final String name = auth.getName();
        final String password = auth.getCredentials().toString();
        
        if (name.equals("john") && password.equals("123")) {
        List<GrantedAuthority> authorities =new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return new UsernamePasswordAuthenticationToken(name, password, authorities);
        }
        else{
            throw new BadCredentialsException("Invalid username or password");
        }
    }

    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}