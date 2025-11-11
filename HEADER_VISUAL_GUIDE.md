# Header Visual Design Guide

## 🎨 Visual States Overview

---

## State 1: Initial Page Load (Transparent Header)

```
┌─────────────────────────────────────────────────────────────────┐
│ ☎ +91-1234567890  │  ✉ info@exploria.com  │  f i t in  │ USD EN│ <- UTILITY BAR
│                         (Emerald Dark Background)                │    (40px height)
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  🧭 Exploria    Home  Destinations▼  Packages▼  Bookings        │ <- MAIN HEADER
│                 About  Contact  Admin▼  More▼                    │    (80px height)
│                                    [Search🔍]  👤  [Book Now →]  │    TRANSPARENT
│                                                                   │    with blur(8px)
└─────────────────────────────────────────────────────────────────┘
     ↑                ↑                               ↑        ↑
  Compass          White text                    Search bar  Gold CTA
  (rotates         (visible on                   (glass      (champagne
  on hover)        transparent)                  effect)     background)
```

**Colors:**
- Logo Icon: Champagne Gold (#E5CBAF)
- Logo Text: White
- Nav Links: White
- Background: Transparent with blur
- Search: White glass (15% opacity)
- CTA: Champagne Gold background

---

## State 2: Scrolled (Solid Header)

```
┌─────────────────────────────────────────────────────────────────┐
│  🧭 Exploria    Home  Destinations▼  Packages▼  Bookings        │ <- MAIN HEADER
│  (smaller)      About  Contact  Admin▼  More▼                   │    (70px height)
│                                    [Search🔍]  👤  [Book Now →]  │    SOLID EMERALD
│                                                                   │    (#1d5e33)
└─────────────────────────────────────────────────────────────────┘
     ↑                ↑                               ↑        ↑
  28px             White text                    Search bar  Gold CTA
  (from 32px)      (on emerald)                  (adjusted)  (same)

Shadow: 0 4px 20px rgba(0,0,0,0.1)
Border: 1px solid rgba(42, 125, 74, 0.3)
```

**Changes on Scroll:**
- Utility bar: Hidden (slides up)
- Header background: Solid emerald
- Header height: 80px → 70px
- Logo size: 32px → 28px
- Nav font: 15px → 14px
- Body padding: 120px → 70px

---

## Dropdown Menus

### Destinations Dropdown
```
┌──────────────────────────────────┐
│  🌎  Browse All Destinations     │
│  🔥  Currently Trending  [HOT]   │ <- Badge pulses
│  ⭐  Popular Destinations        │
│  ℹ️  View Details                │
│  🔍  Search Tours                │
└──────────────────────────────────┘
   ↑
Icons in         Background: White
Champagne        Border radius: 12px
Gold             Shadow: 0 10px 40px rgba(0,0,0,0.15)
```

### Packages Dropdown
```
┌──────────────────────────────────┐
│  🥾  Adventure Packages          │
│  💎  Luxury Packages             │
│  👥  Family Packages             │
│  ❤️  Honeymoon Packages          │
│  ⚙️  Custom Packages             │
│  📅  Weekend Getaways            │
└──────────────────────────────────┘
```

### More Dropdown
```
┌──────────────────────────────────┐
│  ℹ️  About Us                    │
│  ✉️  Contact Us                  │
│  ❓  FAQ                         │
│  🛡️  Privacy Policy              │
│  📄  Terms & Conditions          │
└──────────────────────────────────┘
```

### User Dropdown (Logged In)
```
┌──────────────────────────────────┐
│  Welcome, UserName               │ <- Header
├──────────────────────────────────┤
│  👤  My Profile                  │
│  🎫  My Bookings                 │
│  📜  Booking History             │
│  ✅  Confirmations               │
├──────────────────────────────────┤
│  🚪  Logout                      │
└──────────────────────────────────┘
```

---

## Hover Effects

### Navigation Link Hover:
```
Before:  Home
         ────  (no underline)

Hover:   Home  (champagne gold color)
         ━━━━  (underline slides in from left)
```

### Logo Hover:
```
Before:  🧭 Exploria  (compass at 0°)
Hover:   🧭 Exploria  (compass rotates 180° in 600ms)
                      (text glows with shadow)
```

### Search Bar Focus:
```
Before:  [Search destinations...🔍]  (320px, transparent)
                                      
Focus:   [Search destinations...🔍]  (360px, solid white)
         ╚════════════════════════╝  (gold border, glowing)
                                      (icon rotates 90°)
```

### Book Now Button Hover:
```
Before:  [Book Now →]  (champagne gold, flat)
                       
Hover:   [Book Now  →]  (gold-rich, lifted 2px)
         └─────────────┘ (enhanced shadow, arrow slides right)
```

### User Icon Hover:
```
Before:  ⭕👤  (40px circle, transparent center)
                
Hover:   ⭕👤  (filled champagne gold)
         ↻      (icon rotates 360° + scales 1.1x)
```

---

## Mobile Layout (< 1024px)

```
┌─────────────────────────────────────┐
│  🧭 Exploria         👤 [→]  ☰     │ <- Header (70px)
│  (smaller)          User CTA Menu   │    Solid emerald
└─────────────────────────────────────┘

When Menu Open:
┌─────────────────────────────────────┐
│  🧭 Exploria         👤 [→]  ✕     │
└─────────────────────────────────────┘
                              │
                    ┌─────────┴────────┐
[Dark Overlay]      │  🏠  Home        │ <- Menu Panel
←───────────────────┤  🗺️  Destinations│    (slides from right)
Tap to close        │  🎫  My Bookings │    Emerald background
                    │  ℹ️  About Us    │    280px width
                    │  ✉️  Contact     │
                    │  👤  Profile     │
                    │  🚪  Logout      │
                    └──────────────────┘
```

---

## Color Interactions

### Transparent State (Page Top):
```
Background:     Transparent rgba(0,0,0,0)
Backdrop:       Blur 8px
Logo:           White + Champagne Gold
Nav Links:      White
Search:         White glass 15% opacity
User Icon:      White border, transparent
CTA:            Champagne Gold bg, Emerald text
```

### Scrolled State (After 80px):
```
Background:     Solid Emerald #1d5e33
Backdrop:       None (solid background)
Logo:           White + Champagne Gold (same)
Nav Links:      White (same)
Search:         White glass 20% opacity
User Icon:      White border, transparent
CTA:            Champagne Gold bg, Emerald text (same)
```

### Hover States:
```
Nav Link:       Champagne Gold
Search Focus:   White solid, Gold border
User Icon:      Champagne Gold filled
CTA:            Gold-rich bg
Dropdown:       Emerald-pale bg on hover
```

---

## Animations Timeline

### On Page Load:
```
0ms     │ Page Progress Bar starts
        │
600ms   │ Utility Bar fades in
        │
800ms   │ Header slides down
        │
900ms   │ Logo appears
        │
1000ms  │ Nav items cascade in
        │ (staggered 100ms each)
        │
1500ms  │ Search bar appears
        │
1600ms  │ Progress bar completes
```

### On Scroll (80px threshold):
```
Trigger at 80px scroll
        │
        ├─ Utility bar slides up (400ms)
        ├─ Header bg fades to emerald (300ms)
        ├─ Header height compresses (300ms)
        ├─ Logo scales down (300ms)
        └─ Body padding adjusts (300ms)

All use cubic-bezier(0.4, 0, 0.2, 1)
```

### Dropdown Appear:
```
Hover on Nav Link
        │
150ms   │ Delay (prevents accidental trigger)
        │
        ├─ Dropdown fades in (opacity 0→1)
        ├─ Dropdown slides down (translateY -10px→0)
        └─ Items cascade (staggered 30ms each)

Duration: 250ms cubic-bezier(0.4, 0, 0.2, 1)
```

### Currency/Language Dropdown:
```
Hover on Dropdown
        │
        ├─ Chevron rotates 180° (300ms)
        ├─ Background appears (250ms)
        └─ Menu slides down (200ms)
```

---

## Spacing & Measurements

### Header Container:
```
Max-width: 1440px (centered)
Padding:   0 32px (desktop)
           0 16px (mobile)
```

### Navigation Items:
```
Gap between items:  8px
Padding each link:  12px 20px
Font size:          15px (14px scrolled)
```

### Logo:
```
Icon size:    32px (28px scrolled)
Text size:    28px (26px scrolled)
Gap:          12px
```

### Search Bar:
```
Width:        320px (360px focused)
Height:       44px
Border:       24px radius (pill)
Icon left:    16px from edge
Icon size:    16px
```

### User Icon:
```
Container:    40px diameter
Border:       2px
Icon:         16px
```

### CTA Button:
```
Padding:      12px 28px
Border:       24px radius
Font:         15px, weight 600
Icon:         14px
```

### Dropdowns:
```
Min-width:    280px
Border:       12px radius
Padding:      16px 0
Item padding: 12px 20px
Icon size:    16px
Gap:          12px
```

---

## Responsive Breakpoints

### Desktop (> 1024px):
✅ Full navigation
✅ Top utility bar
✅ Search bar (320px)
✅ All icons and text
✅ Dropdown menus

### Tablet (768px - 1024px):
❌ Utility bar hidden
✅ Hamburger menu
❌ Desktop nav hidden
❌ Search bar hidden
✅ CTA icon only
✅ User icon visible

### Mobile (< 768px):
❌ Utility bar hidden
✅ Hamburger menu
❌ Desktop nav hidden
❌ Search bar hidden
✅ CTA icon only (40x40px)
✅ User icon visible
🔽 Logo smaller (22px)

### Small Mobile (< 480px):
❌ User icon hidden
✅ CTA minimal (36x36px)
✅ Essential nav only
🔽 Logo smallest

---

## Touch Targets (Mobile)

All interactive elements meet 44x44px minimum:
```
✅ Logo:          50x50px effective area
✅ Nav Links:     Full width, 56px height
✅ User Icon:     44x44px (with padding)
✅ CTA Button:    44x44px minimum
✅ Hamburger:     44x44px
✅ Mobile Menu:   Full width items
```

---

## Accessibility Features

### Keyboard Navigation:
```
Tab          → Move through links
Enter/Space  → Activate links/buttons
Esc          → Close mobile menu
Arrow Keys   → Navigate dropdowns (future)
```

### Focus Indicators:
```
All focusable elements get:
┌──────────────┐
│  Element     │
└──────────────┘
 Outline: 2px solid champagne-gold
 Offset: 2px
```

### ARIA Labels:
```
Search Input:     "Search destinations"
User Button:      "User account"
Hamburger:        "Open navigation menu"
Social Links:     "Visit our [Platform] page"
```

### Screen Reader:
```
Skip to content link (hidden)
Semantic HTML structure
Descriptive link text
Alt text on all icons
```

---

## Performance Metrics

### Target Metrics:
```
First Paint:           < 1s
Time to Interactive:   < 2s
Scroll Performance:    60fps
Animation Frame Rate:  60fps
Total Blocking Time:   < 200ms
```

### Optimizations:
```
✅ requestAnimationFrame for scroll
✅ Passive event listeners
✅ will-change on animations
✅ CSS transforms (GPU accelerated)
✅ Debounced scroll handler
✅ Lazy dropdown rendering
```

---

## Browser Support

### Modern Browsers (Full Support):
```
✅ Chrome 90+
✅ Firefox 88+
✅ Safari 14+
✅ Edge 90+
```

### Graceful Degradation:
```
⚠️ backdrop-filter     → Falls back to solid colors
⚠️ CSS transforms      → Falls back to opacity
⚠️ Custom properties   → Falls back to hex colors
```

---

## Testing Checklist

### Visual Testing:
```
□ Header transparent on load
□ Smooth scroll transition
□ Logo rotation on hover
□ Nav underlines animate correctly
□ Dropdowns appear on hover
□ Search expands on focus
□ User icon rotates on hover
□ CTA button lifts on hover
□ Mobile menu slides smoothly
□ All icons render correctly
```

### Functional Testing:
```
□ All links navigate correctly
□ Dropdowns close on click outside
□ Mobile menu closes on overlay click
□ Search input accepts text
□ Currency/language selectors work
□ User dropdown shows correct items
□ Logout redirects properly
□ Keyboard navigation works
```

### Responsive Testing:
```
□ Test at 1920px (desktop)
□ Test at 1366px (laptop)
□ Test at 1024px (tablet landscape)
□ Test at 768px (tablet portrait)
□ Test at 414px (mobile large)
□ Test at 375px (mobile medium)
□ Test at 320px (mobile small)
```

---

## Common Issues & Solutions

### Issue: Header jumps on scroll
**Solution:** Ensure body padding-top matches header height

### Issue: Dropdown appears off-screen
**Solution:** Add right: 0 for right-aligned dropdowns

### Issue: Mobile menu doesn't close
**Solution:** Check z-index and overlay click handler

### Issue: Logo not centered on mobile
**Solution:** Verify flex properties on logo-container

### Issue: Animations laggy
**Solution:** Use transforms, check will-change property

---

## Quick Reference

### Key Classes:
```css
.modern-header         - Main header container
.modern-header.scrolled - Scrolled state
.utility-bar           - Top utility bar
.logo-container        - Logo wrapper
.nav-menu             - Navigation list
.nav-link             - Navigation items
.dropdown-menu        - Dropdown container
.search-bar           - Search wrapper
.user-account         - User icon wrapper
.cta-book-now         - CTA button
.hamburger            - Mobile menu icon
.mobile-menu          - Mobile panel
```

### Key Variables:
```css
--primary-emerald     - Main brand color
--champagne-gold      - Accent color
--emerald-dark        - Dark variant
--emerald-light       - Light variant
--emerald-pale        - Background tint
--gold-rich           - Hover gold
--gold-shimmer        - Light gold
```

### Key Measurements:
```
Utility bar: 40px
Header initial: 80px
Header scrolled: 70px
Scroll threshold: 80px
Logo icon: 32px → 28px
Nav font: 15px → 14px
```

---

*Reference Version: 2.0.0*
*Last Updated: November 11, 2025*
