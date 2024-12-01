package com.infosys.CarRentalSystem.config;

import java.io.IOException;


import org.springframework.security.web.authentication.AuthenticationFailureHandler;
 
 
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler {
	@Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, org.springframework.security.core.AuthenticationException exception) throws IOException, ServletException { 
                response.sendRedirect("/loginerror"); 
    }

}
