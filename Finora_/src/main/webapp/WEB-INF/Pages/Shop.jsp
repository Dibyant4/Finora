<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Shop — Finora</title>
  <meta name="description" content="Explore Finora's living collection of plants and aquariums — curated with care." />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${ctx}/css/shop.css" />
</head>
<body class="mode-plants">

  <!-- ===================== NAVBAR ===================== -->
  <header class="nav" id="nav">
    <div class="container nav__inner">
      <a href="${ctx}/home" class="nav__logo">
        <!-- INSERT LOGO -->
        <img src="" alt="Finora" />
        <span class="fr">Finora</span>
      </a>

      <div class="nav__toggle" role="tablist" aria-label="Mode">
        <button id="modePlants" class="is-active" type="button">Plants</button>
        <button id="modeAqua" type="button">Aquarium</button>
      </div>

      <div class="nav__right">
        <a class="nav__link is-active" href="${ctx}/shop">Shop</a>
        <a class="nav__link" href="${ctx}/about">About Us</a>
        <a class="nav__link" href="${ctx}/contact">Contact Us</a>
        <div class="nav__icons">
          <button aria-label="Search"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg></button>
          <button aria-label="Wishlist"><svg viewBox="0 0 24 24"><path d="M12 20s-7-4.5-9.3-9.1C1.2 7.7 3.6 4 7 4c2 0 3.4 1.1 5 3 1.6-1.9 3-3 5-3 3.4 0 5.8 3.7 4.3 6.9C19 15.5 12 20 12 20Z"/></svg></button>
          <button aria-label="Profile"><svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c1.5-4 4.5-6 8-6s6.5 2 8 6"/></svg></button>
        </div>
      </div>
    </div>
  </header>

  <!-- ===================== HERO ===================== -->
  <section class="hero">
    <div class="container hero__inner">
      <div>
        <span class="eyebrow">EXPLORE THE COLLECTION</span>
        <h1 class="fr hero__title" id="heroTitle">The Living Shop</h1>
        <p class="hero__sub">Everything your collection needs, curated with care.</p>
      </div>
      <div class="hero__art" aria-hidden="true">
        <!-- INSERT HERO BANNER IMAGE -->
        Hero Banner Image
      </div>
    </div>
  </section>

  <!-- ===================== CATEGORY STRIP ===================== -->
  <div class="cats-wrap">
    <div class="container">
      <div class="cats" id="catStrip">
        <!-- categories injected via JS based on mode -->
      </div>
    </div>
  </div>

  <!-- ===================== MAIN ===================== -->
  <main class="main">
    <div class="container layout">

      <!-- SIDEBAR -->
      <aside class="sidebar">
        <div class="sidebar__head">
          <h3>Filters</h3>
          <a href="#" id="resetAll">Reset All</a>
        </div>

        <!-- Price -->
        <div class="fsec">
          <input type="checkbox" id="f1" class="fsec__toggle" checked />
          <label class="fsec__label" for="f1">Price Range</label>
          <div class="fsec__body">
            <div class="price-row">
              <div class="ip"><span>Rs.</span><input type="number" placeholder="Min" /></div>
              <div class="ip"><span>Rs.</span><input type="number" placeholder="Max" /></div>
            </div>
            <input type="range" class="range" min="0" max="20000" value="8000" />
          </div>
        </div>

        <!-- Mode (master view) -->
        <div class="fsec">
          <input type="checkbox" id="f2" class="fsec__toggle" />
          <label class="fsec__label" for="f2">Mode</label>
          <div class="fsec__body">
            <div class="radio-list">
              <label><input type="radio" name="mode" checked /><span class="dot"></span>Plants</label>
              <label><input type="radio" name="mode" /><span class="dot"></span>Aquarium</label>
            </div>
          </div>
        </div>

        <!-- Category -->
        <div class="fsec">
          <input type="checkbox" id="f3" class="fsec__toggle" checked />
          <label class="fsec__label" for="f3">Category</label>
          <div class="fsec__body">
            <div class="check-list" id="catChecks"></div>
          </div>
        </div>

        <!-- Availability -->
        <div class="fsec">
          <input type="checkbox" id="f4" class="fsec__toggle" />
          <label class="fsec__label" for="f4">Availability</label>
          <div class="fsec__body">
            <div class="radio-list">
              <label><input type="radio" name="avail" /><span class="dot"></span>In Stock Only</label>
              <label><input type="radio" name="avail" checked /><span class="dot"></span>All Products</label>
            </div>
          </div>
        </div>

        <!-- Rating -->
        <div class="fsec">
          <input type="checkbox" id="f5" class="fsec__toggle" />
          <label class="fsec__label" for="f5">Rating</label>
          <div class="fsec__body">
            <div class="radio-list">
              <label><input type="radio" name="rate" /><span class="dot"></span><span class="stars"><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg></span>&nbsp;&amp; above</label>
              <label><input type="radio" name="rate" /><span class="dot"></span><span class="stars"><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg></span>&nbsp;&amp; above</label>
              <label><input type="radio" name="rate" /><span class="dot"></span><span class="stars"><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg><svg viewBox="0 0 24 24"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg></span>&nbsp;&amp; above</label>
              <label><input type="radio" name="rate" checked /><span class="dot"></span>Any rating</label>
            </div>
          </div>
        </div>

        <button class="btn-apply">Apply Filters</button>
      </aside>

      <!-- GRID AREA -->
      <section>
        <div class="toolbar">
          <div class="toolbar__count">Showing <b>24</b> of <b>86</b> products</div>
          <div class="toolbar__right">
            <div class="sortbox">
              <span>Sort:</span>
              <select>
                <option>Newest</option>
                <option>Price ↑</option>
                <option>Price ↓</option>
                <option>Best Rated</option>
              </select>
            </div>
            <div class="viewtoggle" role="tablist">
              <button id="viewGrid" class="is-active" aria-label="Grid view">
                <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="3" width="7" height="7" rx="1.5"/><rect x="3" y="14" width="7" height="7" rx="1.5"/><rect x="14" y="14" width="7" height="7" rx="1.5"/></svg>
              </button>
              <button id="viewList" aria-label="List view">
                <svg viewBox="0 0 24 24"><line x1="4" y1="6" x2="20" y2="6"/><line x1="4" y1="12" x2="20" y2="12"/><line x1="4" y1="18" x2="20" y2="18"/></svg>
              </button>
            </div>
          </div>
        </div>

        <div class="grid" id="productGrid">
          <!-- Product cards (8 demo cards) -->
        </div>

        <!-- Pagination -->
        <nav class="pager" aria-label="Pagination">
          <button class="arrow" aria-label="Previous"><svg viewBox="0 0 24 24"><polyline points="15,6 9,12 15,18"/></svg></button>
          <button class="is-active">1</button>
          <button>2</button>
          <button>3</button>
          <span class="gap">…</span>
          <button>9</button>
          <button class="arrow" aria-label="Next"><svg viewBox="0 0 24 24"><polyline points="9,6 15,12 9,18"/></svg></button>
        </nav>
      </section>
    </div>

    <!-- HELP BANNER -->
    <div class="container">
      <section class="help-banner" id="helpBanner">
        <span class="eyebrow">NEED HELP</span>
        <h3 class="fr">Not sure what to pick?</h3>
        <p>Our care guides and compatibility tools help you choose the right plant or fish for your space.</p>
        <div class="row">
          <a class="btn" href="#">Browse Care Guides</a>
          <a class="btn btn--filled" href="${ctx}/contact">Contact Us</a>
        </div>
      </section>
    </div>
  </main>

  <!-- ===================== FOOTER ===================== -->
  <footer class="footer">
    <div class="container footer__inner">
      <div class="footer__brand">
        <!-- INSERT LOGO -->
        <img src="" alt="Finora" />
        <div class="fr">Finora</div>
        <p class="footer__tag">Living things, beautifully kept.</p>
        <div class="socials">
          <a href="#" aria-label="Instagram"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r=".8" fill="currentColor"/></svg></a>
          <a href="#" aria-label="Pinterest"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M11 7c2.5 0 4 1.7 4 4 0 2.5-1.5 4-3.5 4-.7 0-1.5-.4-1.7-.9l-.6 2.4c-.2.9-.9 2-1.4 2.7"/><path d="M10 11c0-1.5 1-2 2-2"/></svg></a>
          <a href="#" aria-label="Facebook"><svg viewBox="0 0 24 24"><path d="M15 8h-2a1 1 0 0 0-1 1v3H9v3h3v6h3v-6h2.5l.5-3H15V9.5c0-.3.2-.5.5-.5H18V6h-2a3 3 0 0 0-3 3"/></svg></a>
          <a href="#" aria-label="Twitter"><svg viewBox="0 0 24 24"><path d="M4 4l7.5 10L4.5 20H7l5.5-5 4 5H21l-7.8-10.4L20.5 4H18l-4.5 4.5L9.5 4z"/></svg></a>
          <a href="#" aria-label="YouTube"><svg viewBox="0 0 24 24"><rect x="2.5" y="6" width="19" height="12" rx="3"/><polygon points="10,9.5 15,12 10,14.5" fill="currentColor"/></svg></a>
        </div>
      </div>
      <div>
        <h5>Shop</h5>
        <ul>
          <li><a href="#">Indoor Plants</a></li>
          <li><a href="#">Outdoor Plants</a></li>
          <li><a href="#">Succulents</a></li>
          <li><a href="#">Aquarium Fish</a></li>
          <li><a href="#">Tanks & Equipment</a></li>
          <li><a href="#">Aquatic Plants</a></li>
        </ul>
      </div>
      <div>
        <h5>Care Guides</h5>
        <ul>
          <li><a href="#">Plant Care 101</a></li>
          <li><a href="#">Water & Light Guide</a></li>
          <li><a href="#">Aquarium Setup</a></li>
          <li><a href="#">Fish Compatibility</a></li>
          <li><a href="#">Seasonal Tips</a></li>
          <li><a href="#">AI Diagnostics</a></li>
        </ul>
      </div>
      <div>
        <h5>Company</h5>
        <ul>
          <li><a href="#">About Finora</a></li>
          <li><a href="#">Sustainability</a></li>
          <li><a href="#">Careers</a></li>
          <li><a href="${ctx}/contact">Contact Us</a></li>
          <li><a href="#">Privacy Policy</a></li>
        </ul>
      </div>
    </div>
    <div class="container footer__base">
      <span>© 2024 Finora Biological Design. All rights reserved.</span>
      <span class="right">
        <a href="#">Privacy Policy</a>
        <a href="#">Terms of Service</a>
        <a href="#">Cookie Policy</a>
      </span>
    </div>
  </footer>

  <!-- ===================== SCRIPTS ===================== -->
  <script>
    // ---------- DATA ----------
    const CATEGORIES = {
      plants: [
        ['All','grid'], ['Indoor Plants','leaf'], ['Outdoor Plants','tree'],
        ['Succulents & Cacti','cactus'], ['Pots & Planters','pot'],
        ['Soil & Fertilizers','soil'], ['Grooming Tools','scissors'],
        ['Watering & Care','drop']
      ],
      aquarium: [
        ['All','grid'], ['Freshwater Fish','fish'], ['Saltwater Fish','wave'],
        ['Aquarium Tanks','tank'], ['Filters & Pumps','filter'],
        ['Lighting','bulb'], ['Aquatic Plants','plant'],
        ['Fish Food & Supplements','food'], ['Decorations & Gravel','rock'],
        ['Water Conditioners','drop']
      ]
    };
    const ICON = '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="6"/></svg>';

    const PRODUCTS = {
      plants: [
        { name:'Monstera Deliciosa', cat:'Indoor Plants', price:'Rs. 2,450', rating:4.8, count:124, desc:'Lush split-leaf statement plant for bright corners.', badge:'new' },
        { name:'Snake Plant Laurentii', cat:'Indoor Plants', price:'Rs. 1,200', rating:4.9, count:312, desc:'Low-maintenance air purifier, perfect for beginners.', badge:'best' },
        { name:'Fiddle Leaf Fig', cat:'Indoor Plants', price:'Rs. 3,850', rating:4.6, count:89, desc:'Architectural large-leaf tree for sunny rooms.', badge:null },
        { name:'Echeveria Cluster', cat:'Succulents', price:'Rs. 650', rating:4.7, count:201, desc:'Rosette succulents in terracotta planter.', badge:'low' },
        { name:'Bonsai Ficus', cat:'Indoor Plants', price:'Rs. 4,200', rating:4.5, count:67, desc:'Hand-pruned miniature tree with ceramic tray.', badge:'new' },
        { name:'Pothos Golden', cat:'Indoor Plants', price:'Rs. 850', rating:4.8, count:432, desc:'Trailing vine with heart-shaped variegated leaves.', badge:'best' },
        { name:'Terracotta Pot Set', cat:'Pots & Planters', price:'Rs. 1,450', rating:4.7, count:158, desc:'Hand-thrown clay pots in three graduated sizes.', badge:null },
        { name:'Organic Plant Soil 5kg', cat:'Soil & Fertilizers', price:'Rs. 540', rating:4.6, count:276, desc:'Nutrient-rich blend with coco peat and worm castings.', badge:null },
      ],
      aquarium: [
        { name:'Neon Tetra (Pack of 10)', cat:'Freshwater Fish', price:'Rs. 1,200', rating:4.9, count:189, desc:'Schooling fish with vivid blue and red stripe.', badge:'best' },
        { name:'Curved Glass Tank 60L', cat:'Aquarium Tanks', price:'Rs. 8,500', rating:4.7, count:54, desc:'Low-iron crystal-clear front panel, sleek silhouette.', badge:'new' },
        { name:'Silent Canister Filter', cat:'Filters & Pumps', price:'Rs. 5,200', rating:4.8, count:142, desc:'Three-stage filtration for tanks up to 200L.', badge:null },
        { name:'LED Reef Light', cat:'Lighting', price:'Rs. 3,400', rating:4.6, count:97, desc:'Full spectrum with sunrise and sunset modes.', badge:'low' },
        { name:'Anubias Aquatic Plant', cat:'Aquatic Plants', price:'Rs. 480', rating:4.7, count:223, desc:'Hardy live plant for foreground and rocks.', badge:null },
        { name:'Premium Flake Food 250g', cat:'Fish Food', price:'Rs. 720', rating:4.8, count:341, desc:'Color-enhancing daily diet for tropical species.', badge:'best' },
        { name:'Black Lava Rock Set', cat:'Decorations', price:'Rs. 1,150', rating:4.5, count:78, desc:'Hand-selected porous stones for aquascaping.', badge:null },
        { name:'Water Conditioner 500ml', cat:'Conditioners', price:'Rs. 640', rating:4.9, count:412, desc:'Neutralises chlorine instantly, safe for all life.', badge:null },
      ]
    };

    const PLACEHOLDER_SVG = `
      <div class="ph">
        <svg viewBox="0 0 24 24"><path d="M3 5h18v14H3z"/><circle cx="9" cy="11" r="2"/><path d="m3 17 5-4 5 4 3-2 5 4"/></svg>
        <span>INSERT IMAGE</span>
      </div>`;

    // ---------- DOM ----------
    const body = document.body;
    const heroTitle = document.getElementById('heroTitle');
    const catStrip = document.getElementById('catStrip');
    const catChecks = document.getElementById('catChecks');
    const grid = document.getElementById('productGrid');

    function setMode(m) {
      body.classList.remove('mode-plants','mode-aquarium');
      body.classList.add('mode-' + m);
      document.getElementById('modePlants').classList.toggle('is-active', m==='plants');
      document.getElementById('modeAqua').classList.toggle('is-active', m==='aquarium');
      heroTitle.textContent = m === 'plants' ? 'The Living Shop' : 'The Aquatic Shop';
      renderCats(m);
      renderProducts(m);
    }

    function renderCats(mode) {
      catStrip.innerHTML = '';
      catChecks.innerHTML = '';
      CATEGORIES[mode].forEach((c, i) => {
        const [name] = c;
        const b = document.createElement('button');
        b.className = 'chip-cat' + (i===0 ? ' is-active' : '');
        b.innerHTML = `<span class="icon">${ICON}</span><span>${name}</span>`;
        b.addEventListener('click', () => {
          document.querySelectorAll('.chip-cat').forEach(x => x.classList.remove('is-active'));
          b.classList.add('is-active');
          grid.style.opacity = '0';
          setTimeout(() => { grid.style.opacity = '1'; }, 220);
        });
        catStrip.appendChild(b);

        if (i > 0) {
          const l = document.createElement('label');
          l.innerHTML = `<input type="checkbox" /><span class="box"></span>${name}`;
          catChecks.appendChild(l);
        }
      });
    }

    function starRow(rating, count) {
      let full = Math.floor(rating);
      let html = '<span class="stars">';
      for (let i = 0; i < 5; i++) {
        html += `<svg viewBox="0 0 24 24" style="fill:${i<full ? 'var(--gold)' : 'var(--mist)'}"><polygon points="12,2 15,9 22,9 17,14 19,21 12,17 5,21 7,14 2,9 9,9"/></svg>`;
      }
      html += `</span><span class="num">${rating} (${count})</span>`;
      return html;
    }

    function badgeFor(b, mode) {
      const modeLbl = mode === 'plants' ? 'Plant' : 'Aquarium';
      let html = `<span class="bd bd--mode">${modeLbl}</span>`;
      if (b === 'new')  html += `<span class="bd bd--new">New Arrival</span>`;
      if (b === 'best') html += `<span class="bd bd--best">Best Seller</span>`;
      if (b === 'low')  html += `<span class="bd bd--low">Low Stock</span>`;
      return html;
    }

    function renderProducts(mode) {
      grid.innerHTML = '';
      const items = PRODUCTS[mode];
      items.forEach(p => {
        const el = document.createElement('article');
        el.className = 'product';
        el.innerHTML = `
          <div class="product__media">
            <!-- INSERT PRODUCT IMAGE -->
            ${PLACEHOLDER_SVG}
            <div class="product__badges">${badgeFor(p.badge, mode)}</div>
            <button class="wish" aria-label="Add to wishlist">
              <svg viewBox="0 0 24 24"><path d="M12 20s-7-4.5-9.3-9.1C1.2 7.7 3.6 4 7 4c2 0 3.4 1.1 5 3 1.6-1.9 3-3 5-3 3.4 0 5.8 3.7 4.3 6.9C19 15.5 12 20 12 20Z"/></svg>
            </button>
          </div>
          <div class="product__body">
            <div class="left">
              <span class="eyebrow product__cat">${p.cat}</span>
              <h4 class="fr product__name">${p.name}</h4>
              <div class="product__rating">${starRow(p.rating, p.count)}</div>
              <p class="product__desc">${p.desc}</p>
              <div class="mono product__price">${p.price}</div>
            </div>
            <div class="right">
              <button class="product__cta">Add to Cart</button>
            </div>
          </div>
        `;
        // Wishlist toggle
        el.querySelector('.wish').addEventListener('click', e => {
          e.stopPropagation();
          e.currentTarget.classList.toggle('is-active');
        });
        grid.appendChild(el);
      });
      // restart stagger
      grid.querySelectorAll('.product').forEach(c => { c.style.animation = 'none'; c.offsetHeight; c.style.animation = ''; });
    }

    // ---------- View toggle ----------
    document.getElementById('viewGrid').addEventListener('click', () => {
      body.classList.remove('view-list');
      document.getElementById('viewGrid').classList.add('is-active');
      document.getElementById('viewList').classList.remove('is-active');
    });
    document.getElementById('viewList').addEventListener('click', () => {
      body.classList.add('view-list');
      document.getElementById('viewList').classList.add('is-active');
      document.getElementById('viewGrid').classList.remove('is-active');
    });

    // ---------- Mode toggle ----------
    document.getElementById('modePlants').addEventListener('click', () => setMode('plants'));
    document.getElementById('modeAqua').addEventListener('click', () => setMode('aquarium'));

    // ---------- Navbar scroll ----------
    const nav = document.getElementById('nav');
    window.addEventListener('scroll', () => {
      nav.classList.toggle('scrolled', window.scrollY > 20);
    });

    // ---------- IntersectionObserver for help banner ----------
    const io = new IntersectionObserver((entries) => {
      entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('in'); });
    }, { threshold: 0.2 });
    io.observe(document.getElementById('helpBanner'));

    // ---------- Init ----------
    setMode('plants');
  </script>

<script src="${ctx}/js/finora-global.js" defer></script>
<script src="${ctx}/js/shop-modal.js" defer></script>
</body>
</html>
