<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora — Create Account</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Register.css">
</head>
<body>
    <div class="bg-split">
        <div class="bg-left"></div>
        <div class="bg-right"></div>
    </div>

    <a href="landing.jsp" class="back-link">← Back to Finora</a>

    <div class="register-wrapper">
        <!-- Decorative Side -->
        <div class="register-side">
            <div class="side-content">
                <span class="side-label">Join Finora</span>
                <h2 class="side-title">Curate your<br>living world.</h2>
                <p class="side-desc">Access exclusive botanical and aquatic collections, track your orders, build wishlists, and join a community of passionate naturalists.</p>
                <div class="side-features">
                    <div class="side-feat"><span class="feat-dot"></span> Rare plant &amp; fish species</div>
                    <div class="side-feat"><span class="feat-dot"></span> Expert care guides</div>
                    <div class="side-feat"><span class="feat-dot"></span> Wishlist &amp; order tracking</div>
                    <div class="side-feat"><span class="feat-dot"></span> Member-only collections</div>
                </div>
            </div>
        </div>

        <!-- Register Card -->
        <div class="register-card" id="registerCard">
            <div class="card-header">
                <a href="landing.jsp" class="card-logo">Finora</a>
                <h1 class="card-title">Create Account</h1>
                <p class="card-sub">Start your collection today</p>
            </div>

            <!-- Server-side Messages -->
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

            <form class="register-form" action="RegisterServlet" method="POST" id="registerForm" enctype="multipart/form-data" novalidate>

                <!-- Profile picture upload -->
                <div class="avatar-upload-group">
                    <div class="avatar-preview" id="avatarPreview">
                        <span class="avatar-placeholder">👤</span>
                    </div>
                    <div class="avatar-info">
                        <label class="avatar-upload-btn" for="profilePic">Upload Photo</label>
                        <input type="file" id="profilePic" name="profilePic" accept="image/*" style="display:none;">
                        <p class="avatar-hint">JPG or PNG, max 2MB</p>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="firstName">First Name *</label>
                        <input type="text" id="firstName" name="firstName" class="form-input" placeholder="Julian" required autocomplete="given-name">
                        <span class="field-error" id="firstNameError"></span>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="lastName">Last Name *</label>
                        <input type="text" id="lastName" name="lastName" class="form-input" placeholder="Reed" required autocomplete="family-name">
                        <span class="field-error" id="lastNameError"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="email">Email Address *</label>
                    <input type="email" id="email" name="email" class="form-input" placeholder="your@email.com" required autocomplete="email">
                    <span class="field-error" id="emailError"></span>
                </div>

                <div class="form-group">
                    <label class="form-label" for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" class="form-input" placeholder="+1 (555) 0123-4567" required autocomplete="tel">
                    <span class="field-error" id="phoneError"></span>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="password">Password *</label>
                        <div class="input-wrapper">
                            <input type="password" id="password" name="password" class="form-input" placeholder="Min 8 characters" required autocomplete="new-password">
                            <button type="button" class="toggle-pw" id="togglePw">👁</button>
                        </div>
                        <span class="field-error" id="pwError"></span>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="confirmPassword">Confirm Password *</label>
                        <div class="input-wrapper">
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-input" placeholder="Repeat password" required autocomplete="new-password">
                            <button type="button" class="toggle-pw" id="togglePw2">👁</button>
                        </div>
                        <span class="field-error" id="confirmPwError"></span>
                    </div>
                </div>

                <!-- Password strength bar -->
                <div class="pw-strength-wrapper" id="pwStrengthWrapper" style="display:none;">
                    <div class="pw-strength-bar">
                        <div class="pw-strength-fill" id="pwStrengthFill"></div>
                    </div>
                    <span class="pw-strength-label" id="pwStrengthLabel">Weak</span>
                </div>

                <div class="form-group">
                    <label class="form-label" for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" class="form-input" autocomplete="bday">
                    <span class="field-error" id="dobError"></span>
                </div>

                <div class="terms-group">
                    <label class="terms-label">
                        <input type="checkbox" id="terms" name="terms" class="terms-check" required>
                        <span class="checkmark"></span>
                        I agree to the <a href="#" class="link-terms">Terms of Service</a> and <a href="#" class="link-terms">Privacy Policy</a>
                    </label>
                    <span class="field-error" id="termsError"></span>
                </div>

                <button type="submit" class="btn-submit" id="submitBtn">
                    <span class="btn-text">Create Account</span>
                </button>
            </form>

            <div class="card-divider"><span>or</span></div>
            <p class="card-footer-text">Already have an account? <a href="Login.jsp" class="link-accent">Sign in</a></p>
        </div>
    </div>

    <script>
        const form = document.getElementById('registerForm');

        // Helpers
        function showError(input, errorEl, msg) {
            if (input) input.classList.add('input-error');
            errorEl.textContent = msg; errorEl.style.display = 'block';
        }
        function clearError(input, errorEl) {
            if (input) input.classList.remove('input-error');
            errorEl.textContent = ''; errorEl.style.display = 'none';
        }

        // Profile picture preview
        document.getElementById('profilePic').addEventListener('change', function () {
            const file = this.files[0];
            if (!file) return;
            if (file.size > 2 * 1024 * 1024) { alert('Image must be smaller than 2MB.'); this.value = ''; return; }
            const reader = new FileReader();
            reader.onload = e => {
                const preview = document.getElementById('avatarPreview');
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Profile" style="width:100%;height:100%;object-fit:cover;border-radius:50%;">';
            };
            reader.readAsDataURL(file);
        });

        // Password visibility toggles
        ['togglePw', 'togglePw2'].forEach((id, i) => {
            document.getElementById(id).addEventListener('click', function () {
                const inp = [document.getElementById('password'), document.getElementById('confirmPassword')][i];
                inp.type = inp.type === 'password' ? 'text' : 'password';
                this.textContent = inp.type === 'password' ? '👁' : '🙈';
            });
        });

        // Password strength
        document.getElementById('password').addEventListener('input', function () {
            const wrapper = document.getElementById('pwStrengthWrapper');
            const fill = document.getElementById('pwStrengthFill');
            const label = document.getElementById('pwStrengthLabel');
            const val = this.value;
            if (!val) { wrapper.style.display = 'none'; return; }
            wrapper.style.display = 'flex';
            let score = 0;
            if (val.length >= 8) score++;
            if (/[A-Z]/.test(val)) score++;
            if (/[0-9]/.test(val)) score++;
            if (/[^A-Za-z0-9]/.test(val)) score++;
            const levels = [{w:'25%',c:'#e74c3c',l:'Weak'},{w:'50%',c:'#e67e22',l:'Fair'},{w:'75%',c:'#f1c40f',l:'Good'},{w:'100%',c:'#27ae60',l:'Strong'}];
            const lvl = levels[score - 1] || levels[0];
            fill.style.width = lvl.w; fill.style.background = lvl.c; label.textContent = lvl.l; label.style.color = lvl.c;
        });

        // Blur validations
        const $ = id => document.getElementById(id);
        const rules = [
            { id:'firstName', errId:'firstNameError', validate: v => !v.trim() ? 'First name is required.' : /[^a-zA-Z\s\-]/.test(v) ? 'First name must contain only letters.' : '' },
            { id:'lastName',  errId:'lastNameError',  validate: v => !v.trim() ? 'Last name is required.' : /[^a-zA-Z\s\-]/.test(v) ? 'Last name must contain only letters.' : '' },
            { id:'email',     errId:'emailError',     validate: v => !v.trim() ? 'Email is required.' : !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) ? 'Enter a valid email.' : '' },
            { id:'phone',     errId:'phoneError',     validate: v => !v.trim() ? 'Phone number is required.' : !/^[+\d\s\-()]{7,15}$/.test(v) ? 'Enter a valid phone number.' : '' },
            { id:'password',  errId:'pwError',        validate: v => !v ? 'Password is required.' : v.length < 8 ? 'Password must be at least 8 characters.' : '' },
        ];
        rules.forEach(r => {
            $(r.id).addEventListener('blur', function () {
                const msg = r.validate(this.value);
                msg ? showError(this, $(r.errId), msg) : clearError(this, $(r.errId));
            });
        });
        $('confirmPassword').addEventListener('blur', function () {
            const msg = !this.value ? 'Please confirm your password.' : this.value !== $('password').value ? 'Passwords do not match.' : '';
            msg ? showError(this, $('confirmPwError'), msg) : clearError(this, $('confirmPwError'));
        });

        // Form submit validation
        form.addEventListener('submit', function (e) {
            let valid = true;
            rules.forEach(r => { const msg = r.validate($(r.id).value); if (msg) { showError($(r.id), $(r.errId), msg); valid = false; } });
            if ($('confirmPassword').value !== $('password').value) { showError($('confirmPassword'), $('confirmPwError'), 'Passwords do not match.'); valid = false; }
            if (!$('terms').checked) { showError(null, $('termsError'), 'You must accept the Terms of Service.'); valid = false; }
            if (!valid) { e.preventDefault(); return; }
            document.querySelector('.btn-text').textContent = 'Creating account…';
        });

        // Entrance animation
        window.addEventListener('load', () => document.getElementById('registerCard').classList.add('animated'));
    </script>
</body>
</html>
