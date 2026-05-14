package com.finora.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.finora.util.SessionUtil;

/**
 * Blocks unauthenticated access to protected pages.
 * If the user is not logged in, redirects to /Login.
 */
@WebFilter(urlPatterns = { "/Admin_Dashboard", "/User_profile", "/logout", "/getimage" })
public class AuthenticationFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    public AuthenticationFilter() {
        super();
    }

    public void destroy() {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            // Prevent browser from caching protected pages
            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login");
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {}
}
