<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Wishlist Â· Finora</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,500;0,9..144,600;1,9..144,400&family=Inter:wght@300;400;500;600&family=JetBrains+Mono:wght@500;600&display=swap" rel="stylesheet">
<style>
/* ====== FINORA TOKENS ====== */
:root{
  --ink:#0E1B1A; --graphite:#2A3A38; --stone:#6B7775;
  --mist:#DDE3E0; --bone:#F5F1E8; --paper:#FFFFFF;
  --brand:#2F5D4F; --brand-soft:#6E9085; --gold:#C9A24B;

  --bg:var(--bone); --surface:var(--paper);
  --text:var(--ink); --muted:var(--stone); --border:var(--mist);
  --primary:var(--brand); --primary-ink:#fff;
  --secondary:var(--brand-soft); --accent:var(--gold);
  --chip:#E8EFE9;

  --font-display:"Fraunces",Georgia,serif;
  --font-body:"Inter",-apple-system,Segoe UI,sans-serif;
  --font-mono:"JetBrains Mono",ui-monospace,monospace;

  --r-md:14px; --r-lg:20px; --r-xl:28px; --r-pill:999px;
  --shadow-sm:0 1px 2px rgba(14,27,26,.06);
  --shadow-md:0 10px 28px -10px rgba(14,27,26,.18);
  --shadow-lg:0 30px 60px -20px rgba(14,27,26,.25);
  --ease:cubic-bezier(.2,.7,.2,1);
  --container:1280px;
}
body.finora--plants{
  --bg:#F2EEE2; --surface:#fff;
  --text:#1B3A2A; --muted:#5C6F5E; --border:#E2E5DA;
  --primary:#1B3A2A; --primary-ink:#F5F1E8;
  --secondary:#4A8B5C; --accent:#C97A4A;
  --chip:#D9E4D5;
}
body.finora--aqua{
  --bg:#EEF5F8; --surface:#fff;
  --text:#0A2540; --muted:#4D667A; --border:#D6E4EB;
  --primary:#0A2540; --primary-ink:#F2F8FA;
  --secondary:#3FAFC6; --accent:#FF7A59;
  --chip:#DCEEF2;
}

*{box-sizing:border-box}
html,body{margin:0;padding:0}
body{
  font-family:var(--font-body); color:var(--text); background:var(--bg);
  -webkit-font-smoothing:antialiased;
  transition:background .48s var(--ease), color .48s var(--ease);
}
a{color:inherit;text-decoration:none}
button{font:inherit;cursor:pointer}
.container{max-width:var(--container);margin:0 auto;padding:0 28px}
h1,h2,h3,h4{font-family:var(--font-display);font-weight:600;letter-spacing:-.02em;line-height:1.1;margin:0}
.eyebrow{font:600 .72rem/1 var(--font-body);letter-spacing:.2em;text-transform:uppercase;color:var(--muted)}

/* ====== NAV ====== */
.nav{position:sticky;top:0;z-index:50;background:color-mix(in srgb,var(--bg) 88%,transparent);backdrop-filter:blur(14px);transition:border-color .3s,box-shadow .3s,padding .3s;border-bottom:1px solid transparent;padding:18px 0}
.nav.scrolled{border-bottom-color:var(--border);box-shadow:0 1px 0 rgba(0,0,0,.02);padding:12px 0}
.nav__row{display:flex;align-items:center;justify-content:space-between;gap:24px}
.brand{display:flex;align-items:center;gap:10px;font-family:var(--font-display);font-weight:600;font-size:1.25rem;color:var(--text)}
.brand img{width:30px;height:30px;border-radius:50%;background:conic-gradient(from 200deg,var(--primary),var(--secondary),var(--accent),var(--primary));object-fit:cover}
.brand img:after{content:"Finora"}
.mode-toggle{display:inline-flex;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-pill);padding:4px;gap:2px;box-shadow:var(--shadow-sm)}
.mode-toggle button{border:0;background:transparent;padding:8px 18px;border-radius:var(--r-pill);font-size:.85rem;font-weight:500;color:var(--muted);transition:all .35s var(--ease)}
.mode-toggle button.is-active{background:var(--primary);color:var(--primary-ink)}
.nav__links{display:flex;align-items:center;gap:26px}
.nav__links a{font-size:.9rem;color:var(--muted);transition:color .2s}
.nav__links a:hover{color:var(--text)}
.nav__icons{display:flex;align-items:center;gap:8px}
.iconbtn{width:40px;height:40px;border-radius:50%;border:1px solid transparent;background:transparent;display:inline-flex;align-items:center;justify-content:center;color:var(--text);transition:all .25s var(--ease)}
.iconbtn:hover{background:var(--chip)}
.iconbtn.is-active{background:var(--primary);color:var(--primary-ink)}
.iconbtn svg{width:18px;height:18px;stroke-width:1.6}
@media(max-width:900px){.nav__links{display:none}.mode-toggle button{padding:6px 12px;font-size:.78rem}}

/* ====== HERO ====== */
.hero{padding:64px 0 28px}
.hero__inner{display:flex;align-items:flex-end;justify-content:space-between;gap:24px;flex-wrap:wrap}
.hero h1{font-size:clamp(2.4rem,5vw,4.2rem);display:flex;align-items:center;gap:18px;flex-wrap:wrap;margin-top:14px}
.hero h1 .count{font-family:var(--font-mono);font-size:.85rem;font-weight:500;color:var(--text);background:var(--chip);padding:7px 14px;border-radius:var(--r-pill);letter-spacing:.05em}
.hero p{color:var(--muted);max-width:54ch;margin:16px 0 0;font-size:1.02rem;line-height:1.55}

/* ====== TOOLBAR ====== */
.toolbar{display:flex;align-items:center;justify-content:space-between;gap:18px;flex-wrap:wrap;padding:24px 0 32px;border-bottom:1px solid var(--border);margin-bottom:36px}
.toolbar__left,.toolbar__right{display:flex;align-items:center;gap:14px;flex-wrap:wrap}
.sort{position:relative}
.sort select{appearance:none;-webkit-appearance:none;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-pill);padding:10px 38px 10px 16px;font:500 .85rem var(--font-body);color:var(--text);cursor:pointer}
.sort:after{content:"";position:absolute;right:16px;top:50%;width:8px;height:8px;border-right:1.5px solid var(--muted);border-bottom:1.5px solid var(--muted);transform:translateY(-70%) rotate(45deg);pointer-events:none}
.chips{display:inline-flex;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-pill);padding:4px}
.chips button{border:0;background:transparent;padding:7px 16px;border-radius:var(--r-pill);font-size:.82rem;color:var(--muted);transition:all .3s var(--ease)}
.chips button.is-active{background:var(--primary);color:var(--primary-ink)}
.linkbtn{background:none;border:0;color:var(--muted);font-size:.88rem;padding:8px 6px;border-bottom:1px solid transparent;transition:all .2s}
.linkbtn:hover{color:var(--accent);border-bottom-color:var(--accent)}
.btn{display:inline-flex;align-items:center;gap:8px;padding:12px 22px;border:1px solid transparent;border-radius:var(--r-pill);background:var(--primary);color:var(--primary-ink);font-weight:500;font-size:.9rem;transition:all .25s var(--ease)}
.btn:hover{transform:translateY(-2px);box-shadow:var(--shadow-md)}
.btn--accent{background:var(--accent);color:#fff}

/* ====== GRID ====== */
.grid{display:grid;grid-template-columns:repeat(4,1fr);gap:26px}
@media(max-width:1024px){.grid{grid-template-columns:repeat(3,1fr)}}
@media(max-width:720px){.grid{grid-template-columns:repeat(2,1fr);gap:16px}}

/* ====== CARD ====== */
.card{position:relative;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-xl);padding:14px;display:flex;flex-direction:column;gap:12px;transition:transform .35s var(--ease),box-shadow .35s var(--ease);opacity:0;transform:translateY(18px);animation:rise .55s var(--ease) forwards}
.card:hover{transform:translateY(-6px);box-shadow:var(--shadow-lg)}
@keyframes rise{to{opacity:1;transform:none}}
.card .media{position:relative;aspect-ratio:3/4;border-radius:20px;background:color-mix(in srgb,var(--bg) 70%,var(--surface));display:flex;flex-direction:column;align-items:center;justify-content:center;gap:10px;color:var(--muted);overflow:hidden;transition:transform .45s var(--ease)}
.card:hover .media{transform:scale(1.04)}
.media svg{width:38px;height:38px;opacity:.55}
.media span{font-size:.72rem;letter-spacing:.18em;text-transform:uppercase}
.mode-tag{position:absolute;left:12px;top:12px;background:var(--chip);color:var(--text);font-size:.65rem;letter-spacing:.14em;text-transform:uppercase;font-weight:600;padding:5px 10px;border-radius:var(--r-pill)}
.remove{position:absolute;right:12px;top:12px;width:32px;height:32px;border-radius:50%;border:0;background:var(--surface);color:var(--text);box-shadow:var(--shadow-md);display:inline-flex;align-items:center;justify-content:center;font-size:18px;opacity:0;transform:translateY(-4px);transition:all .3s var(--ease);z-index:2}
.card:hover .remove{opacity:1;transform:none}
.remove:hover{background:var(--accent);color:#fff}
.card h4{font-size:1.12rem;line-height:1.25;margin-top:4px}
.card .desc{color:var(--muted);font-weight:300;font-size:.85rem;margin:0;line-height:1.4;display:-webkit-box;-webkit-line-clamp:1;-webkit-box-orient:vertical;overflow:hidden}
.row{display:flex;align-items:center;justify-content:space-between;gap:10px}
.price{font-family:var(--font-mono);font-weight:600;color:var(--secondary);font-size:1rem}
.stars{display:inline-flex;align-items:center;gap:4px;color:var(--accent);font-size:.78rem}
.stars span{color:var(--muted);margin-left:4px}
.add{position:relative;overflow:hidden;width:100%;justify-content:center;margin-top:4px}
.add:before{content:"";position:absolute;inset:0;background:linear-gradient(110deg,transparent 30%,rgba(255,255,255,.35) 50%,transparent 70%);transform:translateX(-120%);transition:transform .9s var(--ease)}
.add:hover:before{transform:translateX(120%)}

/* ====== EMPTY STATE ====== */
.empty{display:none;flex-direction:column;align-items:center;text-align:center;padding:80px 20px;gap:18px}
.empty.is-on{display:flex}
.empty__art{width:200px;height:200px;border-radius:var(--r-xl);background:color-mix(in srgb,var(--bg) 60%,var(--surface));display:flex;align-items:center;justify-content:center;border:1px dashed var(--border)}
.empty__art img{width:60%;height:auto;display:none}
.empty__art .heart{width:64px;height:64px;color:var(--accent);animation:pulse 2.4s ease-in-out infinite}
@keyframes pulse{0%,100%{transform:scale(1);opacity:.85}50%{transform:scale(1.1);opacity:1}}
.empty h2{font-size:2rem}
.empty p{color:var(--muted);max-width:42ch;margin:0}
.empty__cta{display:flex;gap:12px;flex-wrap:wrap;justify-content:center;margin-top:6px}
.btn--plants{background:#1B3A2A;color:#F5F1E8}
.btn--aqua{background:#0A2540;color:#F2F8FA}

/* ====== SUGGESTIONS ====== */
.suggest{padding:90px 0 40px}
.suggest__head{margin-bottom:30px}
.suggest__head h2{font-size:clamp(1.8rem,2.8vw,2.4rem);margin-top:10px}
.scroller{display:flex;gap:20px;overflow-x:auto;scroll-snap-type:x mandatory;padding-bottom:14px;margin:0 -28px;padding-left:28px;padding-right:28px;scrollbar-width:thin}
.scroller::-webkit-scrollbar{height:6px}
.scroller::-webkit-scrollbar-thumb{background:var(--border);border-radius:6px}
.scroller .card{flex:0 0 240px;scroll-snap-align:start;animation:none;opacity:1;transform:none}
.scroller .card .media{aspect-ratio:3/4}
.heart-add{position:absolute;right:12px;top:12px;width:32px;height:32px;border-radius:50%;border:0;background:var(--surface);color:var(--accent);box-shadow:var(--shadow-md);display:inline-flex;align-items:center;justify-content:center;opacity:0;transform:translateY(-4px);transition:all .3s var(--ease)}
.scroller .card:hover .heart-add{opacity:1;transform:none}
.heart-add:hover{background:var(--accent);color:#fff}
.heart-add svg{width:16px;height:16px}

/* ====== FOOTER ====== */
.foot{background:var(--ink);color:color-mix(in srgb,#F5F1E8 70%,transparent);margin-top:80px;padding:70px 0 28px}
.foot__grid{display:grid;grid-template-columns:1.3fr 1fr 1fr 1fr;gap:48px;padding-bottom:48px;border-bottom:1px solid rgba(245,241,232,.12)}
@media(max-width:900px){.foot__grid{grid-template-columns:1fr 1fr;gap:32px}}
@media(max-width:520px){.foot__grid{grid-template-columns:1fr}}
.foot .brand{color:#F5F1E8}
.foot .brand img{box-shadow:inset 0 0 0 3px var(--ink)}
.foot__tag{margin:14px 0 22px;font-size:.92rem;color:rgba(245,241,232,.6);max-width:30ch}
.socials{display:flex;gap:10px}
.socials a{width:36px;height:36px;border-radius:50%;border:1.5px solid rgba(245,241,232,.4);display:inline-flex;align-items:center;justify-content:center;color:#F5F1E8;transition:all .25s var(--ease)}
.socials a:hover{border-color:#F5F1E8;background:rgba(245,241,232,.08)}
.socials svg{width:15px;height:15px;stroke-width:1.5}
.foot h5{font-family:var(--font-display);font-size:1rem;color:#F5F1E8;margin:0 0 16px}
.foot a.flink{display:block;color:#6B7775;font-size:.88rem;padding:5px 0;transition:color .2s}
.foot a.flink:hover{color:#F5F1E8}
.foot__base{display:flex;justify-content:space-between;flex-wrap:wrap;gap:12px;padding-top:24px;color:rgba(245,241,232,.5);font-size:.8rem}
.foot__base nav{display:flex;gap:18px}
.foot__base a{color:inherit}
.foot__base a:hover{color:#F5F1E8}

/* card stagger */
.card:nth-child(1){animation-delay:.00s}
.card:nth-child(2){animation-delay:.06s}
.card:nth-child(3){animation-delay:.12s}
.card:nth-child(4){animation-delay:.18s}
.card:nth-child(5){animation-delay:.24s}
.card:nth-child(6){animation-delay:.30s}
.card:nth-child(7){animation-delay:.36s}
.card:nth-child(8){animation-delay:.42s}
.card:nth-child(9){animation-delay:.48s}
.card:nth-child(10){animation-delay:.54s}
.card:nth-child(11){animation-delay:.60s}
.card:nth-child(12){animation-delay:.66s}

/* fade-out on remove */
.card.removing{opacity:0;transform:scale(.94);transition:opacity .3s var(--ease),transform .3s var(--ease)}
</style>
</head>
<body class="finora--plants">

<!-- ============ NAV ============ -->
<header class="nav" id="nav">
  <div class="container nav__row">
    <a href="index.jsp" class="brand" aria-label="Finora home">
      <img src="" alt="Finora" onerror="this.replaceWith(Object.assign(document.createElement('span'),{textContent:'',style:'width:30px;height:30px;border-radius:50%;background:conic-gradient(from 200deg,var(--primary),var(--secondary),var(--accent),var(--primary))'}))" />
      <span>Finora</span>
    </a>

    <div class="mode-toggle" role="tablist" aria-label="Mode">
      <button type="button" data-mode="plants" class="is-active">Plants</button>
      <button type="button" data-mode="aqua">Aquarium</button>
    </div>

    <nav class="nav__links">
      <a href="shop.jsp">Shop</a>
      <a href="about.jsp">About Us</a>
      <a href="contact.jsp">Contact Us</a>
    </nav>

    <div class="nav__icons">
      <button class="iconbtn" aria-label="Search"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg></button>
      <button class="iconbtn is-active" aria-label="Wishlist" aria-current="page"><svg viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 21s-7-4.35-9.5-9A5.5 5.5 0 0 1 12 6a5.5 5.5 0 0 1 9.5 6c-2.5 4.65-9.5 9-9.5 9z"/></svg></button>
      <button class="iconbtn" aria-label="Profile"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg></button>
    </div>
  </div>
</header>

<!-- ============ HERO ============ -->
<section class="hero">
  <div class="container hero__inner">
    <div>
      <span class="eyebrow">Your Collection</span>
      <h1>Wishlist <span class="count" id="count">12 items</span></h1>
      <p>Items you've saved for later. Move them to cart whenever you're ready.</p>
    </div>
  </div>
</section>

<!-- ============ TOOLBAR ============ -->
<section class="container">
  <div class="toolbar">
    <div class="toolbar__left">
      <div class="sort">
        <select aria-label="Sort">
          <option>Sort by: Date Added</option>
          <option>Price: Lowâ€“High</option>
          <option>Price: Highâ€“Low</option>
          <option>Name Aâ€“Z</option>
        </select>
      </div>
      <div class="chips" role="tablist">
        <button class="is-active">All</button>
        <button>Plants</button>
        <button>Aquarium</button>
      </div>
    </div>
    <div class="toolbar__right">
      <button class="linkbtn" id="clearAll">Clear All</button>
      <button class="btn btn--accent">Move All to Cart</button>
    </div>
  </div>
</section>

<!-- ============ GRID ============ -->
<main class="container">
  <div class="grid" id="grid">
    <%
      String[][] items = {
        {"Monstera Deliciosa","Split-leaf tropical","$48.00","Plant","4.8","124"},
        {"Snake Plant","Low-light, easy care","$32.00","Plant","4.9","210"},
        {"Fiddle Leaf Fig","Statement indoor tree","$78.00","Plant","4.6","88"},
        {"Neon Tetra (10)","Schooling freshwater fish","$24.00","Aquarium","4.7","312"},
        {"Anubias Nana","Hardy aquatic plant","$14.00","Aquarium","4.8","152"},
        {"Pothos Golden","Trailing vine","$22.00","Plant","4.9","402"},
        {"Betta Halfmoon","Solo centerpiece fish","$28.00","Aquarium","4.6","178"},
        {"Calathea Orbifolia","Striped statement leaves","$54.00","Plant","4.5","61"},
        {"Cherry Shrimp (5)","Algae-eating cleanup crew","$18.00","Aquarium","4.8","244"},
        {"ZZ Plant","Almost indestructible","$36.00","Plant","4.9","320"},
        {"Java Fern","Beginner aquatic plant","$12.00","Aquarium","4.7","198"},
        {"Bird of Paradise","Tropical floor plant","$96.00","Plant","4.7","54"}
      };
      for (int i=0;i<items.length;i++){
        String[] it = items[i];
    %>
    <article class="card" data-mode="<%= it[3].toLowerCase() %>">
      <button class="remove" aria-label="Remove">Ã—</button>
      <div class="media">
        <span class="mode-tag"><%= it[3] %></span>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="11" r="2"/><path d="m21 17-5-5-9 9"/></svg>
        <span>Product Image</span>
      </div>
      <div class="row" style="margin-top:4px">
        <div>
          <h4><%= it[0] %></h4>
          <p class="desc"><%= it[1] %></p>
        </div>
      </div>
      <div class="row">
        <span class="price"><%= it[2] %></span>
        <span class="stars">â˜…â˜…â˜…â˜…â˜… <span>(<%= it[5] %>)</span></span>
      </div>
      <button class="btn add">Add to Cart</button>
    </article>
    <% } %>
  </div>

  <!-- ============ EMPTY ============ -->
  <div class="empty" id="empty">
    <div class="empty__art">
      <img src="" alt="Finora" />
      <svg class="heart" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M12 21s-7-4.35-9.5-9A5.5 5.5 0 0 1 12 6a5.5 5.5 0 0 1 9.5 6c-2.5 4.65-9.5 9-9.5 9z"/></svg>
    </div>
    <h2>Your wishlist is empty</h2>
    <p>Browse our collections and save the things you love.</p>
    <div class="empty__cta">
      <a class="btn btn--plants" href="shop.jsp?mode=plants">Explore Plants</a>
      <a class="btn btn--aqua" href="shop.jsp?mode=aqua">Explore Aquarium</a>
    </div>
  </div>
</main>

<!-- ============ SUGGESTIONS ============ -->
<section class="suggest">
  <div class="container suggest__head">
    <span class="eyebrow">Because You Saved</span>
    <h2>You Might Also Like</h2>
  </div>
  <div class="container">
    <div class="scroller">
      <%
        String[][] sugg = {
          {"Philodendron Pink","Rare collector plant","$120.00","Plant","4.9","42"},
          {"Guppy Trio","Colorful community fish","$16.00","Aquarium","4.6","210"},
          {"Peace Lily","Air-purifying classic","$28.00","Plant","4.8","182"},
          {"Amazon Sword","Background aquatic plant","$15.00","Aquarium","4.7","98"},
          {"String of Pearls","Trailing succulent","$24.00","Plant","4.5","134"},
          {"Mystery Snail","Tank cleaner","$8.00","Aquarium","4.8","221"}
        };
        for (String[] it : sugg){
      %>
      <article class="card" data-mode="<%= it[3].toLowerCase() %>">
        <button class="heart-add" aria-label="Save to wishlist"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 21s-7-4.35-9.5-9A5.5 5.5 0 0 1 12 6a5.5 5.5 0 0 1 9.5 6c-2.5 4.65-9.5 9-9.5 9z"/></svg></button>
        <div class="media">
          <span class="mode-tag"><%= it[3] %></span>
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="11" r="2"/><path d="m21 17-5-5-9 9"/></svg>
          <span>Product Image</span>
        </div>
        <h4><%= it[0] %></h4>
        <p class="desc"><%= it[1] %></p>
        <div class="row">
          <span class="price"><%= it[2] %></span>
          <span class="stars">â˜…â˜…â˜…â˜…â˜… <span>(<%= it[5] %>)</span></span>
        </div>
        <button class="btn add">Add to Cart</button>
      </article>
      <% } %>
    </div>
  </div>
</section>

<!-- ============ FOOTER ============ -->
<footer class="foot">
  <div class="container">
    <div class="foot__grid">
      <div>
        <a class="brand" href="index.jsp">
          <img src="" alt="Finora" />
          <span>Finora</span>
        </a>
        <p class="foot__tag">Living things, beautifully kept.</p>
        <div class="socials">
          <a href="#" aria-label="Instagram"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor"/></svg></a>
          <a href="#" aria-label="Pinterest"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="9"/><path d="M10 21l2-8M8 10a4 4 0 1 1 7.5 2c-1 2.5-4 2-4 .5"/></svg></a>
          <a href="#" aria-label="Facebook"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M14 9h3V5h-3a4 4 0 0 0-4 4v2H7v4h3v6h4v-6h3l1-4h-4V9z"/></svg></a>
          <a href="#" aria-label="X"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M4 4l16 16M20 4 4 20"/></svg></a>
          <a href="#" aria-label="YouTube"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><rect x="3" y="6" width="18" height="12" rx="3"/><path d="m11 9 4 3-4 3z" fill="currentColor"/></svg></a>
        </div>
      </div>
      <div>
        <h5>Shop</h5>
        <a class="flink" href="#">Indoor Plants</a>
        <a class="flink" href="#">Outdoor Plants</a>
        <a class="flink" href="#">Succulents</a>
        <a class="flink" href="#">Aquarium Fish</a>
        <a class="flink" href="#">Tanks &amp; Equipment</a>
        <a class="flink" href="#">Aquatic Plants</a>
      </div>
      <div>
        <h5>Care Guides</h5>
        <a class="flink" href="#">Plant Care 101</a>
        <a class="flink" href="#">Water &amp; Light Guide</a>
        <a class="flink" href="#">Aquarium Setup</a>
        <a class="flink" href="#">Fish Compatibility</a>
        <a class="flink" href="#">Seasonal Tips</a>
        <a class="flink" href="#">AI Diagnostics</a>
      </div>
      <div>
        <h5>Company</h5>
        <a class="flink" href="#">About Finora</a>
        <a class="flink" href="#">Sustainability</a>
        <a class="flink" href="#">Careers</a>
        <a class="flink" href="#">Contact Us</a>
      </div>
    </div>
    <div class="foot__base">
      <span>Â© <%= java.time.Year.now() %> Finora. All rights reserved.</span>
      <nav>
        <a href="#">Privacy Policy</a>
        <a href="#">Terms of Service</a>
        <a href="#">Cookie Policy</a>
      </nav>
    </div>
  </div>
</footer>

<script>
(function(){
  // Nav scroll elevation
  var nav = document.getElementById('nav');
  window.addEventListener('scroll', function(){
    nav.classList.toggle('scrolled', window.scrollY > 8);
  });

  // Mode toggle
  var body = document.body;
  document.querySelectorAll('.mode-toggle button').forEach(function(b){
    b.addEventListener('click', function(){
      document.querySelectorAll('.mode-toggle button').forEach(function(x){x.classList.remove('is-active')});
      b.classList.add('is-active');
      body.classList.remove('finora--plants','finora--aqua');
      body.classList.add(b.dataset.mode === 'aqua' ? 'finora--aqua' : 'finora--plants');
    });
  });

  // Filter chips
  document.querySelectorAll('.chips button').forEach(function(b){
    b.addEventListener('click', function(){
      b.parentElement.querySelectorAll('button').forEach(function(x){x.classList.remove('is-active')});
      b.classList.add('is-active');
      var f = b.textContent.trim().toLowerCase();
      document.querySelectorAll('#grid .card').forEach(function(c){
        c.style.display = (f === 'all' || c.dataset.mode === f) ? '' : 'none';
      });
    });
  });

  // Remove item with confirm
  function refreshCount(){
    var n = document.querySelectorAll('#grid .card:not(.removing)').length;
    document.getElementById('count').textContent = n + ' item' + (n===1?'':'s');
    document.getElementById('empty').classList.toggle('is-on', n === 0);
    document.getElementById('grid').style.display = n === 0 ? 'none' : '';
  }
  document.querySelectorAll('#grid .remove').forEach(function(btn){
    btn.addEventListener('click', function(){
      if(!confirm('Remove this item from your wishlist?')) return;
      var card = btn.closest('.card');
      card.classList.add('removing');
      setTimeout(function(){ card.remove(); refreshCount(); }, 320);
    });
  });
  document.getElementById('clearAll').addEventListener('click', function(){
    if(!confirm('Clear all items from your wishlist?')) return;
    document.querySelectorAll('#grid .card').forEach(function(c){c.classList.add('removing')});
    setTimeout(function(){
      document.querySelectorAll('#grid .card').forEach(function(c){c.remove()});
      refreshCount();
    }, 320);
  });
})();
</script>
</body>
</html>