<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora — Sign In</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Login.css">
</head>
<body>
    <!-- Decorative background panels -->
    <div class="bg-split">
        <div class="bg-left"></div>
        <div class="bg-right"></div>
    </div>

    <!-- Back to Landing -->
    <a href="landing.jsp" class="back-link">← Back to Finora</a>

    <!-- Login Card -->
    <div class="login-wrapper">
        <div class="login-card">
            <!-- Brand -->
            <div class="card-header">
                <a href="landing.jsp" class="card-logo">Finora</a>
                <h1 class="card-title">Welcome back</h1>
                <p class="card-sub">Sign in to your collection</p>
            </div>

            <!-- Error / Success Messages from Servlet -->
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-error">
                    <span class="alert-icon">✕</span>
                    ${sessionScope.errorMessage}
                    <% session.removeAttribute("errorMessage"); %>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success">
                    <span class="alert-icon">✓</span>
                    ${sessionScope.successMessage}
                    <% session.removeAttribute("successMessage"); %>
                </div>
            </c:if>

            <!-- Login Form -->
            <form class="login-form" action="LoginServlet" method="POST" id="loginForm" novalidate>
                <div class="form-group">
                    <label class="form-label" for="email">Email Address</label>
                    <div class="input-wrapper">
                        <span class="input-icon">✉</span>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            class="form-input"
                            placeholder="your@email.com"
                            required
                            autocomplete="email"
                        >
                    </div>
                    <span class="field-error" id="emailError"></span>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">
                        Password
                        <a href="ForgotPassword.jsp" class="forgot-link">Forgot?</a>
                    </label>
                    <div class="input-wrapper">
                        <span class="input-icon">🔒</span>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-input"
                            placeholder="Enter your password"
                            required
                            autocomplete="current-password"
                        >
                        <button type="button" class="toggle-pw" id="togglePw" aria-label="Show password">👁</button>
                    </div>
                    <span class="field-error" id="pwError"></span>
                </div>

                <div class="form-options">
                    <label class="remember-label">
                        <input type="checkbox" name="rememberMe" class="remember-check">
                        <span class="checkmark"></span>
                        Remember me
                    </label>
                </div>

                <button type="submit" class="btn-submit" id="submitBtn">
                    <span class="btn-text">Sign In</span>
                    <span class="btn-loader" id="btnLoader" style="display:none;">⟳</span>
                </button>
            </form>

            <div class="card-divider"><span>or</span></div>

            <p class="card-footer-text">
                Don't have an account?
                <a href="Register.jsp" class="link-accent">Create one</a>
            </p>
        </div>

        <!-- Decorative side panel (desktop) -->
        <div class="login-side">
            <div class="side-content">
                <blockquote class="side-quote">
                    "Where the forest<br>meets the reef."
                </blockquote>
                <p class="side-desc">Discover curated botanical and aquatic specimens for the modern naturalist.</p>
            </div>
        </div>
    </div>

    <script>
        // Client-side validation
        const form = document.getElementById('loginForm');
        const emailInput = document.getElementById('email');
        const passwordInput = document.getElementById('password');
        const emailError = document.getElementById('emailError');
        const pwError = document.getElementById('pwError');
        const togglePw = document.getElementById('togglePw');
        const btnLoader = document.getElementById('btnLoader');
        const btnText = document.querySelector('.btn-text');

        // Password visibility toggle
        togglePw.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.textContent = type === 'password' ? '👁' : '🙈';
        });

        // Real-time email validation
        emailInput.addEventListener('blur', function () {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!this.value.trim()) {
                showError(emailInput, emailError, 'Email address is required.');
            } else if (!emailRegex.test(this.value.trim())) {
                showError(emailInput, emailError, 'Please enter a valid email address.');
            } else {
                clearError(emailInput, emailError);
            }
        });

        // Real-time password validation
        passwordInput.addEventListener('blur', function () {
            if (!this.value.trim()) {
                showError(passwordInput, pwError, 'Password is required.');
            } else {
                clearError(passwordInput, pwError);
            }
        });

        // Form submit
        form.addEventListener('submit', function (e) {
            let valid = true;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailInput.value.trim()) {
                showError(emailInput, emailError, 'Email address is required.'); valid = false;
            } else if (!emailRegex.test(emailInput.value.trim())) {
                showError(emailInput, emailError, 'Please enter a valid email address.'); valid = false;
            }
            if (!passwordInput.value.trim()) {
                showError(passwordInput, pwError, 'Password is required.'); valid = false;
            }
            if (!valid) { e.preventDefault(); return; }
            btnText.textContent = 'Signing in…';
            btnLoader.style.display = 'inline-block';
        });

        function showError(input, errorEl, msg) {
            input.classList.add('input-error');
            errorEl.textContent = msg;
            errorEl.style.display = 'block';
        }
        function clearError(input, errorEl) {
            input.classList.remove('input-error');
            errorEl.textContent = '';
            errorEl.style.display = 'none';
        }

        // Entrance animation
        window.addEventListener('load', function () {
            document.querySelector('.login-card').classList.add('animated');
        });
    </script>
</body>
</html>
