package com.finora.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
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
 * Redirects already-logged-in users away from guest pages to the dashboard.
 */
@WebFilter(urlPatterns = { "/Login", "/Register", "/Home", "/Landing", "/" })
public class GuessFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

        if (isLoggedIn) {
            // Already logged in — send to dashboard
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Admin_Dashboard");
        } else {
            // Guest — let them through
            chain.doFilter(request, response);
        }
    }
}
