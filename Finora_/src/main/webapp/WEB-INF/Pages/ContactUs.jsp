<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=1440" />
<title>Contact — Finora</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,500;0,9..144,600;0,9..144,700;1,9..144,400&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="contact.css" />
</head>
<body>

  <!-- ============================================================
     FINORA — GLOBAL NAVBAR (reusable component)
     Include this on every page. Wrap page in body.finora--plants
     or body.finora--aqua to drive world theme.
     ============================================================ -->
<header class="nav" id="finoraNav">
  <!-- LEFT — Logo -->
  <a href="home.html" class="nav-logo-wrap" aria-label="Finora home">
    <img src="assets/logos/logo-combined.png" alt="Finora"
         class="nav-logo nav-logo--combined" height="36">
    <img src="assets/logos/logo-plants.png" alt="Finora Plants"
         class="nav-logo nav-logo--plants" height="36">
    <img src="assets/logos/logo-aquarium.png" alt="Finora Aquarium"
         class="nav-logo nav-logo--aqua" height="36">
  </a>

  <!-- CENTER — World toggle -->
  <div class="nav-toggle" role="tablist" aria-label="Switch world">
    <span class="nav-toggle__slider" aria-hidden="true"></span>
    <button type="button" class="nav-toggle__btn nav-toggle__btn--plants"
            data-world="plants" role="tab" aria-selected="true">
      <span aria-hidden="true">🌿</span> Plants
    </button>
    <button type="button" class="nav-toggle__btn nav-toggle__btn--aqua"
            data-world="aqua" role="tab" aria-selected="false">
      <span aria-hidden="true">🐟</span> Aquarium
    </button>
  </div>

  <!-- RIGHT — Links + icons -->
  <nav class="nav-right" aria-label="Primary">
    <a href="shop.html" class="nav-link">Shop</a>
    <a href="about.html" class="nav-link">About Us</a>
    <a href="contact.html" class="nav-link">Contact Us</a>

    <span class="nav-divider" aria-hidden="true"></span>

    <button type="button" class="nav-icon" id="navSearchBtn" aria-label="Search">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
           stroke-linecap="round" stroke-linejoin="round" width="20" height="20">
        <circle cx="11" cy="11" r="7"></circle>
        <path d="m20 20-3.5-3.5"></path>
      </svg>
    </button>

    <a href="dashboard/dashboard-wishlist.html" class="nav-icon nav-icon--wishlist" aria-label="Wishlist">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
           stroke-linecap="round" stroke-linejoin="round" width="20" height="20">
        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
      </svg>
      <span class="nav-badge" data-count="3">3</span>
    </a>

    <div class="nav-profile-wrap">
      <button type="button" class="nav-icon nav-icon--profile" id="navProfileBtn" aria-label="Profile">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
             stroke-linecap="round" stroke-linejoin="round" width="20" height="20">
          <circle cx="12" cy="8" r="4"></circle>
          <path d="M4 21a8 8 0 0 1 16 0"></path>
        </svg>
      </button>

      <div class="nav-dropdown" id="navDropdown" role="menu" hidden>
        <div class="nav-dropdown__head">
          <div class="nav-dropdown__avatar" aria-hidden="true">A</div>
          <div class="nav-dropdown__name">Aarav Shrestha</div>
          <div class="nav-dropdown__email">aarav@finora.np</div>
          <span class="nav-dropdown__world">🌿 Plants</span>
        </div>
        <div class="nav-dropdown__sep"></div>
        <a href="dashboard/dashboard-home.html" class="nav-dropdown__item" role="menuitem">
          <span class="nav-dropdown__icon">👤</span> My Dashboard
        </a>
        <a href="dashboard/dashboard-orders.html" class="nav-dropdown__item" role="menuitem">
          <span class="nav-dropdown__icon">📦</span> My Orders
        </a>
        <a href="dashboard/dashboard-wishlist.html" class="nav-dropdown__item" role="menuitem">
          <span class="nav-dropdown__icon">💚</span> Wishlist
        </a>
        <a href="dashboard/dashboard-reviews.html" class="nav-dropdown__item" role="menuitem">
          <span class="nav-dropdown__icon">⭐</span> My Reviews
        </a>
        <a href="dashboard/dashboard-settings.html" class="nav-dropdown__item" role="menuitem">
          <span class="nav-dropdown__icon">⚙️</span> Settings
        </a>
        <div class="nav-dropdown__sep"></div>
        <a href="index.html" class="nav-dropdown__item nav-dropdown__item--logout" role="menuitem">
          <span class="nav-dropdown__icon">→</span> Sign Out
        </a>
      </div>
    </div>
  </nav>
</header>

<!-- ============================================================
     SEARCH OVERLAY (global)
     ============================================================ -->
<div class="search-overlay" id="searchOverlay" hidden>
  <button type="button" class="search-overlay__close" id="searchOverlayClose" aria-label="Close search">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
         stroke-linecap="round" stroke-linejoin="round" width="20" height="20">
      <path d="M18 6 6 18M6 6l12 12"/>
    </svg>
  </button>

  <div class="search-overlay__inner">
    <span class="eyebrow">Search Finora</span>

    <div class="search-overlay__field">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"
           stroke-linecap="round" stroke-linejoin="round" width="24" height="24"
           class="search-overlay__icon">
        <circle cx="11" cy="11" r="7"></circle>
        <path d="m20 20-3.5-3.5"></path>
      </svg>
      <input type="text" class="search-overlay__input" id="searchOverlayInput"
             placeholder="Search plants, fish, tanks…" autocomplete="off">
    </div>

    <div class="search-overlay__filters">
      <button class="search-pill is-active" type="button">All Results</button>
      <button class="search-pill" type="button">🌿 Plants</button>
      <button class="search-pill" type="button">🐟 Aquarium</button>
    </div>

    <div class="search-overlay__section">
      <div class="search-overlay__label">Popular right now</div>
      <div class="search-overlay__chips">
        <button class="search-chip" type="button">Monstera Albo</button>
        <button class="search-chip" type="button">Betta Fish</button>
        <button class="search-chip" type="button">Nano Tank</button>
        <button class="search-chip" type="button">Pothos</button>
        <button class="search-chip" type="button">Clownfish</button>
        <button class="search-chip" type="button">LED Grow Light</button>
      </div>
    </div>
  </div>
</div>

<script src="finora-global.js" defer></script>

<style>
  /* ============================================================
   FINORA — PERMANENT GLOBAL NAVBAR
   Always white. Always 68px. Always present.
   ============================================================ */

.nav {
  position: sticky;
  top: 0;
  z-index: 1000;
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  height: 68px;
  padding: 0 40px;
  background: var(--white);
  border-bottom: 1px solid var(--mist);
  box-shadow: var(--shadow-sm);
  transition: height var(--dur-base) var(--ease-out),
              box-shadow var(--dur-base) var(--ease-out);
}
.nav.is-scrolled {
  height: 56px;
  box-shadow: var(--shadow-md);
}

/* ---------- LEFT — Logo ---------- */
.nav-logo-wrap {
  position: relative;
  display: inline-flex;
  align-items: center;
  height: 36px;
  width: 160px;
  transition: transform var(--dur-base) var(--ease-out);
}
.nav-logo-wrap:hover { transform: scale(1.02); }
.nav.is-scrolled .nav-logo-wrap { height: 28px; }
.nav.is-scrolled .nav-logo { height: 28px !important; }

.nav-logo {
  position: absolute;
  inset: 0;
  height: 36px;
  width: auto;
  opacity: 0;
  transition: opacity var(--dur-base) var(--ease-out);
}
.nav-logo--combined { opacity: 1; }
body.finora--plants .nav-logo--combined,
body.finora--aqua   .nav-logo--combined { opacity: 0; }
body.finora--plants .nav-logo--plants { opacity: 1; transition-delay: 120ms; }
body.finora--aqua   .nav-logo--aqua   { opacity: 1; transition-delay: 120ms; }

/* ---------- CENTER — World toggle ---------- */
.nav-toggle {
  position: relative;
  display: flex;
  align-items: center;
  width: 220px;
  height: 40px;
  padding: 3px;
  background: var(--bone);
  border: 1px solid var(--mist);
  border-radius: var(--radius-pill);
  box-shadow: inset 0 1px 4px rgba(14,27,26,0.05);
  transition: height var(--dur-base) var(--ease-out);
}
.nav.is-scrolled .nav-toggle { height: 34px; }

.nav-toggle__slider {
  position: absolute;
  top: 3px;
  left: 3px;
  width: calc(50% - 3px);
  height: calc(100% - 6px);
  border-radius: var(--radius-pill);
  background: var(--leaf);
  box-shadow: var(--shadow-sm);
  transition: transform var(--dur-switch) var(--ease-out),
              background-color var(--dur-switch) var(--ease-out);
}
body.finora--aqua .nav-toggle__slider {
  transform: translateX(100%);
  background: var(--deep);
}

.nav-toggle__btn {
  position: relative;
  z-index: 1;
  flex: 1;
  height: 100%;
  border-radius: var(--radius-pill);
  font: 500 14px/1 var(--font-body);
  letter-spacing: 0.02em;
  color: var(--stone);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  transition: color var(--dur-switch) var(--ease-out);
}
body.finora--plants .nav-toggle__btn--plants,
body.finora--aqua   .nav-toggle__btn--aqua { color: var(--white); }
.nav-toggle__btn:hover:not(.is-active) { opacity: 0.85; }

/* ---------- RIGHT — Links + icons ---------- */
.nav-right {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 8px;
}
.nav-link {
  position: relative;
  padding: 8px 12px;
  border-radius: 8px;
  font: 400 15px/1 var(--font-body);
  color: var(--ink);
  transition: background var(--dur-base) var(--ease-out),
              color var(--dur-base) var(--ease-out);
}
.nav-link::after {
  content: '';
  position: absolute;
  left: 12px; right: 12px; bottom: 4px;
  height: 2px;
  background: var(--color-primary);
  transform: scaleX(0);
  transform-origin: left center;
  transition: transform var(--dur-base) var(--ease-out);
}
.nav-link:hover {
  background: var(--bone);
  color: var(--color-primary);
}
.nav-link:hover::after,
.nav-link.is-active::after { transform: scaleX(1); }
.nav-link.is-active { color: var(--color-primary); }

.nav-divider {
  display: inline-block;
  width: 1px;
  height: 24px;
  background: var(--mist);
  margin: 0 8px;
}

.nav-icon {
  position: relative;
  width: 40px;
  height: 40px;
  border-radius: 10px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: var(--ink);
  transition: background var(--dur-base) var(--ease-out),
              color var(--dur-base) var(--ease-out),
              transform var(--dur-base) var(--ease-out);
}
.nav-icon:hover {
  background: var(--bone);
  color: var(--color-primary);
  transform: translateY(-1px);
}
.nav-icon--wishlist:hover svg { transform: scale(1.08); fill: var(--color-accent); stroke: var(--color-accent); }
.nav-icon--wishlist svg { transition: transform var(--dur-base) var(--ease-out), fill var(--dur-base), stroke var(--dur-base); }

.nav-badge {
  position: absolute;
  top: -4px;
  right: -4px;
  min-width: 18px;
  height: 18px;
  padding: 0 4px;
  border-radius: 999px;
  background: var(--gold);
  color: var(--ink);
  border: 2px solid var(--white);
  font: 700 10px/14px var(--font-mono);
  text-align: center;
}

/* ---------- Profile dropdown ---------- */
.nav-profile-wrap { position: relative; }
.nav-dropdown {
  position: absolute;
  top: 48px;
  right: 0;
  width: 240px;
  background: var(--white);
  border: 1px solid var(--mist);
  border-radius: var(--radius-card);
  box-shadow: var(--shadow-lg);
  overflow: hidden;
  opacity: 0;
  transform: translateY(-8px);
  transition: opacity var(--dur-base) var(--ease-out),
              transform var(--dur-base) var(--ease-out);
  pointer-events: none;
}
.nav-dropdown.is-open {
  opacity: 1;
  transform: translateY(0);
  pointer-events: auto;
}
.nav-dropdown[hidden] { display: block; } /* override default; visibility via opacity */

.nav-dropdown__head {
  padding: 18px 20px;
  background: var(--bone);
  border-bottom: 1px solid var(--mist);
}
.nav-dropdown__avatar {
  width: 40px; height: 40px; border-radius: 50%;
  background: var(--color-primary); color: var(--white);
  display: flex; align-items: center; justify-content: center;
  font: 600 16px var(--font-body);
  border: 2px solid var(--brand);
  margin-bottom: 10px;
}
.nav-dropdown__name { font: 600 14px var(--font-body); color: var(--ink); }
.nav-dropdown__email { font: 400 12px var(--font-body); color: var(--stone); margin-top: 2px;
  white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.nav-dropdown__world {
  display: inline-block;
  margin-top: 10px;
  padding: 3px 10px;
  border-radius: var(--radius-pill);
  background: var(--white);
  border: 1px solid var(--mist);
  font: 500 11px var(--font-body);
  color: var(--color-primary);
}
body.finora--aqua .nav-dropdown__world::before { content: '🐟 '; }

.nav-dropdown__sep { height: 1px; background: var(--mist); }
.nav-dropdown__item {
  display: flex; align-items: center; gap: 10px;
  height: 44px;
  padding: 0 20px;
  font: 400 14px var(--font-body);
  color: var(--ink);
  transition: background var(--dur-base), color var(--dur-base);
}
.nav-dropdown__item:hover {
  background: var(--bone);
  color: var(--color-primary);
}
.nav-dropdown__icon { width: 16px; display: inline-flex; justify-content: center; }
.nav-dropdown__item--logout { color: var(--stone); padding: 12px 20px; height: auto; }
.nav-dropdown__item--logout:hover { color: #B5443A; background: var(--white); }

</style>

<!-- ============ HEADER ============ -->
<header class="nav" id="nav">
  <div class="nav__inner container">
    <a href="index.html" class="brand">
      <img src="assets/logo-combined.png" alt="Finora" class="main-logo" onerror="this.style.display='none'; this.nextElementSibling.style.display='inline-flex';" />
      <span class="brand__fallback"><span class="brand__mark"></span>Finora</span>
    </a>
    <nav class="nav__links">
      <a href="index.html">Home</a>
      <a href="plants.html">Plants</a>
      <a href="aquarium.html">Aquarium</a>
      <a href="care-guides.html">Care Guides</a>
      <a href="compatibility.html">Compatibility</a>
      <a href="contact.html" class="is-active">Contact</a>
    </nav>
    <div class="nav__cta">
      <button class="icon-btn" aria-label="Search">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg>
      </button>
      <button class="icon-btn" aria-label="Cart">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M3 5h2l2.5 11h11L21 8H6"/><circle cx="9" cy="20" r="1.4"/><circle cx="18" cy="20" r="1.4"/></svg>
      </button>
      <button class="icon-btn" aria-label="Account">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="8" r="4"/><path d="M4 21c1.5-4 5-6 8-6s6.5 2 8 6"/></svg>
      </button>
      <a href="dashboard.html" class="btn btn--ghost btn--sm">Enter Dashboard</a>
    </div>
  </div>
</header>

<!-- ============ HERO ============ -->
<section class="hero container">
  <div class="hero__left reveal">
    <span class="eyebrow">Get in Touch</span>
    <h1 class="hero__title">Let's care for your <em>world</em> together.</h1>
    <p class="hero__sub">We're here to help with plant care, aquarium guidance, orders, deliveries, and everything in between.</p>
    <div class="hero__cta">
      <a href="plants.html" class="btn btn--sage">Browse Plants</a>
      <a href="aquarium.html" class="btn btn--foam">Browse Aquarium</a>
    </div>
  </div>
  <div class="hero__right reveal">
    <figure class="hero__card">
      <img src="assets/contact/contact-hero.jpg" alt="A naturally-lit Finora studio with plants and aquarium" class="contact-hero-image" />
    </figure>
    <div class="float-card float-card--plants">
      <span class="float-card__dot" style="background:#1B3A2A"></span>
      <div>
        <strong>Plant Support</strong>
        <small>Care · Repot · Light</small>
      </div>
    </div>
    <div class="float-card float-card--aqua">
      <span class="float-card__dot" style="background:#0A2540"></span>
      <div>
        <strong>Aquarium Support</strong>
        <small>Cycle · Stock · Plan</small>
      </div>
    </div>
  </div>
</section>

<!-- ============ CONTACT INFO CARDS ============ -->
<section class="info container">
  <div class="info__grid">
    <article class="info-card reveal">
      <div class="info-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M5 4h4l2 5-2.5 1.5a12 12 0 0 0 5 5L15 13l5 2v4a2 2 0 0 1-2 2A15 15 0 0 1 3 6a2 2 0 0 1 2-2z"/></svg>
      </div>
      <h3>Call Us</h3>
      <p class="info-card__main">9765515500</p>
      <p class="info-card__sub">Mon–Fri · 9AM–6PM</p>
    </article>
    <article class="info-card reveal">
      <div class="info-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="m3 7 9 6 9-6"/></svg>
      </div>
      <h3>Email Support</h3>
      <p class="info-card__main">finora@gmail.com</p>
      <p class="info-card__sub">We usually reply within 24 hours.</p>
    </article>
    <article class="info-card reveal">
      <div class="info-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor"/></svg>
      </div>
      <h3>Instagram</h3>
      <p class="info-card__main">@finora.world</p>
      <p class="info-card__sub">Daily care tips & new arrivals.</p>
    </article>
    <article class="info-card reveal">
      <div class="info-card__icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 22s7-6.5 7-12a7 7 0 1 0-14 0c0 5.5 7 12 7 12z"/><circle cx="12" cy="10" r="2.5"/></svg>
      </div>
      <h3>Studio</h3>
      <p class="info-card__main">Kathmandu, Nepal</p>
      <p class="info-card__sub">Serving both worlds beautifully.</p>
    </article>
  </div>
</section>

<!-- ============ CONTACT FORM ============ -->
<section class="form-section container">
  <div class="form-card reveal">
    <div class="form-card__left">
      <span class="eyebrow">Message</span>
      <h2>Send us a <em>message</em></h2>
      <p class="lede">We'd love to hear from you — whether it's a question about a thirsty Monstera or stocking your new tank.</p>
      <div class="badge-row">
        <span class="badge">Orders</span>
        <span class="badge">Plants</span>
        <span class="badge">Aquarium</span>
        <span class="badge">Returns</span>
        <span class="badge">Care Help</span>
      </div>
      <figure class="form-card__art">
        <img src="assets/contact/studio-detail.jpg" alt="Finora studio detail with plants and glass" />
      </figure>
    </div>
    <form class="form-card__right" action="ContactServlet" method="POST">
      <div class="field">
        <label for="name">Full Name</label>
        <input id="name" name="name" type="text" placeholder="Your full name" required />
      </div>
      <div class="field-row">
        <div class="field">
          <label for="email">Email Address</label>
          <input id="email" name="email" type="email" placeholder="you@email.com" required />
        </div>
        <div class="field">
          <label for="phone">Phone Number</label>
          <input id="phone" name="phone" type="tel" placeholder="+977 ..." />
        </div>
      </div>
      <div class="field">
        <label for="subject">Subject</label>
        <select id="subject" name="subject" required>
          <option value="">Choose a topic…</option>
          <option>Order Support</option>
          <option>Plant Care</option>
          <option>Aquarium Help</option>
          <option>Delivery Issue</option>
          <option>Returns & Refunds</option>
          <option>Partnership Inquiry</option>
          <option>General Question</option>
        </select>
      </div>
      <div class="field">
        <label for="message">Message</label>
        <textarea id="message" name="message" placeholder="Tell us a little about what you need help with…" required></textarea>
      </div>
      <button type="submit" class="btn btn--brand btn--lg">Send Message</button>
      <p class="form-note">We usually respond within 24 hours.</p>
    </form>
  </div>
</section>

<!-- ============ SUPPORT CATEGORIES ============ -->
<section class="support container">
  <header class="section-head">
    <span class="eyebrow">Support</span>
    <h2>How can we <em>help?</em></h2>
    <p class="lede">Pick a path — we've grouped our most-loved help topics into four calm corners.</p>
  </header>
  <div class="support__grid">
    <article class="support-card reveal">
      <div class="support-card__icon support-card__icon--sage">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 22c0-7 4-12 9-12-1 8-5 12-9 12z"/><path d="M12 22c0-7-4-12-9-12 1 8 5 12 9 12z"/><path d="M12 22V8"/></svg>
      </div>
      <h3>Plant Care Help</h3>
      <p>Watering schedules, light needs, repotting, and diagnosing leaf signals.</p>
      <a class="link-arrow" href="care-guides.html">Learn More →</a>
    </article>
    <article class="support-card reveal">
      <div class="support-card__icon support-card__icon--foam">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M3 13c4-4 7 4 11 0s7 0 7 0"/><path d="M3 17c4-4 7 4 11 0s7 0 7 0"/><circle cx="7" cy="8" r="1.3" fill="currentColor"/></svg>
      </div>
      <h3>Aquarium Compatibility</h3>
      <p>Match species, plants, and water parameters for a calm, balanced tank.</p>
      <a class="link-arrow" href="compatibility.html">Learn More →</a>
    </article>
    <article class="support-card reveal">
      <div class="support-card__icon support-card__icon--gold">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="3" y="7" width="13" height="10" rx="2"/><path d="M16 10h3l2 3v4h-5"/><circle cx="7.5" cy="18.5" r="1.8"/><circle cx="17.5" cy="18.5" r="1.8"/></svg>
      </div>
      <h3>Order Tracking</h3>
      <p>Track your delivery, change addresses, and view your full order history.</p>
      <a class="link-arrow" href="orders.html">Learn More →</a>
    </article>
    <article class="support-card reveal">
      <div class="support-card__icon support-card__icon--clay">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M4 8h12a4 4 0 0 1 0 8H8"/><path d="m8 12-4 4 4 4"/></svg>
      </div>
      <h3>Returns & Refunds</h3>
      <p>Easy returns within 14 days, plus a healthy-arrival guarantee on plants.</p>
      <a class="link-arrow" href="returns.html">Learn More →</a>
    </article>
  </div>
</section>

<!-- ============ SOCIAL COMMUNITY ============ -->
<section class="community">
  <div class="container community__inner">
    <div class="community__left reveal">
      <div class="collage">
        <img src="assets/contact/collage-1.jpg" alt="Plant styling" class="collage__a" />
        <img src="assets/contact/collage-2.jpg" alt="Aquascape closeup" class="collage__b" />
        <img src="assets/contact/collage-3.jpg" alt="Hands repotting" class="collage__c" />
      </div>
    </div>
    <div class="community__right reveal">
      <span class="eyebrow">Community</span>
      <h2>Join the <em>Finora</em> community.</h2>
      <p class="lede">Discover plant styling inspiration, aquarium setups, seasonal care tips, and behind-the-scenes moments from both worlds.</p>
      <div class="social-row">
        <a class="social-btn social-btn--primary" href="#"><span>Instagram</span></a>
        <a class="social-btn" href="#"><span>Pinterest</span></a>
        <a class="social-btn" href="#"><span>Facebook</span></a>
      </div>
      <div class="follower-row">
        <span class="follower-pill">🌿 12k plant lovers</span>
        <span class="follower-pill">🐟 8k aquarium keepers</span>
      </div>
    </div>
  </div>
</section>

<!-- ============ FAQ ============ -->
<section class="faq container">
  <div class="faq__card">
    <header class="section-head section-head--tight">
      <span class="eyebrow">FAQ</span>
      <h2>Frequently Asked <em>Questions</em></h2>
    </header>
    <div class="faq__list">
      <details class="faq__item" open>
        <summary>How long does delivery take?<span class="faq__plus"></span></summary>
        <p>Most orders within Kathmandu Valley arrive in 1–2 days. Nationwide delivery typically takes 3–5 business days. Live plants and aquatic livestock ship on Mon–Wed only.</p>
      </details>
      <details class="faq__item">
        <summary>Are plants guaranteed healthy?<span class="faq__plus"></span></summary>
        <p>Yes — every plant is covered by our 7-day healthy-arrival guarantee. Send us a photo within 7 days and we'll replace or refund.</p>
      </details>
      <details class="faq__item">
        <summary>Can I return aquarium products?<span class="faq__plus"></span></summary>
        <p>Unopened hardware can be returned within 14 days. For hygiene reasons, food, plants and livestock are non-returnable.</p>
      </details>
      <details class="faq__item">
        <summary>How do I track my order?<span class="faq__plus"></span></summary>
        <p>You'll receive a tracking link by email and SMS once your order ships. You can also view live status from your dashboard.</p>
      </details>
      <details class="faq__item">
        <summary>Do you offer care support?<span class="faq__plus"></span></summary>
        <p>Always. Message us anytime — our care team replies within 24 hours and offers free guidance for every Finora order.</p>
      </details>
    </div>
  </div>
</section>

<!-- ============ MAP / STUDIO ============ -->
<section class="studio container">
  <div class="studio__left reveal">
    <figure class="map-card">
      <img src="assets/contact/map.jpg" alt="Map showing Finora studio in Kathmandu" />
      <figcaption class="map-card__label">
        <span class="map-card__dot"></span>
        Finora Studio · Kathmandu
      </figcaption>
    </figure>
  </div>
  <div class="studio__right reveal">
    <span class="eyebrow">Visit Us</span>
    <h2>Visit or reach out <em>anytime.</em></h2>
    <p class="lede">Step into our greenhouse-meets-aquascape studio, or send a note — we're always glad to hear from you.</p>
    <ul class="studio__details">
      <li><strong>Address</strong><span>Kathmandu, Nepal</span></li>
      <li><strong>Hours</strong><span>Mon–Fri · 9AM–6PM</span></li>
      <li><strong>Best for</strong><span>Plant pickup · Tank consults</span></li>
    </ul>
    <div class="studio__mini">
      <a href="mailto:finora@gmail.com" class="mini-card">
        <small>Email</small><strong>finora@gmail.com</strong>
      </a>
      <a href="tel:9765515500" class="mini-card">
        <small>Phone</small><strong>9765515500</strong>
      </a>
      <a href="#" class="mini-card">
        <small>Instagram</small><strong>@finora.world</strong>
      </a>
    </div>
  </div>
</section>

<!-- ============ FOOTER ============ -->
<footer class="foot">
  <div class="container foot__inner">
    <div class="foot__brand">
      <a href="index.html" class="brand brand--light">
        <span class="brand__mark"></span>Finora
      </a>
      <p class="foot__tag">Living things, beautifully kept.</p>
    </div>
    <div class="foot__cols">
      <div>
        <h5>Shop</h5>
        <a href="#">Plants</a><a href="#">Aquarium</a><a href="#">Care Kits</a><a href="#">Gift Cards</a>
      </div>
      <div>
        <h5>Support</h5>
        <a href="#">Contact</a><a href="#">Shipping</a><a href="#">Returns</a><a href="#">FAQ</a>
      </div>
      <div>
        <h5>Company</h5>
        <a href="#">About</a><a href="#">Journal</a><a href="#">Careers</a><a href="#">Studio Visits</a>
      </div>
      <div>
        <h5>Social</h5>
        <a href="#">Instagram</a><a href="#">Pinterest</a><a href="#">Facebook</a><a href="#">YouTube</a>
      </div>
    </div>
  </div>
  <div class="container foot__base">
    <span>© 2025 Finora. All rights reserved.</span>
    <div class="foot__base-right">
      <a href="#">Privacy Policy</a>
      <a href="#">Terms</a>
      <select class="currency">
        <option>NPR ₨</option><option>USD $</option><option>EUR €</option>
      </select>
    </div>
  </div>
</footer>

<script src="contact.js"></script>

<script src="finora-global.js" defer></script>
</body>
</html>