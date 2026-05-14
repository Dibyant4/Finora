<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Admin-only access guard
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("ADMIN")) {
        response.sendRedirect("Login.jsp?error=unauthorized");
        return;
    }
    String adminName = (String) session.getAttribute("firstName");
    if (adminName == null) adminName = "Admin";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finora — Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Admin_Dashboard.css">
</head>
<body>

<!-- ===== SIDEBAR ===== -->
<aside class="admin-sidebar" id="adminSidebar">
    <div class="sidebar-brand">
        <span class="brand-logo">Finora</span>
        <span class="brand-sub">Admin Portal</span>
    </div>

    <nav class="admin-nav">
        <a href="#dashboard"  class="admin-nav-link active" data-section="dashboard">
            <span class="nav-icon">⊞</span> Dashboard
        </a>
        <a href="#products"   class="admin-nav-link" data-section="products">
            <span class="nav-icon">🌿</span> Products
        </a>
        <a href="#orders"     class="admin-nav-link" data-section="orders">
            <span class="nav-icon">🛒</span> Orders
        </a>
        <a href="#customers"  class="admin-nav-link" data-section="customers">
            <span class="nav-icon">👥</span> Customers
        </a>
        <a href="#reviews"    class="admin-nav-link" data-section="reviews">
            <span class="nav-icon">★</span> Reviews
        </a>
        <a href="#add-product" class="admin-nav-link" data-section="add-product">
            <span class="nav-icon">＋</span> Add Product
        </a>
    </nav>

    <div class="sidebar-footer">
        <a href="home.jsp" class="sidebar-footer-link">🌐 View Storefront</a>
        <a href="LogoutServlet" class="sidebar-footer-link logout-link" onclick="return confirm('Sign out of admin portal?')">⎋ Sign Out</a>
    </div>
</aside>

<!-- ===== MAIN AREA ===== -->
<div class="admin-main">

    <!-- TOP BAR -->
    <header class="admin-topbar">
        <div class="topbar-left">
            <button class="sidebar-toggle" id="sidebarToggle">☰</button>
            <input type="text" class="topbar-search" placeholder="Search inventory, orders, customers…" id="globalSearch">
        </div>
        <div class="topbar-right">
            <button class="topbar-icon" title="Notifications" id="notifBtn">🔔 <span class="notif-dot"></span></button>
            <button class="topbar-icon" title="Settings">⚙</button>
            <div class="admin-user">
                <div class="admin-avatar"><%= adminName.charAt(0) %></div>
                <div class="admin-user-info">
                    <span class="admin-user-name"><%= adminName %></span>
                    <span class="admin-user-role">MANAGEMENT LEVEL</span>
                </div>
            </div>
        </div>
    </header>

    <!-- SERVER MESSAGES -->
    <c:if test="${not empty sessionScope.adminSuccess}">
        <div class="admin-alert success">${sessionScope.adminSuccess}<% session.removeAttribute("adminSuccess"); %></div>
    </c:if>
    <c:if test="${not empty sessionScope.adminError}">
        <div class="admin-alert error">${sessionScope.adminError}<% session.removeAttribute("adminError"); %></div>
    </c:if>

    <!-- ========== DASHBOARD SECTION ========== -->
    <section class="admin-section active" id="section-dashboard">
        <div class="section-head">
            <div>
                <h1>Dashboard Overview</h1>
                <p>Welcome back. Here is what's happening with Finora today.</p>
            </div>
            <div class="section-head-actions">
                <button class="btn-outline" onclick="showSection('add-product')">+ Add Product</button>
                <button class="btn-solid"   onclick="showSection('orders')">Manage Orders</button>
            </div>
        </div>

        <!-- STAT CARDS -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">🛒</div>
                <div class="stat-body">
                    <span class="stat-delta positive">+12.5%</span>
                    <span class="stat-label">TOTAL ORDERS</span>
                    <span class="stat-value">1,284</span>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">💰</div>
                <div class="stat-body">
                    <span class="stat-delta positive">+8.2%</span>
                    <span class="stat-label">REVENUE</span>
                    <span class="stat-value">$42,920</span>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-body">
                    <span class="stat-delta positive">+24%</span>
                    <span class="stat-label">ACTIVE CUSTOMERS</span>
                    <span class="stat-value">856</span>
                </div>
            </div>
            <div class="stat-card alert-card">
                <div class="stat-icon alert-icon">⚠</div>
                <div class="stat-body">
                    <span class="stat-delta urgent">Action Req.</span>
                    <span class="stat-label">LOW STOCK ALERTS</span>
                    <span class="stat-value">12</span>
                </div>
            </div>
        </div>

        <!-- CHARTS + BEST SELLERS -->
        <div class="dashboard-grid">
            <div class="chart-card">
                <div class="chart-header">
                    <h3>Revenue Overview</h3>
                    <div class="chart-tabs">
                        <button class="chart-tab" onclick="setChartView('week',this)">WEEK</button>
                        <button class="chart-tab active" onclick="setChartView('month',this)">MONTH</button>
                        <button class="chart-tab" onclick="setChartView('year',this)">YEAR</button>
                    </div>
                </div>
                <div class="bar-chart" id="barChart">
                    <div class="bar-wrap"><div class="bar" style="height:40%"></div><span>JAN</span></div>
                    <div class="bar-wrap"><div class="bar" style="height:55%"></div><span>FEB</span></div>
                    <div class="bar-wrap"><div class="bar" style="height:48%"></div><span>MAR</span></div>
                    <div class="bar-wrap"><div class="bar" style="height:62%"></div><span>APR</span></div>
                    <div class="bar-wrap"><div class="bar" style="height:58%"></div><span>MAY</span></div>
                    <div class="bar-wrap"><div class="bar active-bar" style="height:85%"></div><span>JUN</span></div>
                    <div class="bar-wrap"><div class="bar" style="height:65%"></div><span>JUL</span></div>
                </div>
            </div>

            <div class="bestsellers-card">
                <h3>Best Sellers</h3>
                <div class="bestseller-list">
                    <div class="bestseller-item">
                        <div class="bs-img bs-monstera"></div>
                        <div class="bs-info">
                            <h4>Monstera Deliciosa</h4>
                            <span>42 sold this week</span>
                        </div>
                        <strong>$45.00</strong>
                    </div>
                    <div class="bestseller-item">
                        <div class="bs-img bs-reef"></div>
                        <div class="bs-info">
                            <h4>Azure Nano Reef</h4>
                            <span>28 sold this week</span>
                        </div>
                        <strong>$299.00</strong>
                    </div>
                    <div class="bestseller-item">
                        <div class="bs-img bs-moss"></div>
                        <div class="bs-info">
                            <h4>Moss Terrarium Kit</h4>
                            <span>19 sold this week</span>
                        </div>
                        <strong>$95.00</strong>
                    </div>
                </div>
                <a href="#" class="link-sm" onclick="showSection('products')">View Full Catalog</a>
            </div>
        </div>

        <!-- RECENT ORDERS TABLE -->
        <div class="table-card">
            <div class="table-card-header">
                <h3>Recent Orders</h3>
                <a class="link-sm" onclick="showSection('orders')">View All Orders →</a>
            </div>
            <table class="admin-table">
                <thead>
                    <tr><th>ORDER ID</th><th>CUSTOMER</th><th>STATUS</th><th>PRODUCTS</th><th>TOTAL</th></tr>
                </thead>
                <tbody>
                    <tr><td class="mono">#ORD-2894</td><td><span class="cust-dot" style="background:#3ab5d5">EH</span> Elena H.</td><td><span class="badge shipped">Shipped</span></td><td>Fiddle Leaf Fig x2</td><td>$180.00</td></tr>
                    <tr><td class="mono">#ORD-2893</td><td><span class="cust-dot" style="background:#1a1a1a">JM</span> Julian M.</td><td><span class="badge processing">Processing</span></td><td>Bio-Active Filter Kit</td><td>$1,240.00</td></tr>
                    <tr><td class="mono">#ORD-2892</td><td><span class="cust-dot" style="background:#e67e22">SC</span> Sarah C.</td><td><span class="badge delivered">Delivered</span></td><td>Rare Orchid Vanda</td><td>$85.00</td></tr>
                    <tr><td class="mono">#ORD-2891</td><td><span class="cust-dot" style="background:#9b59b6">MK</span> Marcus K.</td><td><span class="badge cancelled">Cancelled</span></td><td>Nano Reef Setup</td><td>$450.00</td></tr>
                </tbody>
            </table>
        </div>
    </section>

    <!-- ========== PRODUCTS SECTION ========== -->
    <section class="admin-section" id="section-products">
        <div class="section-head">
            <div>
                <h1>Product Management</h1>
                <p>Manage your curated flora and aquatic collections.</p>
            </div>
            <button class="btn-solid" onclick="showSection('add-product')">+ Add New Product</button>
        </div>

        <div class="stats-grid three-col">
            <div class="stat-card sm-stat"><span class="stat-label">TOTAL PRODUCTS</span><span class="stat-value">254</span></div>
            <div class="stat-card sm-stat alert-sm"><span class="stat-label">OUT OF STOCK</span><span class="stat-value">12</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">CATEGORIES</span><span class="stat-value">08</span></div>
        </div>

        <div class="table-card">
            <div class="table-filters">
                <input type="text" class="filter-input" placeholder="Search by name or SKU…" id="productSearch" oninput="filterTable('productTable', this.value)">
                <select class="filter-select"><option>All Categories</option><option>Plant</option><option>Aquarium</option><option>Accessory</option></select>
                <select class="filter-select"><option>Status: Active</option><option>Inactive</option></select>
                <select class="filter-select"><option>Newest</option><option>Price ↑</option><option>Price ↓</option></select>
            </div>
            <table class="admin-table" id="productTable">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="selectAll" onchange="toggleAll(this)"></th>
                        <th>IMAGE</th><th>PRODUCT NAME</th><th>CATEGORY</th><th>PRICE</th><th>STOCK</th><th>STATUS</th><th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><div class="prod-thumb prod-green"></div></td>
                        <td><div class="prod-name-cell"><strong>Fiddle Leaf Fig Premium</strong><small>SKU: FLF-001</small></div></td>
                        <td><span class="cat-badge plant-cat">🌿 PLANT</span></td>
                        <td>$125.00</td>
                        <td><span class="stock-ok">42 in stock</span><div class="stock-bar"><div class="stock-fill" style="width:84%"></div></div></td>
                        <td><span class="badge active-badge">ACTIVE</span></td>
                        <td class="action-btns"><button class="icon-btn edit-btn" onclick="editProduct('FLF-001')">✏</button><button class="icon-btn del-btn" onclick="deleteProduct(this,'Fiddle Leaf Fig Premium')">🗑</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><div class="prod-thumb prod-blue"></div></td>
                        <td><div class="prod-name-cell"><strong>Crystal Rimless Nano (10g)</strong><small>SKU: AQ-RM-10</small></div></td>
                        <td><span class="cat-badge aqua-cat">🐠 AQUARIUM</span></td>
                        <td>$240.00</td>
                        <td><span class="stock-low">5 left</span><div class="stock-bar"><div class="stock-fill low-fill" style="width:10%"></div></div></td>
                        <td><span class="badge active-badge">ACTIVE</span></td>
                        <td class="action-btns"><button class="icon-btn edit-btn" onclick="editProduct('AQ-RM-10')">✏</button><button class="icon-btn del-btn" onclick="deleteProduct(this,'Crystal Rimless Nano')">🗑</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><div class="prod-thumb prod-dark-green"></div></td>
                        <td><div class="prod-name-cell"><strong>Monstera Deliciosa XL</strong><small>SKU: MON-XL-88</small></div></td>
                        <td><span class="cat-badge plant-cat">🌿 PLANT</span></td>
                        <td>$85.00</td>
                        <td><span class="stock-out">Out of Stock</span><div class="stock-bar"><div class="stock-fill out-fill" style="width:0%"></div></div></td>
                        <td><span class="badge inactive-badge">INACTIVE</span></td>
                        <td class="action-btns"><button class="icon-btn edit-btn" onclick="editProduct('MON-XL-88')">✏</button><button class="icon-btn del-btn" onclick="deleteProduct(this,'Monstera XL')">🗑</button></td>
                    </tr>
                </tbody>
            </table>
            <div class="table-footer">
                <span>Showing 1–10 of 254 products</span>
                <div class="pagination"><button class="page-btn active">1</button><button class="page-btn">2</button><button class="page-btn">3</button><button class="page-btn">…</button><button class="page-btn">25</button></div>
            </div>
        </div>
    </section>

    <!-- ========== ORDERS SECTION ========== -->
    <section class="admin-section" id="section-orders">
        <div class="section-head">
            <div>
                <h1>Order Management</h1>
                <p>Monitor and manage all customer transactions from both Flora and Aqua worlds.</p>
            </div>
            <button class="btn-outline">⬇ Export Orders</button>
        </div>

        <div class="stats-grid four-col">
            <div class="stat-card sm-stat"><span class="stat-label">TOTAL ORDERS</span><span class="stat-value">1,284</span><span class="stat-note positive">↑ 12.5%</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">PENDING</span><span class="stat-value">42</span><span class="stat-note urgent">Requires attention</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">SHIPPED TODAY</span><span class="stat-value">156</span><span class="stat-note positive">On schedule</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">RETURNED</span><span class="stat-value">12</span><span class="stat-note">0.9% return rate</span></div>
        </div>

        <div class="table-card">
            <div class="table-filters">
                <input type="text" class="filter-input" placeholder="Search by Order ID or Customer…" oninput="filterTable('ordersTable', this.value)">
                <select class="filter-select"><option>Status: All</option><option>Processing</option><option>Shipped</option><option>Delivered</option><option>Cancelled</option></select>
                <select class="filter-select"><option>Date Range</option><option>Today</option><option>This Week</option><option>This Month</option></select>
            </div>
            <table class="admin-table" id="ordersTable">
                <thead>
                    <tr><th><input type="checkbox"></th><th>ORDER ID</th><th>CUSTOMER</th><th>DATE</th><th>ITEMS</th><th>TOTAL</th><th>STATUS</th><th>ACTIONS</th></tr>
                </thead>
                <tbody>
                    <tr><td><input type="checkbox"></td><td class="mono">#ORD-2894</td><td><span class="cust-dot" style="background:#e74c3c">EV</span>Elena Vance</td><td>Oct 24, 2024</td><td>3 items</td><td>$180.00</td><td><span class="badge processing">PROCESSING</span></td><td><button class="icon-btn view-btn" onclick="viewOrder('#ORD-2894')">👁</button></td></tr>
                    <tr><td><input type="checkbox"></td><td class="mono">#ORD-2893</td><td><span class="cust-dot" style="background:#3ab5d5">MR</span>Marcus Reid</td><td>Oct 24, 2024</td><td>1 item</td><td>$345.50</td><td><span class="badge shipped">SHIPPED</span></td><td><button class="icon-btn view-btn" onclick="viewOrder('#ORD-2893')">👁</button></td></tr>
                    <tr><td><input type="checkbox"></td><td class="mono">#ORD-2892</td><td><span class="cust-dot" style="background:#27ae60">SK</span>Soren Kierk</td><td>Oct 23, 2024</td><td>5 items</td><td>$1,240.00</td><td><span class="badge delivered">DELIVERED</span></td><td><button class="icon-btn view-btn" onclick="viewOrder('#ORD-2892')">👁</button></td></tr>
                    <tr><td><input type="checkbox"></td><td class="mono">#ORD-2891</td><td><span class="cust-dot" style="background:#9b59b6">LT</span>Lila Thorne</td><td>Oct 23, 2024</td><td>2 items</td><td>$56.00</td><td><span class="badge shipped">SHIPPED</span></td><td><button class="icon-btn view-btn" onclick="viewOrder('#ORD-2891')">👁</button></td></tr>
                    <tr><td><input type="checkbox"></td><td class="mono">#ORD-2890</td><td><span class="cust-dot" style="background:#e67e22">JW</span>Jasper Wells</td><td>Oct 22, 2024</td><td>12 items</td><td>$2,100.99</td><td><span class="badge processing">PROCESSING</span></td><td><button class="icon-btn view-btn" onclick="viewOrder('#ORD-2890')">👁</button></td></tr>
                </tbody>
            </table>
            <div class="table-footer">
                <span>Showing 1–10 of 1,284 orders</span>
                <div class="pagination"><button class="page-btn active">1</button><button class="page-btn">2</button><button class="page-btn">3</button><button class="page-btn">128</button><button class="page-btn">›</button></div>
            </div>
        </div>
    </section>

    <!-- ========== CUSTOMERS SECTION ========== -->
    <section class="admin-section" id="section-customers">
        <div class="section-head">
            <div>
                <h1>Customer Management</h1>
                <p>Curate and monitor your community of botanists and aquarists.</p>
            </div>
            <button class="btn-solid">+ Register New Customer</button>
        </div>

        <div class="stats-grid four-col">
            <div class="stat-card sm-stat"><span class="stat-label">TOTAL CUSTOMERS</span><span class="stat-value">12,842</span><span class="stat-note positive">+2%</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">NEW THIS MONTH</span><span class="stat-value">482</span><span class="stat-note positive">+14.2%</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">ACTIVE SUBSCRIPTIONS</span><span class="stat-value">2,105</span><span class="stat-note positive">86%</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">SATISFACTION</span><span class="stat-value">4.92<small>/5.0</small></span><span class="stat-note positive">EXCELLENT</span></div>
        </div>

        <div class="table-card">
            <div class="table-filters">
                <input type="text" class="filter-input" placeholder="Search by name, email or customer ID…" oninput="filterTable('custTable', this.value)">
                <select class="filter-select"><option>Status: All</option><option>Active</option><option>Inactive</option><option>Blocked</option></select>
                <select class="filter-select"><option>Segment: All</option><option>VIP</option><option>Regular</option></select>
            </div>
            <table class="admin-table" id="custTable">
                <thead>
                    <tr><th>CUSTOMER</th><th>JOINED</th><th>TOTAL ORDERS</th><th>LTV</th><th>STATUS</th><th>ACTIONS</th></tr>
                </thead>
                <tbody>
                    <tr><td><div class="cust-row"><span class="cust-dot" style="background:#3ab5d5">AL</span><div><strong>Adeline Laurent</strong><small>adeline.l@bio-flora.com</small></div></div></td><td>Oct 24, 2023</td><td>14 Orders</td><td>$3,420.00</td><td><span class="badge cust-active">ACTIVE</span></td><td class="action-btns"><button class="icon-btn view-btn">👁</button><button class="icon-btn edit-btn">✏</button></td></tr>
                    <tr><td><div class="cust-row"><span class="cust-dot" style="background:#e67e22">SW</span><div><strong>Sebastian Waters</strong><small>s.waters@oceanic.io</small></div></div></td><td>Dec 12, 2023</td><td>29 Orders</td><td>$8,910.50</td><td><span class="badge vip-badge">VIP MEMBER</span></td><td class="action-btns"><button class="icon-btn view-btn">👁</button><button class="icon-btn edit-btn">✏</button></td></tr>
                    <tr><td><div class="cust-row"><span class="cust-dot" style="background:#9b59b6">EK</span><div><strong>Elena Kovic</strong><small>elena.kovic@gmail.com</small></div></div></td><td>Jan 05, 2024</td><td>2 Orders</td><td>$156.00</td><td><span class="badge cust-inactive">INACTIVE</span></td><td class="action-btns"><button class="icon-btn view-btn">👁</button><button class="icon-btn edit-btn">✏</button></td></tr>
                    <tr><td><div class="cust-row"><span class="cust-dot" style="background:#27ae60">MT</span><div><strong>Marcus Thorne</strong><small>m.thorneatstructure.net</small></div></div></td><td>Feb 18, 2024</td><td>8 Orders</td><td>$1,245.20</td><td><span class="badge cust-active">ACTIVE</span></td><td class="action-btns"><button class="icon-btn view-btn">👁</button><button class="icon-btn edit-btn">✏</button></td></tr>
                    <tr><td><div class="cust-row"><span class="cust-dot" style="background:#e74c3c">JD</span><div><strong>Julianna Drago</strong><small>jdrago@outlook.com</small></div></div></td><td>Oct 02, 2023</td><td>1 Order</td><td>$45.00</td><td><span class="badge blocked-badge">BLOCKED</span></td><td class="action-btns"><button class="icon-btn view-btn">👁</button><button class="icon-btn edit-btn">✏</button></td></tr>
                </tbody>
            </table>
            <div class="table-footer">
                <span>Showing 1–10 of 12,842 customers</span>
                <div class="pagination"><button class="page-btn active">1</button><button class="page-btn">2</button><button class="page-btn">3</button><button class="page-btn">1284</button><button class="page-btn">›</button></div>
            </div>
        </div>
    </section>

    <!-- ========== REVIEWS SECTION ========== -->
    <section class="admin-section" id="section-reviews">
        <div class="section-head">
            <div><h1>Review Moderation</h1><p>Curate and manage customer feedback to maintain community trust.</p></div>
            <button class="btn-outline">⟳ Update Feed</button>
        </div>
        <div class="stats-grid four-col">
            <div class="stat-card sm-stat"><span class="stat-label">AVG RATING</span><span class="stat-value">4.8<small>/5.0</small></span></div>
            <div class="stat-card sm-stat"><span class="stat-label">PENDING APPROVAL</span><span class="stat-value">14</span></div>
            <div class="stat-card sm-stat"><span class="stat-label">TOTAL REVIEWS</span><span class="stat-value">3,240</span></div>
            <div class="stat-card sm-stat alert-sm"><span class="stat-label">FLAGGED</span><span class="stat-value">3</span></div>
        </div>
        <div class="table-card">
            <div class="table-filters">
                <input type="text" class="filter-input" placeholder="Product or reviewer name…">
                <select class="filter-select"><option>Rating: All</option><option>★★★★★</option><option>★★★★</option><option>★★★</option></select>
                <select class="filter-select"><option>Status: Pending</option><option>Approved</option><option>Rejected</option></select>
            </div>
            <table class="admin-table">
                <thead><tr><th>PRODUCT</th><th>CUSTOMER</th><th>RATING</th><th>COMMENT</th><th>DATE</th><th>STATUS</th><th>ACTIONS</th></tr></thead>
                <tbody>
                    <tr>
                        <td><div class="prod-row"><div class="prod-thumb-sm rev-monstera"></div>Monstera Deliciosa</div></td>
                        <td>Elena L.</td><td><span class="stars">★★★★★</span></td>
                        <td class="comment-cell">Absolutely stunning quality. The leaves are massive and…</td>
                        <td>Oct 12, 2023</td>
                        <td><span class="badge rev-pending">PENDING</span></td>
                        <td class="action-btns"><button class="icon-btn approve-btn" onclick="approveReview(this)" title="Approve">✓</button><button class="icon-btn del-btn" onclick="rejectReview(this)" title="Reject">✕</button></td>
                    </tr>
                    <tr>
                        <td><div class="prod-row"><div class="prod-thumb-sm rev-tank"></div>Crystal Rimless Nano</div></td>
                        <td>Marcus K.</td><td><span class="stars">★★★★☆</span></td>
                        <td class="comment-cell">The glass clarity is unparalleled. Best nano tank I've…</td>
                        <td>Oct 11, 2023</td>
                        <td><span class="badge rev-pending">PENDING</span></td>
                        <td class="action-btns"><button class="icon-btn approve-btn" onclick="approveReview(this)" title="Approve">✓</button><button class="icon-btn del-btn" onclick="rejectReview(this)" title="Reject">✕</button></td>
                    </tr>
                    <tr>
                        <td><div class="prod-row"><div class="prod-thumb-sm rev-fig"></div>Fiddle Leaf Fig</div></td>
                        <td>Sarah R.</td><td><span class="stars">★★★★★</span></td>
                        <td class="comment-cell">Came in great shape. Already seeing new growth since…</td>
                        <td>Oct 10, 2023</td>
                        <td><span class="badge rev-approved">APPROVED</span></td>
                        <td class="action-btns"><button class="icon-btn del-btn" onclick="rejectReview(this)" title="Remove">✕</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="review-bottom">
            <div class="auto-mod-card">
                <h3>Automated Moderation Active</h3>
                <p>Our AI system has automatically filtered 124 spam comments this week, maintaining 99.8% accuracy.</p>
                <button class="btn-outline-light">Review Filter Logs</button>
            </div>
            <div class="trust-card">
                <h3>Community Trust Score</h3>
                <p>Your store maintains an "Elite" trust rating based on verified purchase reviews.</p>
                <div class="trust-bar"><div class="trust-fill"></div></div>
                <span class="trust-label">86% POSITIVE SENTIMENT</span>
            </div>
        </div>
    </section>

    <!-- ========== ADD PRODUCT SECTION ========== -->
    <section class="admin-section" id="section-add-product">
        <div class="section-head">
            <div>
                <p class="breadcrumb">INVENTORY › ADD NEW PRODUCT</p>
                <h1>Add New Masterpiece</h1>
                <p>Curate the collection. Define the life, aesthetics, and technical specifications of our newest offering.</p>
            </div>
        </div>

        <form class="add-product-form" action="AddProductServlet" method="POST" enctype="multipart/form-data" id="addProductForm" novalidate>
            <div class="form-layout">
                <div class="form-main-col">

                    <!-- Basic Info -->
                    <div class="form-card">
                        <h3 class="form-card-title">🌿 Basic Information</h3>
                        <div class="form-group">
                            <label class="form-label">Product Name *</label>
                            <input type="text" name="productName" class="form-input" placeholder="e.g. Rare Variegated Monstera Adansonii" id="productName">
                            <span class="field-error" id="prodNameErr"></span>
                        </div>
                        <div class="form-grid-2">
                            <div class="form-group">
                                <label class="form-label">SKU Number *</label>
                                <input type="text" name="sku" class="form-input" placeholder="FLR-9923-M" id="prodSku">
                                <span class="field-error" id="prodSkuErr"></span>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Category</label>
                                <select name="category" class="form-input" id="prodCategory" onchange="updateBioFields(this.value)">
                                    <option value="">Select Category</option>
                                    <option value="indoor">Indoor Plant</option>
                                    <option value="outdoor">Outdoor Plant</option>
                                    <option value="succulent">Succulent</option>
                                    <option value="fish">Fish / Reef</option>
                                    <option value="aquarium">Aquarium Tank</option>
                                    <option value="accessory">Accessory</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-input form-textarea" rows="4" placeholder="Describe the biological uniqueness and aesthetic value…"></textarea>
                        </div>
                    </div>

                    <!-- Product Media -->
                    <div class="form-card">
                        <h3 class="form-card-title">🖼 Product Media</h3>
                        <div class="media-grid">
                            <label class="media-upload main-upload" for="mainImage">
                                <div class="upload-icon">⬆</div>
                                <span>Upload Main Hero Image</span>
                                <small>(Max 5MB)</small>
                                <input type="file" id="mainImage" name="mainImage" accept="image/*" style="display:none;" onchange="previewMedia(this,'mainPreview')">
                                <div class="media-preview" id="mainPreview"></div>
                            </label>
                            <label class="media-upload" for="img2"><span class="media-plus">+</span><input type="file" id="img2" name="img2" accept="image/*" style="display:none;"></label>
                            <label class="media-upload" for="img3"><span class="media-plus">+</span><input type="file" id="img3" name="img3" accept="image/*" style="display:none;"></label>
                            <label class="media-upload" for="img4"><span class="media-plus">+</span><input type="file" id="img4" name="img4" accept="image/*" style="display:none;"></label>
                        </div>
                    </div>

                    <!-- Pricing & Inventory -->
                    <div class="form-card">
                        <h3 class="form-card-title">💲 Pricing &amp; Inventory</h3>
                        <div class="form-grid-4">
                            <div class="form-group">
                                <label class="form-label">Regular Price *</label>
                                <div class="price-wrap"><span class="currency">$</span><input type="number" name="price" class="form-input price-input" placeholder="0.00" step="0.01" min="0" id="prodPrice"></div>
                                <span class="field-error" id="prodPriceErr"></span>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Sale Price (Optional)</label>
                                <div class="price-wrap"><span class="currency">$</span><input type="number" name="salePrice" class="form-input price-input" placeholder="0.00" step="0.01" min="0"></div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Stock Quantity *</label>
                                <input type="number" name="stock" class="form-input" placeholder="0" min="0" id="prodStock">
                                <span class="field-error" id="prodStockErr"></span>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Low Stock Alert</label>
                                <div class="alert-wrap"><input type="number" name="lowStockAlert" class="form-input" value="3" min="0"><span class="bell-icon">🔔</span></div>
                            </div>
                        </div>
                    </div>

                    <!-- Dynamic Bio Fields -->
                    <div class="form-card bio-fields" id="plantFields" style="display:none;">
                        <h3 class="form-card-title">🌱 Plant Care Details</h3>
                        <div class="form-group">
                            <label class="form-label">Hydration Level</label>
                            <div class="toggle-group">
                                <button type="button" class="toggle-opt" onclick="selectOpt(this,'hydration')">Low</button>
                                <button type="button" class="toggle-opt active" onclick="selectOpt(this,'hydration')">Medium</button>
                                <button type="button" class="toggle-opt" onclick="selectOpt(this,'hydration')">High</button>
                            </div>
                            <input type="hidden" name="hydration" id="hydration" value="Medium">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Sunlight Requirements</label>
                            <select name="sunlight" class="form-input">
                                <option>Indirect / Bright Light</option><option>Full Sun</option><option>Low Light</option><option>Shade</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-card bio-fields" id="aquaFields" style="display:none;">
                        <h3 class="form-card-title">🐠 Aquatic Specifics</h3>
                        <div class="form-group">
                            <label class="form-label">Water Environment</label>
                            <div class="tag-select" id="waterEnv">
                                <span class="tag-opt" onclick="this.classList.toggle('selected')">Freshwater</span>
                                <span class="tag-opt" onclick="this.classList.toggle('selected')">Brackish</span>
                                <span class="tag-opt selected" onclick="this.classList.toggle('selected')">Saltwater</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Compatible Companions</label>
                            <div class="companion-input" id="companionList">
                                <span class="companion-tag">Clownfish <button type="button" onclick="this.parentElement.remove()">✕</button></span>
                                <span class="companion-tag">Blennies <button type="button" onclick="this.parentElement.remove()">✕</button></span>
                                <input type="text" placeholder="+ Add Species" class="companion-add" id="companionInput" onkeydown="addCompanion(event)">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Side Column -->
                <div class="form-side-col">
                    <div class="form-card">
                        <h3 class="form-card-title">Product Classification</h3>
                        <div class="classification-options">
                            <label class="class-opt" onclick="setClassification('plant')">
                                <input type="radio" name="classification" value="plant" id="classPlant" checked>
                                <span class="class-icon">🌿</span>
                                <span>Plant</span>
                                <span class="class-check" id="checkPlant">●</span>
                            </label>
                            <label class="class-opt" onclick="setClassification('fish')">
                                <input type="radio" name="classification" value="fish" id="classFish">
                                <span class="class-icon">🐠</span>
                                <span>Fish / Reef</span>
                                <span class="class-check inactive" id="checkFish">○</span>
                            </label>
                            <label class="class-opt" onclick="setClassification('accessory')">
                                <input type="radio" name="classification" value="accessory" id="classAccessory">
                                <span class="class-icon">⚙</span>
                                <span>Accessory</span>
                                <span class="class-check inactive" id="checkAcc">○</span>
                            </label>
                        </div>
                        <small class="class-note">* This choice will unlock specific biological attribute fields below.</small>
                    </div>

                    <div class="form-card">
                        <h3 class="form-card-title">Publish Settings</h3>
                        <div class="publish-row"><span>Status</span>
                            <select name="status" class="form-input-sm"><option value="active">Active</option><option value="draft">Draft</option><option value="inactive">Inactive</option></select>
                        </div>
                        <div class="publish-row"><span>Featured</span>
                            <label class="toggle-switch-sm"><input type="checkbox" name="featured"><span class="slider-sm"></span></label>
                        </div>
                    </div>

                    <div class="form-actions-sticky">
                        <span class="field-error" id="formGlobalErr"></span>
                        <button type="button" class="btn-outline-full" onclick="showSection('products')">Discard Changes</button>
                        <button type="submit" class="btn-solid-full" id="publishBtn">Save Product &amp; Publish</button>
                    </div>
                </div>
            </div>
        </form>
    </section>

</div><!-- /admin-main -->

<!-- ORDER DETAIL MODAL -->
<div class="modal-overlay" id="orderModal" style="display:none;">
    <div class="modal">
        <div class="modal-head">
            <h3 id="modalOrderId">Order Details</h3>
            <button class="modal-close" onclick="closeModal()">✕</button>
        </div>
        <div class="modal-body" id="modalBody">
            <p>Loading order details…</p>
        </div>
        <div class="modal-foot">
            <select class="form-input-sm" id="statusSelect">
                <option>Processing</option><option>Shipped</option><option>Delivered</option><option>Cancelled</option>
            </select>
            <button class="btn-solid" onclick="updateOrderStatus()">Update Status</button>
        </div>
    </div>
</div>

<script>
    // ---- Section navigation ----
    function showSection(name) {
        document.querySelectorAll('.admin-section').forEach(s => s.classList.remove('active'));
        document.querySelectorAll('.admin-nav-link').forEach(l => l.classList.remove('active'));
        document.getElementById('section-' + name).classList.add('active');
        const link = document.querySelector('[data-section="' + name + '"]');
        if (link) link.classList.add('active');
    }
    document.querySelectorAll('.admin-nav-link').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            showSection(this.dataset.section);
        });
    });

    // ---- Sidebar toggle (mobile) ----
    document.getElementById('sidebarToggle').addEventListener('click', function() {
        document.getElementById('adminSidebar').classList.toggle('open');
    });

    // ---- Table filter ----
    function filterTable(tableId, query) {
        const rows = document.querySelectorAll('#' + tableId + ' tbody tr');
        rows.forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(query.toLowerCase()) ? '' : 'none';
        });
    }
    document.getElementById('globalSearch').addEventListener('input', function() {
        const q = this.value.toLowerCase();
        document.querySelectorAll('.admin-table tbody tr').forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
        });
    });

    // ---- Select all checkbox ----
    function toggleAll(master) {
        document.querySelectorAll('#productTable tbody input[type="checkbox"]').forEach(cb => cb.checked = master.checked);
    }

    // ---- Chart view toggle ----
    function setChartView(view, btn) {
        document.querySelectorAll('.chart-tab').forEach(t => t.classList.remove('active'));
        btn.classList.add('active');
        // Animate bars randomly to simulate data change
        document.querySelectorAll('.bar').forEach(b => {
            const h = Math.floor(Math.random() * 70 + 20);
            b.style.height = h + '%';
        });
    }

    // ---- Classification ----
    function setClassification(type) {
        ['plant','fish','accessory'].forEach(t => {
            document.getElementById('check' + t.charAt(0).toUpperCase() + t.slice(1)).className = 'class-check' + (t === type ? '' : ' inactive');
        });
        updateBioFields(type);
    }
    function updateBioFields(type) {
        document.getElementById('plantFields').style.display = (type === 'plant' || type === 'indoor' || type === 'outdoor' || type === 'succulent') ? 'block' : 'none';
        document.getElementById('aquaFields').style.display = (type === 'fish' || type === 'aquarium') ? 'block' : 'none';
    }

    // ---- Toggle options (hydration) ----
    function selectOpt(btn, field) {
        btn.closest('.toggle-group').querySelectorAll('.toggle-opt').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        document.getElementById(field).value = btn.textContent;
    }

    // ---- Companion tags ----
    function addCompanion(e) {
        if (e.key !== 'Enter') return;
        e.preventDefault();
        const val = e.target.value.trim();
        if (!val) return;
        const tag = document.createElement('span');
        tag.className = 'companion-tag';
        tag.innerHTML = val + ' <button type="button" onclick="this.parentElement.remove()">✕</button>';
        document.getElementById('companionList').insertBefore(tag, e.target);
        e.target.value = '';
    }

    // ---- Media preview ----
    function previewMedia(input, previewId) {
        const file = input.files[0];
        if (!file) return;
        const reader = new FileReader();
        reader.onload = e => {
            const prev = document.getElementById(previewId);
            prev.style.backgroundImage = 'url(' + e.target.result + ')';
            prev.style.backgroundSize = 'cover';
            prev.style.backgroundPosition = 'center';
            prev.style.position = 'absolute';
            prev.style.inset = '0';
            prev.style.borderRadius = '6px';
        };
        reader.readAsDataURL(file);
    }

    // ---- Add product form validation ----
    document.getElementById('addProductForm').addEventListener('submit', function(e) {
        let valid = true;
        const name = document.getElementById('productName').value.trim();
        const sku  = document.getElementById('prodSku').value.trim();
        const price = parseFloat(document.getElementById('prodPrice').value);
        const stock = document.getElementById('prodStock').value;
        const showErr = (id, msg) => { const el=document.getElementById(id); el.textContent=msg; el.style.display='block'; };
        const clearErr = id => { const el=document.getElementById(id); el.textContent=''; el.style.display='none'; };
        if (!name) { showErr('prodNameErr','Product name is required.'); valid=false; } else clearErr('prodNameErr');
        if (!sku)  { showErr('prodSkuErr','SKU is required.'); valid=false; } else clearErr('prodSkuErr');
        if (!price || price <= 0) { showErr('prodPriceErr','Enter a valid price.'); valid=false; } else clearErr('prodPriceErr');
        if (!stock || stock < 0) { showErr('prodStockErr','Enter a valid stock quantity.'); valid=false; } else clearErr('prodStockErr');
        if (!valid) { e.preventDefault(); document.getElementById('formGlobalErr').textContent='Please fix the errors above.'; document.getElementById('formGlobalErr').style.display='block'; }
        else document.getElementById('publishBtn').textContent = 'Publishing…';
    });

    // ---- Product actions ----
    function editProduct(sku) { alert('Edit product ' + sku + '\n(Connects to EditProductServlet?sku=' + sku + ')'); }
    function deleteProduct(btn, name) {
        if (!confirm('Delete "' + name + '"? This cannot be undone.')) return;
        btn.closest('tr').style.animation = 'fadeOut 0.4s ease forwards';
        setTimeout(() => btn.closest('tr').remove(), 400);
    }

    // ---- Review actions ----
    function approveReview(btn) {
        const row = btn.closest('tr');
        row.querySelector('.badge').className = 'badge rev-approved';
        row.querySelector('.badge').textContent = 'APPROVED';
        btn.remove();
    }
    function rejectReview(btn) {
        if (!confirm('Remove this review?')) return;
        btn.closest('tr').style.animation = 'fadeOut 0.4s ease forwards';
        setTimeout(() => btn.closest('tr').remove(), 400);
    }

    // ---- Order modal ----
    function viewOrder(orderId) {
        document.getElementById('orderModal').style.display = 'flex';
        document.getElementById('modalOrderId').textContent = 'Order ' + orderId;
        document.getElementById('modalBody').innerHTML = '<table class="admin-table"><thead><tr><th>Product</th><th>Qty</th><th>Price</th></tr></thead><tbody><tr><td>Sample Product</td><td>1</td><td>$99.00</td></tr></tbody></table><p style="margin-top:1rem;font-size:.85rem;color:#666;">Customer: Jane Doe — Oct 24, 2024</p>';
    }
    function closeModal() { document.getElementById('orderModal').style.display = 'none'; }
    function updateOrderStatus() { alert('Status updated to: ' + document.getElementById('statusSelect').value); closeModal(); }
    document.getElementById('orderModal').addEventListener('click', function(e) { if (e.target === this) closeModal(); });

    // ---- Bar chart entrance animation ----
    window.addEventListener('load', function() {
        setTimeout(() => {
            document.querySelectorAll('.bar').forEach((bar, i) => {
                const target = bar.style.height;
                bar.style.height = '0%';
                setTimeout(() => { bar.style.height = target; }, i * 80);
            });
        }, 400);
        // Trust bar
        setTimeout(() => { document.querySelector('.trust-fill').style.width = '86%'; }, 800);
    });

    @keyframes fadeOut { to { opacity:0; transform:translateX(20px); } }
</script>
</body>
</html>
