<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar">
        <div class="nav-logo">Finora</div>
        <div class="nav-actions">
            <button class="btn-nav" onclick="openLogin()">Sign In</button>
            <button class="btn-nav btn-nav-outline" onclick="openLogin()">Login</button>
        </div>
    </nav>

    <!-- ===== SPLIT HERO ===== -->
    <div class="hero-split">

        <!-- LEFT — Plants -->
        <div class="hero-side hero-plants" id="heroPlants">
            <div class="side-overlay"></div>
            <div class="side-content">
                <div class="mode-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                        <path d="M12 22V12M12 12C12 12 7 10 5 6c3 0 6 2 7 6zM12 12c0 0 5-2 7-6-3 0-6 2-7 6z"/>
                    </svg>
                </div>
                <h1 class="side-title">The Living<br>Forest</h1>
                <p class="side-sub">Curated rare species and premium terrarium essentials for the modern botanist.</p>
            </div>
        </div>

        <!-- DIVIDER + LOGO -->
        <div class="hero-divider">
            <div class="divider-line"></div>
            <div class="center-logo">
                <svg viewBox="0 0 40 40" fill="none">
                    <circle cx="20" cy="20" r="19" stroke="rgba(255,255,255,0.3)" stroke-width="1"/>
                    <path d="M20 28 C20 28 12 22 12 16 C12 12 16 10 20 14 C24 10 28 12 28 16 C28 22 20 28 20 28Z" fill="rgba(255,255,255,0.8)"/>
                    <circle cx="20" cy="20" r="3" fill="white" opacity="0.5"/>
                </svg>
            </div>
            <div class="divider-line"></div>
        </div>

        <!-- RIGHT — Aquarium -->
        <div class="hero-side hero-aquarium" id="heroAquarium">
            <div class="side-overlay"></div>
            <div class="side-content">
                <div class="mode-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                        <path d="M12 4 C8 8 4 10 4 14 C4 18 7.5 21 12 21 C16.5 21 20 18 20 14 C20 10 16 8 12 4Z"/>
                        <path d="M12 21 L12 14 M9 17 C10 15 14 15 15 17" stroke-linecap="round"/>
                    </svg>
                </div>
                <h1 class="side-title">Silent<br>Reefs</h1>
                <p class="side-sub">Exotic aquascaping and aquatic life for those who seek the calm of the deep.</p>
            </div>
        </div>

    </div>

    <!-- Browse Everything Button -->
    <div class="browse-bar">
        <a href="shop.jsp" class="btn-browse">Browse Everything &nbsp;→</a>
    </div>


    <!-- ===== LOGIN MODAL ===== -->
    <div class="modal-backdrop" id="loginModal">
        <div class="modal-box" id="loginBox">
            <button class="modal-close" onclick="closeModals()">✕</button>
            <div class="modal-logo">Finora</div>
            <h2 class="modal-title">Welcome back</h2>
            <p class="modal-sub">Sign in to your account</p>

            <div class="alert-box" id="loginAlert"></div>

            <form id="loginForm" onsubmit="handleLogin(event)">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" id="loginEmail" placeholder="you@example.com" autocomplete="email">
                    <span class="field-error" id="loginEmailErr"></span>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-wrap">
                        <input type="password" id="loginPassword" placeholder="Enter your password" autocomplete="current-password">
                        <button type="button" class="toggle-pw" onclick="togglePw('loginPassword', this)">Show</button>
                    </div>
                    <span class="field-error" id="loginPasswordErr"></span>
                </div>
                <button type="submit" class="btn-submit">Sign In</button>
            </form>

            <p class="modal-switch">
                Don't have an account? <button onclick="switchToRegister()">Register here</button>
            </p>
        </div>
    </div>


    <!-- ===== REGISTER MODAL ===== -->
    <div class="modal-backdrop" id="registerModal">
        <div class="modal-box modal-box-wide" id="registerBox">
            <button class="modal-close" onclick="closeModals()">✕</button>
            <div class="modal-logo">Finora</div>
            <h2 class="modal-title">Create Account</h2>
            <p class="modal-sub">Join the Finora community</p>

            <div class="alert-box" id="registerAlert"></div>

            <form id="registerForm" onsubmit="handleRegister(event)">
                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" id="regName" placeholder="John Doe">
                        <span class="field-error" id="regNameErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" id="regEmail" placeholder="you@example.com">
                        <span class="field-error" id="regEmailErr"></span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="tel" id="regPhone" placeholder="98XXXXXXXX">
                        <span class="field-error" id="regPhoneErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Shipping Address</label>
                        <input type="text" id="regAddress" placeholder="123 Street, City">
                        <span class="field-error" id="regAddressErr"></span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Password</label>
                        <div class="input-wrap">
                            <input type="password" id="regPassword" placeholder="Min. 8 characters">
                            <button type="button" class="toggle-pw" onclick="togglePw('regPassword', this)">Show</button>
                        </div>
                        <span class="field-error" id="regPasswordErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <div class="input-wrap">
                            <input type="password" id="regConfirm" placeholder="Repeat password">
                            <button type="button" class="toggle-pw" onclick="togglePw('regConfirm', this)">Show</button>
                        </div>
                        <span class="field-error" id="regConfirmErr"></span>
                    </div>
                </div>
                <button type="submit" class="btn-submit">Create Account</button>
            </form>

            <p class="modal-switch">
                Already have an account? <button onclick="switchToLogin()">Sign in here</button>
            </p>
        </div>
    </div>


    <!-- ===== SUCCESS TOAST ===== -->
    <div class="toast" id="toast"></div>


    <script>
        /* ---- Modal Controls ---- */
        function openLogin() {
            document.getElementById('loginModal').classList.add('active');
            document.body.classList.add('modal-open');
        }
        function openRegister() {
            document.getElementById('registerModal').classList.add('active');
            document.body.classList.add('modal-open');
        }
        function closeModals() {
            document.querySelectorAll('.modal-backdrop').forEach(m => m.classList.remove('active'));
            document.body.classList.remove('modal-open');
            clearErrors();
        }
        function switchToRegister() {
            document.getElementById('loginModal').classList.remove('active');
            setTimeout(() => openRegister(), 150);
        }
        function switchToLogin() {
            document.getElementById('registerModal').classList.remove('active');
            setTimeout(() => openLogin(), 150);
        }

        /* Close on backdrop click */
        document.querySelectorAll('.modal-backdrop').forEach(backdrop => {
            backdrop.addEventListener('click', function(e) {
                if (e.target === this) closeModals();
            });
        });

        /* ---- Password Toggle ---- */
        function togglePw(id, btn) {
            const input = document.getElementById(id);
            if (input.type === 'password') {
                input.type = 'text';
                btn.textContent = 'Hide';
            } else {
                input.type = 'password';
                btn.textContent = 'Show';
            }
        }

        /* ---- Clear Errors ---- */
        function clearErrors() {
            document.querySelectorAll('.field-error').forEach(el => el.textContent = '');
            document.querySelectorAll('.alert-box').forEach(el => { el.textContent = ''; el.className = 'alert-box'; });
            document.querySelectorAll('input').forEach(el => el.classList.remove('input-error'));
        }

        function showFieldError(fieldId, errId, message) {
            const field = document.getElementById(fieldId);
            const err   = document.getElementById(errId);
            if (field)  field.classList.add('input-error');
            if (err)    err.textContent = message;
            return false;
        }

        function showAlert(boxId, message, type) {
            const box = document.getElementById(boxId);
            box.textContent = message;
            box.className   = 'alert-box alert-' + type + ' show';
        }

        /* ---- Toast ---- */
        function showToast(message) {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.classList.add('show');
            setTimeout(() => toast.classList.remove('show'), 3000);
        }

        /* ---- Login Validation ---- */
        function handleLogin(e) {
            e.preventDefault();
            clearErrors();
            const email    = document.getElementById('loginEmail').value.trim();
            const password = document.getElementById('loginPassword').value;
            let valid = true;

            if (!email) {
                valid = showFieldError('loginEmail', 'loginEmailErr', 'Email address is required.');
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                valid = showFieldError('loginEmail', 'loginEmailErr', 'Please enter a valid email address.');
            }

            if (!password) {
                showFieldError('loginPassword', 'loginPasswordErr', 'Password is required.');
                valid = false;
            }

            if (!valid) return;

            showAlert('loginAlert', 'Database not connected yet. Login logic will be wired to LoginServlet.', 'info');
        }

        /* ---- Register Validation ---- */
        function handleRegister(e) {
            e.preventDefault();
            clearErrors();

            const name     = document.getElementById('regName').value.trim();
            const email    = document.getElementById('regEmail').value.trim();
            const phone    = document.getElementById('regPhone').value.trim();
            const address  = document.getElementById('regAddress').value.trim();
            const password = document.getElementById('regPassword').value;
            const confirm  = document.getElementById('regConfirm').value;
            let valid = true;

            if (!name || name.length < 2) {
                showFieldError('regName', 'regNameErr', 'Full name must be at least 2 characters.');
                valid = false;
            }

            if (!email) {
                showFieldError('regEmail', 'regEmailErr', 'Email address is required.');
                valid = false;
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                showFieldError('regEmail', 'regEmailErr', 'Please enter a valid email address.');
                valid = false;
            }

            if (!phone) {
                showFieldError('regPhone', 'regPhoneErr', 'Phone number is required.');
                valid = false;
            } else if (!/^[0-9]{10}$/.test(phone)) {
                showFieldError('regPhone', 'regPhoneErr', 'Enter a valid 10-digit phone number.');
                valid = false;
            }

            if (!address || address.length < 5) {
                showFieldError('regAddress', 'regAddressErr', 'Please enter your full shipping address.');
                valid = false;
            }

            if (!password) {
                showFieldError('regPassword', 'regPasswordErr', 'Password is required.');
                valid = false;
            } else if (password.length < 8) {
                showFieldError('regPassword', 'regPasswordErr', 'Password must be at least 8 characters.');
                valid = false;
            } else if (!/(?=.[A-Z])(?=.[0-9])/.test(password)) {
                showFieldError('regPassword', 'regPasswordErr', 'Include at least one uppercase letter and one number.');
                valid = false;
            }

            if (!confirm) {
                showFieldError('regConfirm', 'regConfirmErr', 'Please confirm your password.');
                valid = false;
            } else if (password !== confirm) {
                showFieldError('regConfirm', 'regConfirmErr', 'Passwords do not match.');
                valid = false;
            }

            if (!valid) return;


            showAlert('registerAlert', 'Database not connected yet. Registration will be wired to RegisterServlet.', 'info');
        }

        /* ---- Parallax tilt on hero sides ---- */
        document.querySelectorAll('.hero-side').forEach(side => {
            side.addEventListener('mousemove', function(e) {
                const rect = this.getBoundingClientRect();
                const x = (e.clientX - rect.left) / rect.width  - 0.5;
                const y = (e.clientY - rect.top)  / rect.height - 0.5;
                this.querySelector('.side-content').style.transform =
                    translate(${x * 12}px, ${y * 8}px);
            });
            side.addEventListener('mouseleave', function() {
                this.querySelector('.side-content').style.transform = 'translate(0,0)';
            });
        });
    </script>

</body>
</html>