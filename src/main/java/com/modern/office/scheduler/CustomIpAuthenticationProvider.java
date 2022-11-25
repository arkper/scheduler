package com.modern.office.scheduler;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Value;
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

@Component
@Slf4j
public class CustomIpAuthenticationProvider implements AuthenticationProvider {
    
    private final Set<String> whitelist;
	
	private final String userId;
	
	private final String pwd;
	
	public CustomIpAuthenticationProvider(
			@Value("${scheduler.security.whitelist}") Set<String> whitelist,
			@Value("${scheduler.security.user}") String userId,
			@Value("${scheduler.security.pwd}") String pwd)
	{
		this.whitelist = whitelist;
		this.userId = userId;
		this.pwd = pwd;
	}

    public Authentication authenticate(Authentication auth) throws AuthenticationException {
        WebAuthenticationDetails details = (WebAuthenticationDetails) auth.getDetails();
        String userIp = details.getRemoteAddress();
        log.info("Remote IP address: " + userIp);
        if (!whitelist.contains(userIp))
        {
            throw new BadCredentialsException("Invalid IP Address");
        }
        final String name = auth.getName();
        final String secret = auth.getCredentials().toString();
        
        if (name.equals(userId) && secret.equals(pwd)) 
        {
            final List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
            return new UsernamePasswordAuthenticationToken(name, secret, authorities);
        }
        else
        {
            throw new BadCredentialsException("Invalid username or password");
        }
    }

    public boolean supports(Class<?> authentication) 
    {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}