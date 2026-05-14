
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora</title>
    <link rel="stylesheet" href="Landing.css">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,300;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<!-- ============================================================
     LOADING SCREEN
     ============================================================ -->
<div class="loader" id="loader">
    <div class="loader-inner">
        <div class="loader-logo-wrap">
            <!-- INSERT MAIN LOGO HERE — replace src="" with your logo path -->
            <img src="" alt="Finora" class="loader-logo-img" id="loaderLogoImg"
                 onerror="this.style.display='none'; document.getElementById('loaderLogoText').style.display='block'">
            <span class="loader-logo-text" id="loaderLogoText">Finora</span>
        </div>
        <div class="loader-progress">
            <div class="loader-bar"></div>
        </div>
        <p class="loader-tagline">Nature meets elegance</p>
    </div>
</div>


<!-- ============================================================
     NAVBAR
     ============================================================ -->
<nav class="navbar" id="navbar">
    <div class="nav-brand">
        <!-- INSERT COMBINED NAVBAR LOGO HERE — replace src="" -->
        <img src="" alt="Finora" class="nav-logo-img"
             onerror="this.style.display='none'; document.getElementById('navText').style.display='block'">
        <span class="nav-logo-text" id="navText">Finora</span>
    </div>
    <div class="nav-actions">
        <button class="btn-nav btn-signin" onclick="openAuth('register')">Sign In</button>
        <button class="btn-nav btn-login"  onclick="openAuth('login')">Login</button>
    </div>
</nav>


<!-- ============================================================
     HERO SPLIT
     ============================================================ -->
<div class="hero-split" id="heroSplit">

    <!-- LEFT — Plants -->
    <div class="hero-side hero-plants" id="sideLeft">
        <!-- INSERT PLANTS BACKGROUND IMAGE — replace src="" -->
        <img src="" alt="" class="side-bg-img" id="plantsBg"
             onerror="this.style.display='none'">
        <div class="side-overlay plants-overlay"></div>

        <div class="side-content">
            <div class="side-icon-wrap plants-icon-wrap">
                <!-- INSERT PLANTS LOGO/ICON — replace src="" -->
                <img src="" alt="Plants" class="side-logo-img" id="plantsLogo"
                     onerror="this.style.display='none'; document.getElementById('plantsIconSvg').style.display='flex'">
                <div class="side-icon-svg" id="plantsIconSvg">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3">
                        <path d="M12 22V12M12 12C12 12 7 9 5 5c3.5 0 6.5 2.5 7 7zM12 12c0 0 5-2 7-6-3 0-6.5 2-7 6z"/>
                    </svg>
                </div>
            </div>

            <h1 class="side-title">The Living Forest</h1>
            <p class="side-sub">Curated rare species and premium terrarium essentials for the modern botanist.</p>
            <button class="btn-explore" onclick="openAuth('login')">
                <span>Explore Plants</span>
                <svg class="btn-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </button>
        </div>
    </div>


    <!-- CENTER — Rotating logo + dividers -->
    <div class="hero-center">
        <div class="center-divider-line top-line"></div>
        <div class="center-logo-container">
            <div class="center-logo-ring ring-outer"></div>
            <div class="center-logo-ring ring-inner"></div>
            <div class="center-logo-box" id="centerLogoBox">
                <!-- INSERT MAIN / COMBINED LOGO — replace src="" -->
                <img src="" alt="Finora" class="center-logo-img" id="centerLogoImg"
                     onerror="this.style.display='none'; document.getElementById('centerLogoSvg').style.display='flex'">
                <div class="center-logo-svg-wrap" id="centerLogoSvg">
                    <svg viewBox="0 0 44 44" fill="none">
                        <path d="M22 38C22 38 10 28 10 20C10 14 15 10 22 16C29 10 34 14 34 20C34 28 22 38 22 38Z"
                              fill="rgba(255,255,255,0.9)"/>
                        <circle cx="22" cy="20" r="4.5" fill="rgba(255,255,255,0.28)"/>
                    </svg>
                </div>
            </div>
        </div>
        <div class="center-divider-line bottom-line"></div>
    </div>


    <!-- RIGHT — Aquarium -->
    <div class="hero-side hero-aquarium" id="sideRight">
        <!-- INSERT AQUARIUM BACKGROUND IMAGE — replace src="" -->
        <img src="" alt="" class="side-bg-img" id="aquaBg"
             onerror="this.style.display='none'">
        <div class="side-overlay aqua-overlay"></div>

        <div class="side-content">
            <div class="side-icon-wrap aqua-icon-wrap">
                <!-- INSERT AQUARIUM LOGO/ICON — replace src="" -->
                <img src="" alt="Aquarium" class="side-logo-img" id="aquaLogo"
                     onerror="this.style.display='none'; document.getElementById('aquaIconSvg').style.display='flex'">
                <div class="side-icon-svg" id="aquaIconSvg">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3">
                        <path d="M12 4C8 8 4 10 4 15c0 4 3.5 6.5 8 6.5S20 19 20 15c0-5-4-7-8-11z"/>
                        <path d="M9 18c1-2 5-2 6 0" stroke-linecap="round"/>
                    </svg>
                </div>
            </div>

            <h1 class="side-title">Silent Reefs</h1>
            <p class="side-sub">Exotic aquascaping and aquatic life for those who seek the calm of the deep.</p>
            <button class="btn-explore btn-explore-aqua" onclick="openAuth('login')">
                <span>Explore Aquarium</span>
                <svg class="btn-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
            </button>
        </div>
    </div>

</div><!-- end .hero-split -->


<!-- ============================================================
     FLOATING PARTICLES (pure CSS)
     ============================================================ -->
<div class="particles" aria-hidden="true">
    <span class="p p1"></span><span class="p p2"></span><span class="p p3"></span>
    <span class="p p4"></span><span class="p p5"></span><span class="p p6"></span>
    <span class="p p7"></span><span class="p p8"></span><span class="p p9"></span>
    <span class="p p10"></span>
</div>


<!-- ============================================================
     AUTH MODAL
     ============================================================ -->
<div class="modal-backdrop" id="authModal">
    <div class="modal-box" id="authBox">
        <button class="modal-close" onclick="closeAuth()">✕</button>

        <!-- Tab switcher -->
        <div class="auth-tabs">
            <button class="auth-tab" id="tabRegister" onclick="switchTab('register')">Sign In</button>
            <button class="auth-tab" id="tabLogin"    onclick="switchTab('login')">Login</button>
            <div class="tab-indicator" id="tabIndicator"></div>
        </div>


        <!-- ===== REGISTER PANEL ===== -->
        <div class="auth-panel" id="panelRegister">
            <div class="modal-brand">
                <!-- INSERT LOGO SMALL -->
                <img src="" alt="Finora" class="modal-logo-img"
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block'">
                <span class="modal-logo-text" style="display:none">Finora</span>
            </div>
            <h2 class="modal-title">Create Account</h2>
            <p class="modal-sub">Join the Finora community today</p>
            <div class="alert-box" id="regAlert"></div>

            <%-- TODO: set action="RegisterServlet" method="post" when servlet is ready --%>
            <form id="registerForm" onsubmit="handleRegister(event)">
                <div class="form-row">
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" id="regFirst" placeholder="Julian">
                        <span class="field-error" id="regFirstErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" id="regLast" placeholder="Reed">
                        <span class="field-error" id="regLastErr"></span>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" id="regEmail" placeholder="you@example.com">
                        <span class="field-error" id="regEmailErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="tel" id="regPhone" placeholder="98XXXXXXXX">
                        <span class="field-error" id="regPhoneErr"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>Shipping Address</label>
                    <input type="text" id="regAddress" placeholder="123 Street, City, Country">
                    <span class="field-error" id="regAddressErr"></span>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Password</label>
                        <div class="input-wrap">
                            <input type="password" id="regPass" placeholder="Min. 8 chars">
                            <button type="button" class="toggle-pw" onclick="togglePw('regPass',this)">Show</button>
                        </div>
                        <span class="field-error" id="regPassErr"></span>
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <div class="input-wrap">
                            <input type="password" id="regConf" placeholder="Repeat">
                            <button type="button" class="toggle-pw" onclick="togglePw('regConf',this)">Show</button>
                        </div>
                        <span class="field-error" id="regConfErr"></span>
                    </div>
                </div>
                <button type="submit" class="btn-submit btn-submit-green">Create Account</button>
            </form>
            <p class="modal-switch">Already have an account? <button onclick="switchTab('login')">Login here</button></p>
        </div>


        <!-- ===== LOGIN PANEL ===== -->
        <div class="auth-panel hidden" id="panelLogin">
            <div class="modal-brand">
                <!-- INSERT LOGO SMALL -->
                <img src="" alt="Finora" class="modal-logo-img"
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block'">
                <span class="modal-logo-text" style="display:none">Finora</span>
            </div>
            <h2 class="modal-title">Welcome Back</h2>
            <p class="modal-sub">Sign in to your Finora account</p>
            <div class="alert-box" id="loginAlert"></div>

            <%-- TODO: set action="LoginServlet" method="post" --%>
            <form id="loginForm" onsubmit="handleLogin(event)">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" id="loginEmail" placeholder="you@example.com" autocomplete="email">
                    <span class="field-error" id="loginEmailErr"></span>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-wrap">
                        <input type="password" id="loginPass" placeholder="Your password" autocomplete="current-password">
                        <button type="button" class="toggle-pw" onclick="togglePw('loginPass',this)">Show</button>
                    </div>
                    <span class="field-error" id="loginPassErr"></span>
                </div>
                <button type="submit" class="btn-submit btn-submit-blue">Login</button>
            </form>
            <p class="modal-switch">New to Finora? <button onclick="switchTab('register')">Create account</button></p>
        </div>

    </div><!-- end .modal-box -->
</div>


<script>
/* ---- Loader dismiss ---- */
window.addEventListener('load', () => {
    const loader = document.getElementById('loader');
    const navbar = document.getElementById('navbar');
    const split  = document.getElementById('heroSplit');
    setTimeout(() => {
        loader.classList.add('done');
        navbar.classList.add('visible');
        split.classList.add('visible');
    }, 1900);
});

/* ---- Auth modal ---- */
function openAuth(tab) {
    document.getElementById('authModal').classList.add('active');
    document.body.classList.add('no-scroll');
    switchTab(tab || 'login');
}
function closeAuth() {
    document.getElementById('authModal').classList.remove('active');
    document.body.classList.remove('no-scroll');
    clearErrors();
}
document.getElementById('authModal').addEventListener('click', function(e) {
    if (e.target === this) closeAuth();
});
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeAuth(); });

/* ---- Tab switch ---- */
function switchTab(tab) {
    const isReg = tab === 'register';
    document.getElementById('panelRegister').classList.toggle('hidden', !isReg);
    document.getElementById('panelLogin').classList.toggle('hidden',     isReg);
    document.getElementById('tabRegister').classList.toggle('active',   isReg);
    document.getElementById('tabLogin').classList.toggle('active',      !isReg);
    // slide indicator
    const ind = document.getElementById('tabIndicator');
    ind.style.transform = isReg ? 'translateX(0)' : 'translateX(100%)';
}

/* ---- Password toggle ---- */
function togglePw(id, btn) {
    const i = document.getElementById(id);
    i.type = i.type === 'password' ? 'text' : 'password';
    btn.textContent = i.type === 'password' ? 'Show' : 'Hide';
}

/* ---- Errors ---- */
function clearErrors() {
    document.querySelectorAll('.field-error').forEach(e => e.textContent = '');
    document.querySelectorAll('.alert-box').forEach(e => { e.textContent=''; e.className='alert-box'; });
    document.querySelectorAll('input').forEach(e => e.classList.remove('input-error'));
}
function fe(fid, eid, msg) {
    document.getElementById(fid)?.classList.add('input-error');
    const el = document.getElementById(eid);
    if (el) { el.textContent = msg; el.style.animation = 'none'; el.offsetHeight; el.style.animation = ''; }
    return false;
}
function showAlert(id, msg, type) {
    const b = document.getElementById(id);
    b.textContent = msg; b.className = 'alert-box alert-' + type + ' show';
}

/* ---- Register ---- */
function handleRegister(e) {
    e.preventDefault(); clearErrors();
    const first=document.getElementById('regFirst').value.trim(),
          last=document.getElementById('regLast').value.trim(),
          email=document.getElementById('regEmail').value.trim(),
          phone=document.getElementById('regPhone').value.trim(),
          addr=document.getElementById('regAddress').value.trim(),
          pass=document.getElementById('regPass').value,
          conf=document.getElementById('regConf').value;
    let ok=true;
    if(first.length<2){fe('regFirst','regFirstErr','Enter your first name.');ok=false;}
    if(last.length<2){fe('regLast','regLastErr','Enter your last name.');ok=false;}
    if(!email||!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){fe('regEmail','regEmailErr','Enter a valid email address.');ok=false;}
    if(!/^[0-9]{10}$/.test(phone)){fe('regPhone','regPhoneErr','Enter a valid 10-digit phone number.');ok=false;}
    if(addr.length<5){fe('regAddress','regAddressErr','Enter your full shipping address.');ok=false;}
    if(pass.length<8){fe('regPass','regPassErr','Password must be at least 8 characters.');ok=false;}
    else if(!/(?=.*[A-Z])(?=.*\d)/.test(pass)){fe('regPass','regPassErr','Include 1 uppercase letter and 1 number.');ok=false;}
    if(pass!==conf){fe('regConf','regConfErr','Passwords do not match.');ok=false;}
    if(!ok)return;
    /* TODO: document.getElementById('registerForm').action='RegisterServlet';
             document.getElementById('registerForm').method='post';
             document.getElementById('registerForm').submit(); */
    showAlert('regAlert','Account created successfully! (connect RegisterServlet)','success');
}

/* ---- Login ---- */
function handleLogin(e) {
    e.preventDefault(); clearErrors();
    const email=document.getElementById('loginEmail').value.trim(),
          pass=document.getElementById('loginPass').value;
    let ok=true;
    if(!email||!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){fe('loginEmail','loginEmailErr','Enter a valid email address.');ok=false;}
    if(!pass){fe('loginPass','loginPassErr','Password is required.');ok=false;}
    if(!ok)return;
    /* TODO: document.getElementById('loginForm').action='LoginServlet';
             document.getElementById('loginForm').method='post';
             document.getElementById('loginForm').submit(); */
    showAlert('loginAlert','Logging in… (connect LoginServlet → redirect home.jsp)','info');
}

/* ---- Mouse parallax on hero sides ---- */
document.querySelectorAll('.hero-side').forEach(side => {
    side.addEventListener('mousemove', e => {
        const r=side.getBoundingClientRect(),
              x=((e.clientX-r.left)/r.width-0.5)*16,
              y=((e.clientY-r.top)/r.height-0.5)*12;
        side.querySelector('.side-content').style.transform=`translate(${x}px,${y}px)`;
    });
    side.addEventListener('mouseleave', () => {
        side.querySelector('.side-content').style.transform='translate(0,0)';
    });
});
</script>
</body>
</html>
