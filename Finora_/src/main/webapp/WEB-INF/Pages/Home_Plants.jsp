<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Redirect to login if not authenticated
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
    String firstName = (String) session.getAttribute("firstName");
    if (firstName == null) firstName = "Guest";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora — Home</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="home.css">
</head>
<body class="plants-mode" id="homeBody">

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar" id="navbar">
        <a href="home.jsp" class="nav-logo">Finora</a>

        <!-- World Toggle -->
        <div class="world-toggle" id="worldToggle">
            <button class="toggle-btn active" id="btnPlants" onclick="switchMode('plants')">Plants</button>
            <div class="toggle-divider"></div>
            <button class="toggle-btn" id="btnAqua" onclick="switchMode('aqua')">Aquarium</button>
        </div>

        <div class="nav-right">
            <button class="nav-icon-btn" title="Search">🔍</button>
            <button class="nav-icon-btn" title="Wishlist">♡</button>
            <button class="nav-icon-btn" title="Cart">🛒<span class="cart-badge">0</span></button>
            <a href="user_profile.jsp" class="nav-avatar" title="My Profile">
                <span class="avatar-initials"><%= firstName.charAt(0) %></span>
            </a>
        </div>
    </nav>

    <!-- ===== HERO — PLANTS STATE ===== -->
    <section class="hero plants-hero" id="plantsHero">
        <div class="hero-overlay"></div>
        <div class="hero-content reveal-hero">
            <span class="hero-label">Biological Artistry</span>
            <h1 class="hero-title">Bring Nature<br>Indoors</h1>
            <p class="hero-desc">Curated botanical masterpieces for the modern sanctuary. Elevate your living space with living sculptures that breathe life into every corner.</p>
            <div class="hero-btns">
                <a href="#collections" class="btn-hero-primary">Shop Now</a>
                <a href="#collections" class="btn-hero-secondary">View Collection</a>
            </div>
        </div>
        <div class="hero-img plants-img"></div>
    </section>

    <!-- ===== HERO — AQUARIUM STATE ===== -->
    <section class="hero aqua-hero hidden" id="aquaHero">
        <div class="hero-overlay aqua-overlay"></div>
        <div class="hero-content reveal-hero">
            <span class="hero-label aqua-label">Aquatic Artistry</span>
            <h1 class="hero-title">Dive Into<br>Elegance</h1>
            <p class="hero-desc">Transform your space with curated marine ecosystems that blend biological precision with timeless luxury design.</p>
            <div class="hero-btns">
                <a href="#collections" class="btn-hero-primary aqua-primary">Shop Now</a>
                <a href="#aqua-gallery" class="btn-hero-secondary">View Gallery</a>
            </div>
        </div>
        <div class="hero-img aqua-img"></div>
    </section>

    <!-- ===== PLANTS SECTIONS ===== -->
    <div id="plantsContent">
        <!-- Collections -->
        <section class="collections-section reveal" id="collections">
            <div class="section-header">
                <h2 class="section-title">Curated Collections</h2>
            </div>
            <div class="collections-grid">
                <div class="collection-card">
                    <div class="col-img indoor-img"></div>
                    <div class="col-info"><h3>Indoor</h3><p>Easy to care, always green</p></div>
                </div>
                <div class="collection-card">
                    <div class="col-img outdoor-img"></div>
                    <div class="col-info"><h3>Outdoor</h3><p>Hardy architectural green</p></div>
                </div>
                <div class="collection-card">
                    <div class="col-img succulents-img"></div>
                    <div class="col-info"><h3>Succulents</h3><p>Drought-tolerant, sculptural</p></div>
                </div>
            </div>
        </section>

        <!-- Top Selling Plants -->
        <section class="products-section reveal">
            <div class="section-header inline-header">
                <div>
                    <span class="label-tag">Curated Selection</span>
                    <h2 class="section-title">Top Selling Plants</h2>
                    <p class="section-sub">Exceptional botanical masterpieces curated for their rarity and cultural significance.</p>
                </div>
            </div>
            <div class="products-grid">
                <div class="product-card">
                    <div class="prod-img monstera-img">
                        <span class="prod-badge new-badge">NEW</span>
                    </div>
                    <div class="prod-info">
                        <h3>Monstera Deliciosa</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag">4 FEET</span><span class="tag">RARE</span><span class="tag">INDOOR</span></div>
                            <span class="prod-price">$64.80</span>
                        </div>
                        <div class="prod-stars">★★★★★ <span class="prod-count">(5)</span></div>
                        <button class="btn-add-cart" onclick="addToCart('Monstera Deliciosa', 64.80)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="prod-img snake-img">
                        <span class="prod-badge sale-badge">SALE</span>
                    </div>
                    <div class="prod-info">
                        <h3>Snake Plant Laurentii</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag">2 FEET</span><span class="tag">HARDY</span></div>
                            <span class="prod-price">$40.87</span>
                        </div>
                        <div class="prod-stars">★★★★☆ <span class="prod-count">(12 reviews)</span></div>
                        <button class="btn-add-cart" onclick="addToCart('Snake Plant', 40.87)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="prod-img olive-img"></div>
                    <div class="prod-info">
                        <h3>Arbequina Olive Tree</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag">6 FEET</span><span class="tag">OUTDOOR</span></div>
                            <span class="prod-price">$39.80</span>
                        </div>
                        <div class="prod-stars">★★★★★ <span class="prod-count">(8 reviews)</span></div>
                        <button class="btn-add-cart" onclick="addToCart('Olive Tree', 39.80)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="prod-img strelitzia-img"></div>
                    <div class="prod-info">
                        <h3>Strelitzia Nicolai</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag">5 FEET</span><span class="tag">RARE</span></div>
                            <span class="prod-price">$31.85</span>
                        </div>
                        <div class="prod-stars">★★★★☆ <span class="prod-count">(3 reviews)</span></div>
                        <button class="btn-add-cart" onclick="addToCart('Strelitzia', 31.85)">Add to Cart</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Care Guide Feature -->
        <section class="feature-section reveal plants-feature">
            <div class="feature-content">
                <div class="feature-text">
                    <span class="label-tag">Curated Knowledge</span>
                    <h2>Master the Art of<br>Plant Care</h2>
                    <p>Our Plant Care Guide, a 30-page companion designed to help you thrive. No botanist? No worries — we've made it simple.</p>
                    <ul class="feature-list">
                        <li><span class="check">✓</span> Hydration monitoring</li>
                        <li><span class="check">✓</span> 60+ species guides</li>
                    </ul>
                    <a href="#" class="btn-feature">Access Guide</a>
                </div>
                <div class="feature-visual plants-feature-img"></div>
            </div>
        </section>
    </div>

    <!-- ===== AQUARIUM SECTIONS ===== -->
    <div id="aquaContent" class="hidden">
        <!-- Aqua Categories -->
        <section class="collections-section reveal" id="aqua-gallery">
            <div class="section-header">
                <h2 class="section-title">Explore by Category</h2>
            </div>
            <div class="collections-grid aqua-grid">
                <div class="collection-card aqua-card">
                    <div class="col-img exotic-fish-img"></div>
                    <div class="col-info"><h3>Exotic Fish</h3><p>Rare species curated for balance.</p></div>
                </div>
                <div class="collection-card aqua-card">
                    <div class="col-img artisan-tanks-img"></div>
                    <div class="col-info"><h3>Artisan Tanks</h3><p>Frameless glass for endless views.</p></div>
                </div>
                <div class="collection-card aqua-card">
                    <div class="col-img precision-tech-img"></div>
                    <div class="col-info"><h3>Precision Tech</h3><p>Smart systems for silent control.</p></div>
                </div>
            </div>
        </section>

        <!-- Top Aquarium Products -->
        <section class="products-section reveal">
            <div class="section-header inline-header">
                <div>
                    <span class="label-tag aqua-tag-label">Curated Selection</span>
                    <h2 class="section-title">Top Aquarium Products</h2>
                    <p class="section-sub">Precision-engineered systems and living specimens for the discerning aquarist.</p>
                </div>
            </div>
            <div class="products-grid">
                <div class="product-card aqua-product-card">
                    <div class="prod-img solar-tang-img">
                        <span class="prod-badge new-badge">NEW ARRIVAL</span>
                    </div>
                    <div class="prod-info">
                        <h3>Solar Flare Tang</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag aqua-prod-tag">REEF SAFE</span><span class="tag aqua-prod-tag">BEGINNER</span></div>
                            <span class="prod-price aqua-price">$89.00</span>
                        </div>
                        <div class="prod-stars">★★★★☆ <span class="prod-count">(42)</span></div>
                        <button class="btn-add-cart aqua-cart" onclick="addToCart('Solar Flare Tang', 89.00)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card aqua-product-card">
                    <div class="prod-img horizon-led-img"></div>
                    <div class="prod-info">
                        <h3>Horizon Smart LED</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag aqua-prod-tag">APP CONTROL</span><span class="tag aqua-prod-tag">66 LUMENS</span></div>
                            <span class="prod-price aqua-price">$245.00</span>
                        </div>
                        <div class="prod-stars">★★★★★ <span class="prod-count">(128)</span></div>
                        <button class="btn-add-cart aqua-cart" onclick="addToCart('Horizon LED', 245.00)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card aqua-product-card">
                    <div class="prod-img azure-nano-img"></div>
                    <div class="prod-info">
                        <h3>Azure Nano 20G</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag aqua-prod-tag">CLEAR GLASS</span><span class="tag aqua-prod-tag">RIMLESS</span></div>
                            <span class="prod-price aqua-price">$310.00</span>
                        </div>
                        <div class="prod-stars">★★★★☆ <span class="prod-count">(15)</span></div>
                        <button class="btn-add-cart aqua-cart" onclick="addToCart('Azure Nano', 310.00)">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card aqua-product-card">
                    <div class="prod-img proflow-filter-img"></div>
                    <div class="prod-info">
                        <h3>Pro-Flow 600 Filter</h3>
                        <div class="prod-meta">
                            <div class="prod-tags"><span class="tag aqua-prod-tag">SILENT RUN</span><span class="tag aqua-prod-tag">3-STAGE</span></div>
                            <span class="prod-price aqua-price">$185.00</span>
                        </div>
                        <div class="prod-stars">★★★★★ <span class="prod-count">(56)</span></div>
                        <button class="btn-add-cart aqua-cart" onclick="addToCart('Pro-Flow Filter', 185.00)">Add to Cart</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Compatibility Finder Feature -->
        <section class="feature-section reveal aqua-feature">
            <div class="feature-content">
                <div class="feature-text">
                    <span class="label-tag aqua-tag-label">Biological Intelligence</span>
                    <h2>Compatibility<br>Finder</h2>
                    <p>Ensure a peaceful habitat. Our proprietary algorithm cross-references water parameters and social behaviors to find your fish's perfect tank mates.</p>
                    <div class="compatibility-steps">
                        <div class="compat-step"><span>1</span> Select Current Species</div>
                        <div class="compat-step"><span>2</span> Define Tank Size</div>
                        <div class="compat-step"><span>3</span> View Compatible Mates</div>
                    </div>
                    <a href="#" class="btn-feature aqua-feature-btn">Start Your Search 🔍</a>
                </div>
                <div class="feature-visual aqua-feature-img"></div>
            </div>
        </section>
    </div>

    <!-- ===== FOOTER ===== -->
    <footer class="home-footer">
        <div class="footer-inner">
            <div>
                <span class="footer-logo">Finora</span>
                <p>© 2024 Finora. Crafted for the discerning naturalist.</p>
            </div>
            <div class="footer-cols">
                <div class="footer-col">
                    <h4>Shop</h4>
                    <a href="#">Freshwater</a><a href="#">Saltwater</a><a href="#">Aquascaping</a>
                </div>
                <div class="footer-col">
                    <h4>Features</h4>
                    <a href="#">Compatibility Tool</a><a href="#">Smart Controls</a><a href="#">Bio-Monitoring</a>
                </div>
            </div>
            <div>
                <h4>Newsletter</h4>
                <div class="newsletter-form">
                    <input type="email" placeholder="Your email address" class="newsletter-input">
                    <button class="newsletter-btn">→</button>
                </div>
                <a href="Login.jsp" onclick="logoutUser(event)" class="logout-link">Sign Out</a>
            </div>
        </div>
    </footer>

    <!-- Cart notification toast -->
    <div class="cart-toast" id="cartToast"></div>

    <script>
        let cartCount = 0;
        const cartBadge = document.querySelector('.cart-badge');

        function switchMode(mode) {
            const body = document.getElementById('homeBody');
            const plantsHero = document.getElementById('plantsHero');
            const aquaHero   = document.getElementById('aquaHero');
            const plantsContent = document.getElementById('plantsContent');
            const aquaContent   = document.getElementById('aquaContent');
            const btnPlants = document.getElementById('btnPlants');
            const btnAqua   = document.getElementById('btnAqua');

            if (mode === 'plants') {
                body.className = 'plants-mode';
                plantsHero.classList.remove('hidden'); aquaHero.classList.add('hidden');
                plantsContent.classList.remove('hidden'); aquaContent.classList.add('hidden');
                btnPlants.classList.add('active'); btnAqua.classList.remove('active');
            } else {
                body.className = 'aqua-mode';
                aquaHero.classList.remove('hidden'); plantsHero.classList.add('hidden');
                aquaContent.classList.remove('hidden'); plantsContent.classList.add('hidden');
                btnAqua.classList.add('active'); btnPlants.classList.remove('active');
            }
            // Re-trigger reveal animations
            document.querySelectorAll('.reveal').forEach(el => {
                el.classList.remove('visible');
                setTimeout(() => revealObserver.observe(el), 100);
            });
        }

        function addToCart(name, price) {
            cartCount++;
            cartBadge.textContent = cartCount;
            cartBadge.classList.add('pop');
            setTimeout(() => cartBadge.classList.remove('pop'), 400);
            showToast(name + ' added to cart — $' + price.toFixed(2));
        }

        function showToast(msg) {
            const toast = document.getElementById('cartToast');
            toast.textContent = msg; toast.classList.add('show');
            setTimeout(() => toast.classList.remove('show'), 3000);
        }

        function logoutUser(e) {
            e.preventDefault();
            if (confirm('Sign out of Finora?')) window.location.href = 'LogoutServlet';
        }

        // Scroll reveal
        const revealObserver = new IntersectionObserver(entries => {
            entries.forEach(entry => { if (entry.isIntersecting) entry.target.classList.add('visible'); });
        }, { threshold: 0.1 });
        document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

        // Navbar scroll
        window.addEventListener('scroll', () => {
            document.getElementById('navbar').classList.toggle('scrolled', window.scrollY > 60);
        });

        // Hero entrance
        window.addEventListener('load', () => {
            document.querySelector('.reveal-hero').classList.add('animated');
        });
    </script>
</body>
</html>