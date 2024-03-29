package com.modern.office.config;

import java.util.ArrayList;
import java.util.List;

import com.modern.office.config.AppConfig;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
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
public class CustomIpAuthenticationProvider implements AuthenticationProvider 
{
	private final AppConfig securityConfig;
	
	public CustomIpAuthenticationProvider(final AppConfig securityConfig)
	{
		this.securityConfig = securityConfig;
	}

    public Authentication authenticate(Authentication auth) throws AuthenticationException {
        WebAuthenticationDetails details = (WebAuthenticationDetails) auth.getDetails();
        String userIp = details.getRemoteAddress();
        log.debug("Remote IP address: " + userIp);
        if (!userIp.startsWith("192.168") && !userIp.startsWith("localhost")
                && !this.securityConfig.getWhiteList().contains(userIp))
        {
            throw new BadCredentialsException("Invalid IP Address");
        }
        // final String name = auth.getName();
        // final String secret = auth.getCredentials().toString();
        
        //if (name.equals(this.securityConfig.getUser()) && secret.equals(this.securityConfig.getPwd()))
        else {
            final List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
            return new UsernamePasswordAuthenticationToken(this.securityConfig.getUser(), this.securityConfig.getPwd(), authorities);
        }
        // else
        // {
        //    throw new BadCredentialsException("Invalid username or password");
        // }
    }

    public boolean supports(Class<?> authentication) 
    {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}