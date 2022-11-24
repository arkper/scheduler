package com.modern.office.scheduler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

@Component
public class CustomIpAuthenticationProvider implements AuthenticationProvider {
    
   Set<String> whitelist = new HashSet<String>();

    public CustomIpAuthenticationProvider() {
        whitelist.add("18.189.210.54");
        whitelist.add("185.183.92.88");
        whitelist.add("127.0.0.1");
    }

    public Authentication authenticate(Authentication auth) throws AuthenticationException {
        WebAuthenticationDetails details = (WebAuthenticationDetails) auth.getDetails();
        String userIp = details.getRemoteAddress();
        if(! whitelist.contains(userIp)){
            throw new BadCredentialsException("Invalid IP Address");
        }
        String name = auth.getName();
        String password = auth.getCredentials().toString();
        return new UsernamePasswordAuthenticationToken(
                name, password, new ArrayList());
    }

	public boolean supports(Class<?> authentication) {
		return false;
	}
}