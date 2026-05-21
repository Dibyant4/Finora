<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    String firstName = (String) session.getAttribute("firstName");
    String lastName  = (String) session.getAttribute("lastName");
    String email     = (String) session.getAttribute("email");
    String phone     = (String) session.getAttribute("phone");
    String memberSince = (String) session.getAttribute("memberSince");
    if (firstName  == null) firstName  = "Julian";
    if (lastName   == null) lastName   = "Reed";
    if (email      == null) email      = "user@finoramail.com";
    if (phone      == null) phone      = "";
    if (memberSince== null) memberSince= "2023";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora — My Profile</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="user_profile.css">
</head>
<body>

<!-- ===== TOP NAV ===== -->
<nav class="top-nav">
    <a href="home.jsp" class="nav-logo">Finora</a>
    <div class="nav-links">
        <a href="home.jsp">Plants</a>
        <a href="home.jsp" onclick="sessionStorage.setItem('mode','aqua')">Aquaria</a>
        <a href="#">Journal</a>
        <a href="#">Shop</a>
    </div>
    <div class="nav-icons">
        <a href="#" class="nav-icon">🛒</a>
        <a href="user_profile.jsp" class="nav-icon active-icon">👤</a>
    </div>
</nav>

<!-- ===== LAYOUT ===== -->
<div class="profile-layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="sidebar">
        <div class="sidebar-user">
            <div class="sidebar-avatar" id="sidebarAvatar">
                <img src="${sessionScope.profilePicUrl != null ? sessionScope.profilePicUrl : 'assets/default-avatar.jpg'}"
                     alt="Profile"
                     onerror="this.style.display='none'; document.getElementById('sidebarInitial').style.display='flex';"
                     id="sidebarAvatarImg">
                <span class="sidebar-initial" id="sidebarInitial"><%= firstName.charAt(0) %></span>
            </div>
            <h3 class="sidebar-name"><%= firstName %> <%= lastName %></h3>
            <span class="sidebar-since">MEMBER SINCE <%= memberSince %></span>
        </div>
        <nav class="sidebar-nav">
            <a href="#profile"  class="sidebar-link active" data-tab="profile">👤 Profile</a>
            <a href="#orders"   class="sidebar-link" data-tab="orders">📦 Orders</a>
            <a href="#wishlist" class="sidebar-link" data-tab="wishlist">♡ Wishlist</a>
            <a href="#settings" class="sidebar-link" data-tab="settings">⚙ Settings</a>
        </nav>
    </aside>

    <!-- ===== MAIN CONTENT ===== -->
    <main class="profile-main">

        <!-- SUCCESS / ERROR TOAST -->
        <c:if test="${not empty sessionScope.profileSuccess}">
            <div class="alert alert-success slide-in">
                <span>✓</span> ${sessionScope.profileSuccess}
            </div>
            <% session.removeAttribute("profileSuccess"); %>
        </c:if>
        <c:if test="${not empty sessionScope.profileError}">
            <div class="alert alert-error slide-in">
                <span>✕</span> ${sessionScope.profileError}
            </div>
            <% session.removeAttribute("profileError"); %>
        </c:if>

        <!-- ===== TAB: PROFILE ===== -->
        <div class="tab-content active" id="tab-profile">
            <div class="page-header">
                <h1>Edit Profile</h1>
                <p>Manage your account details and biological preferences. Your information helps us curate the best botanical and aquatic recommendations for your collection.</p>
            </div>

            <form class="profile-form" action="UpdateProfileServlet" method="POST" enctype="multipart/form-data" id="profileForm" novalidate>

                <!-- Avatar Upload -->
                <div class="avatar-section">
                    <div class="avatar-container">
                        <div class="avatar-ring">
                            <img src="${sessionScope.profilePicUrl != null ? sessionScope.profilePicUrl : 'assets/default-avatar.jpg'}"
                                 alt="Profile Photo" id="avatarPreview" class="avatar-img"
                                 onerror="this.style.display='none'; document.getElementById('avatarFallback').style.display='flex';">
                            <div class="avatar-fallback" id="avatarFallback"><%= firstName.charAt(0) %></div>
                        </div>
                        <label class="avatar-camera" for="profilePicInput" title="Change photo">📷</label>
                        <input type="file" id="profilePicInput" name="profilePic" accept="image/jpeg,image/png,image/gif" style="display:none;">
                    </div>
                    <div class="avatar-info">
                        <h3><%= firstName %> <%= lastName %></h3>
                        <span class="member-badge">Premium Member</span>
                        <p class="avatar-hint">Click the camera icon to upload a new photo. JPG or PNG, max 2MB.</p>
                    </div>
                </div>

                <!-- Account Status -->
                <div class="status-card">
                    <h4>Account Status</h4>
                    <div class="status-row">
                        <span>Email Verified</span>
                        <span class="status-badge verified">✓ Verified</span>
                    </div>
                    <div class="status-row">
                        <span>Two-Factor Auth</span>
                        <span class="status-badge disabled">DISABLED</span>
                    </div>
                </div>

                <!-- Personal Details -->
                <div class="form-card">
                    <h2 class="form-card-title">Personal Details</h2>
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label" for="firstName">First Name *</label>
                            <input type="text" id="firstName" name="firstName" class="form-input"
                                   value="<%= firstName %>" required placeholder="Julian">
                            <span class="field-error" id="firstNameError"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="lastName">Last Name *</label>
                            <input type="text" id="lastName" name="lastName" class="form-input"
                                   value="<%= lastName %>" required placeholder="Reed">
                            <span class="field-error" id="lastNameError"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="emailField">Email Address *</label>
                            <input type="email" id="emailField" name="email" class="form-input"
                                   value="<%= email %>" required placeholder="your@email.com">
                            <span class="field-error" id="emailError"></span>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" class="form-input"
                                   value="<%= phone %>" placeholder="+1 (555) 0123-4567">
                            <span class="field-error" id="phoneError"></span>
                        </div>
                    </div>
                </div>

                <!-- Shipping Address -->
                <div class="form-card">
                    <h2 class="form-card-title">Shipping Address</h2>
                    <div class="form-grid">
                        <div class="form-group full-span">
                            <label class="form-label" for="street">Street Address</label>
                            <input type="text" id="street" name="street" class="form-input"
                                   value="${sessionScope.street != null ? sessionScope.street : ''}"
                                   placeholder="842 Botanical Gardens Dr.">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="city">City</label>
                            <input type="text" id="city" name="city" class="form-input"
                                   value="${sessionScope.city != null ? sessionScope.city : ''}"
                                   placeholder="Portland">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="postal">Postal Code</label>
                            <input type="text" id="postal" name="postal" class="form-input"
                                   value="${sessionScope.postal != null ? sessionScope.postal : ''}"
                                   placeholder="97201">
                        </div>
                        <div class="form-group full-span">
                            <label class="form-label" for="country">Country</label>
                            <select id="country" name="country" class="form-input">
                                <option value="">Select country</option>
                                <option value="US" ${sessionScope.country == 'US' ? 'selected' : ''}>United States</option>
                                <option value="UK" ${sessionScope.country == 'UK' ? 'selected' : ''}>United Kingdom</option>
                                <option value="CA" ${sessionScope.country == 'CA' ? 'selected' : ''}>Canada</option>
                                <option value="AU" ${sessionScope.country == 'AU' ? 'selected' : ''}>Australia</option>
                                <option value="NP" ${sessionScope.country == 'NP' ? 'selected' : ''}>Nepal</option>
                                <option value="IN" ${sessionScope.country == 'IN' ? 'selected' : ''}>India</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Account Security -->
                <div class="form-card">
                    <h2 class="form-card-title">Account Security</h2>
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label" for="currentPw">Current Password</label>
                            <div class="input-pw-wrap">
                                <input type="password" id="currentPw" name="currentPassword" class="form-input" placeholder="••••••••••••">
                                <button type="button" class="toggle-pw" data-target="currentPw">👁</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="newPw">New Password</label>
                            <div class="input-pw-wrap">
                                <input type="password" id="newPw" name="newPassword" class="form-input" placeholder="Enter new password">
                                <button type="button" class="toggle-pw" data-target="newPw">👁</button>
                            </div>
                            <span class="field-error" id="newPwError"></span>
                        </div>
                    </div>
                    <div class="pw-strength-wrapper" id="pwStrengthWrapper" style="display:none;">
                        <div class="pw-strength-bar"><div class="pw-strength-fill" id="pwFill"></div></div>
                        <span class="pw-strength-label" id="pwLabel">Weak</span>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="button" class="btn-discard" onclick="discardChanges()">Discard Changes</button>
                    <button type="submit" class="btn-save" id="saveBtn">Save Changes</button>
                </div>
            </form>
        </div>

        <!-- ===== TAB: ORDERS ===== -->
        <div class="tab-content" id="tab-orders">
            <div class="page-header">
                <h1>My Orders</h1>
                <p>Track and manage your Finora orders.</p>
            </div>
            <div class="orders-list">
                <div class="order-card">
                    <div class="order-header">
                        <span class="order-id">#ORD-2894</span>
                        <span class="order-status shipped">Shipped</span>
                    </div>
                    <div class="order-body">
                        <p>Fiddle Leaf Fig x2</p>
                        <div class="order-meta">
                            <span>Oct 24, 2024</span>
                            <strong>$180.00</strong>
                        </div>
                    </div>
                </div>
                <div class="order-card">
                    <div class="order-header">
                        <span class="order-id">#ORD-2893</span>
                        <span class="order-status processing">Processing</span>
                    </div>
                    <div class="order-body">
                        <p>Bio-Active Filter Kit</p>
                        <div class="order-meta">
                            <span>Oct 23, 2024</span>
                            <strong>$1,240.00</strong>
                        </div>
                    </div>
                </div>
                <div class="order-card">
                    <div class="order-header">
                        <span class="order-id">#ORD-2892</span>
                        <span class="order-status delivered">Delivered</span>
                    </div>
                    <div class="order-body">
                        <p>Rare Orchid Vanda</p>
                        <div class="order-meta">
                            <span>Oct 20, 2024</span>
                            <strong>$85.00</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== TAB: WISHLIST ===== -->
        <div class="tab-content" id="tab-wishlist">
            <div class="page-header">
                <h1>My Wishlist</h1>
                <p>Items you've saved for later.</p>
            </div>
            <div class="wishlist-grid">
                <div class="wish-card">
                    <div class="wish-img wish-monstera"></div>
                    <div class="wish-info">
                        <h4>Monstera Deliciosa</h4>
                        <span class="wish-price">$64.80</span>
                        <button class="btn-wish-cart">Add to Cart</button>
                    </div>
                </div>
                <div class="wish-card">
                    <div class="wish-img wish-coral"></div>
                    <div class="wish-info">
                        <h4>Azure Nano Reef</h4>
                        <span class="wish-price">$299.00</span>
                        <button class="btn-wish-cart">Add to Cart</button>
                    </div>
                </div>
                <div class="wish-card">
                    <div class="wish-img wish-terrarium"></div>
                    <div class="wish-info">
                        <h4>Moss Terrarium Kit</h4>
                        <span class="wish-price">$95.00</span>
                        <button class="btn-wish-cart">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===== TAB: SETTINGS ===== -->
        <div class="tab-content" id="tab-settings">
            <div class="page-header">
                <h1>Account Settings</h1>
                <p>Manage your preferences and account options.</p>
            </div>
            <div class="settings-list">
                <div class="settings-row">
                    <div>
                        <h4>Email Notifications</h4>
                        <p>Receive updates on orders and collections</p>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" checked>
                        <span class="slider"></span>
                    </label>
                </div>
                <div class="settings-row">
                    <div>
                        <h4>Newsletter</h4>
                        <p>Weekly botanical and aquatic discoveries</p>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox">
                        <span class="slider"></span>
                    </label>
                </div>
                <div class="settings-row danger-row">
                    <div>
                        <h4>Sign Out</h4>
                        <p>Log out from this device</p>
                    </div>
                    <a href="LogoutServlet" class="btn-danger-sm" onclick="return confirm('Sign out?')">Sign Out</a>
                </div>
                <div class="settings-row danger-row">
                    <div>
                        <h4>Delete Account</h4>
                        <p>Permanently remove your account and data</p>
                    </div>
                    <button class="btn-danger-sm btn-delete" onclick="return confirm('Are you absolutely sure? This cannot be undone.')">Delete Account</button>
                </div>
            </div>
        </div>

    </main>
</div>

<script>
    // Tab switching
    document.querySelectorAll('.sidebar-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const tab = this.dataset.tab;
            document.querySelectorAll('.sidebar-link').forEach(l => l.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
            document.getElementById('tab-' + tab).classList.add('active');
        });
    });

    // Avatar preview
    document.getElementById('profilePicInput').addEventListener('change', function() {
        const file = this.files[0];
        if (!file) return;
        if (file.size > 2 * 1024 * 1024) { alert('Image must be under 2MB.'); this.value = ''; return; }
        const reader = new FileReader();
        reader.onload = e => {
            const img = document.getElementById('avatarPreview');
            const fb  = document.getElementById('avatarFallback');
            const sideImg = document.getElementById('sidebarAvatarImg');
            img.src = e.target.result; img.style.display = 'block'; fb.style.display = 'none';
            if (sideImg) { sideImg.src = e.target.result; sideImg.style.display = 'block'; document.getElementById('sidebarInitial').style.display = 'none'; }
        };
        reader.readAsDataURL(file);
    });

    // Password toggles
    document.querySelectorAll('.toggle-pw').forEach(btn => {
        btn.addEventListener('click', function() {
            const inp = document.getElementById(this.dataset.target);
            inp.type = inp.type === 'password' ? 'text' : 'password';
            this.textContent = inp.type === 'password' ? '👁' : '🙈';
        });
    });

    // Password strength
    document.getElementById('newPw').addEventListener('input', function() {
        const wrapper = document.getElementById('pwStrengthWrapper');
        const fill = document.getElementById('pwFill');
        const label = document.getElementById('pwLabel');
        if (!this.value) { wrapper.style.display = 'none'; return; }
        wrapper.style.display = 'flex';
        let score = 0;
        if (this.value.length >= 8) score++;
        if (/[A-Z]/.test(this.value)) score++;
        if (/[0-9]/.test(this.value)) score++;
        if (/[^A-Za-z0-9]/.test(this.value)) score++;
        const lvls = [{w:'25%',c:'#e74c3c',l:'Weak'},{w:'50%',c:'#e67e22',l:'Fair'},{w:'75%',c:'#f1c40f',l:'Good'},{w:'100%',c:'#27ae60',l:'Strong'}];
        const lvl = lvls[score-1] || lvls[0];
        fill.style.width = lvl.w; fill.style.background = lvl.c; label.textContent = lvl.l; label.style.color = lvl.c;
    });

    // Form validation
    const profileForm = document.getElementById('profileForm');
    profileForm.addEventListener('submit', function(e) {
        let valid = true;
        const fn = document.getElementById('firstName').value.trim();
        const ln = document.getElementById('lastName').value.trim();
        const em = document.getElementById('emailField').value.trim();
        if (!fn || /[^a-zA-Z\s\-]/.test(fn)) { showFErr('firstNameError', !fn ? 'First name required.' : 'Letters only.'); valid = false; } else clearFErr('firstNameError');
        if (!ln || /[^a-zA-Z\s\-]/.test(ln)) { showFErr('lastNameError',  !ln ? 'Last name required.'  : 'Letters only.'); valid = false; } else clearFErr('lastNameError');
        if (!em || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(em)) { showFErr('emailError', !em ? 'Email required.' : 'Invalid email.'); valid = false; } else clearFErr('emailError');
        const newPw = document.getElementById('newPw').value;
        if (newPw && newPw.length < 8) { showFErr('newPwError', 'Password must be at least 8 characters.'); valid = false; } else clearFErr('newPwError');
        if (!valid) e.preventDefault();
        else document.getElementById('saveBtn').textContent = 'Saving…';
    });
    function showFErr(id, msg) { const el=document.getElementById(id); el.textContent=msg; el.style.display='block'; }
    function clearFErr(id) { const el=document.getElementById(id); el.textContent=''; el.style.display='none'; }

    function discardChanges() {
        if (confirm('Discard all unsaved changes?')) profileForm.reset();
    }

    // Auto-hide alerts
    document.querySelectorAll('.alert').forEach(al => setTimeout(() => al.style.opacity = '0', 4000));
</script>
</body>
</html>
