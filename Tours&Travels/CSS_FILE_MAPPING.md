# CSS FILE MAPPING FOR ASPX PAGES
## Tours & Travels Application - November 10, 2025

---

## 📋 QUICK REFERENCE

| Page Name | File | CSS File(s) | Status |
|-----------|------|-----------|--------|
| **Home.aspx** | Home | `Home.css` | ✅ Ready |
| **Login.aspx** | Authentication | `Auth.css` | ✅ Ready |
| **Register.aspx** | Authentication | `Auth.css` | ✅ Ready |
| **ForgetPassword.aspx** | Authentication | `Auth.css` | ✅ Ready |
| **ResetPassword.aspx** | Authentication | `Auth.css` | ✅ Ready |
| **Destination.aspx** | Destinations | `Destination.css` | ✅ Ready |
| **ViewDetails.aspx** | Destinations | `Destination.css` | ✅ Ready |
| **Contact.aspx** | Public | `Contact.css` | ✅ Ready |
| **About.aspx** | Public | `Contact.css` | ✅ Ready |
| **Profile.aspx** | User | `User.css` | ✅ Ready |
| **MyBookings.aspx** | User | `User.css` | ✅ Ready |
| **bookingConfirmation.aspx** | Booking | `Booking.css` | ✅ Ready |
| **ThankYou.aspx** | Booking | `Booking.css` | ✅ Ready |
| **AddDestinations.aspx** | Admin | `Admin.css` | ✅ Ready |
| **AdminDestinations.aspx** | Admin | `Admin.css` | ✅ Ready |
| **AdminUserManagement.aspx** | Admin | `Admin.css` | ✅ Ready |
| **AdminUserView.aspx** | Admin | `Admin.css` | ✅ Ready |

---

## 📁 CSS FILES ORGANIZATION

### 1. **Auth.css** - Authentication Pages
**Purpose**: Styling for login, registration, and password recovery forms

**Includes**:
- Login/Register form cards
- Gradient overlays
- Form input styling with focus states
- Submit buttons with hover effects
- Floating label effects for password reset
- Responsive mobile design
- Accessibility features (sr-only, focus-visible)

**Pages Using This**:
- ✅ Login.aspx
- ✅ Register.aspx
- ✅ ForgetPassword.aspx
- ✅ ResetPassword.aspx

**Key Classes**:
```css
.login-gradient-overlay
.login-card
.login-btn
.form-input
.form-container
.form-input-wrapper
.submit-btn
```

---

### 2. **Home.css** - Home Page
**Purpose**: Hero section, featured destinations, testimonials, animations

**Includes**:
- Hero section with parallax background
- Card hover effects with animations
- Floating icon animations
- Pulse button animations
- Featured destinations grid
- Testimonial cards with star ratings
- Section separators
- Why Us cards
- Responsive container sizing

**Pages Using This**:
- ✅ Home.aspx

**Key Classes**:
```css
.hero-gradient
.parallax-bg
.card-hover
.floating-icon
.pulse-btn
.why-us-card
.testimonial-card
.section-padding
.destination-badge
```

---

### 3. **Destination.css** - Destination Listing & Details
**Purpose**: Destination cards, filtering, pagination, detail pages, galleries

**Includes**:
- Destination card layout and hover effects
- Filter buttons with active states
- Pagination navigation
- Image galleries with thumbnails
- Detail panel styling
- Booking card (sticky positioning)
- Empty state styling
- Loading spinner
- Responsive grid layouts

**Pages Using This**:
- ✅ Destination.aspx
- ✅ ViewDetails.aspx

**Key Classes**:
```css
.destination-card
.filter-btn
.pagination-nav-btn
.gallery-container
.gallery-main-image
.gallery-thumbnail
.details-panel
.booking-card
.booking-btn
.empty-state
```

---

### 4. **Booking.css** - Booking & Confirmation
**Purpose**: Booking forms, traveler info, payment summary, thank you page

**Includes**:
- Booking form container
- Form inputs with floating labels
- Quantity controls (+ / -)
- Traveler info cards
- Booking summary with price breakdown
- Confirmation/thank you page styling
- Success icon and messages
- Action buttons (primary/secondary)
- Next steps section
- Payment buttons

**Pages Using This**:
- ✅ bookingConfirmation.aspx
- ✅ ThankYou.aspx

**Key Classes**:
```css
.booking-form-container
.form-input
.quantity-btn
.traveler-info-card
.booking-summary
.price-breakdown
.booking-btn
.thank-you-container
.success-icon
.confirmation-details
.next-steps
```

---

### 5. **User.css** - User Dashboard & Profile
**Purpose**: Profile management, bookings history, wishlist, tab navigation

**Includes**:
- Profile header with gradient
- Tab navigation with active states
- Tab content with animations
- Profile picture section with upload
- Form elements (view/edit modes)
- Form row grids for responsive layouts
- Booking history table with status badges
- Wishlist cards
- Action buttons (primary/secondary/danger)
- Empty states

**Pages Using This**:
- ✅ Profile.aspx
- ✅ MyBookings.aspx

**Key Classes**:
```css
.profile-header
.profile-card
.profile-nav-link
.tab-content
.form-label
.form-input-view
.form-input-edit
.profile-picture-section
.booking-status
.wishlist-card
.btn-group
.btn-primary
```

---

### 6. **Admin.css** - Admin Dashboard & Management
**Purpose**: Data tables, CRUD operations, modals, statistics, messages

**Includes**:
- Header section with gradient
- Data table styling with hover states
- Action buttons (edit/delete)
- Add new button
- Delete confirmation modal
- Loading spinner
- Success/error/warning message banners
- Empty data state
- Statistics cards
- Form styling for add/edit pages

**Pages Using This**:
- ✅ AddDestinations.aspx
- ✅ AdminDestinations.aspx
- ✅ AdminUserManagement.aspx
- ✅ AdminUserView.aspx

**Key Classes**:
```css
.header-section
.data-table
.action-btn
.edit-btn
.delete-btn
.add-new-btn
.modal-overlay
.modal-box
.modal-btn
.message-banner
.stat-card
.empty-data-container
.admin-form-container
```

---

### 7. **Contact.css** - Contact & About Pages
**Purpose**: Contact forms with icons, contact info cards, about page sections

**Includes**:
- Hero section
- Contact information cards
- Contact form with icon inputs
- Form labels and groups
- Submit button styling
- Success/error messages
- Team member cards (About page)
- Values/features section
- Map container for location
- Section padding and spacing

**Pages Using This**:
- ✅ Contact.aspx
- ✅ About.aspx

**Key Classes**:
```css
.hero-section
.contact-card
.contact-info-icon
.form-input-container
.form-input-icon
.form-input
.form-textarea
.submit-btn
.success-message
.error-message
.team-member
.value-card
.map-container
```

---

## 🔗 HOW TO IMPLEMENT IN PAGES

### Example for Login.aspx:

**BEFORE** (Current - with embedded styles):
```html
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* All CSS embedded here */
        .login-card { ... }
        .form-input { ... }
        /* etc */
    </style>
</asp:Content>
```

**AFTER** (Recommended - with external CSS):
```html
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="~/css/Auth.css">
</asp:Content>
```

### Implementation Steps:

1. **Remove embedded `<style>` tags** from the `<asp:Content>` with `ContentPlaceHolderID="head"`
2. **Add CSS link** to corresponding file:
   ```html
   <link rel="stylesheet" href="~/css/FileName.css">
   ```
3. **Keep existing class names** - they're already defined in CSS files
4. **Test** the page to ensure styling is applied correctly

---

## 📊 CSS FILES SUMMARY

| File | Estimated Size | Number of Classes | Pages | Key Features |
|------|----------------|-------------------|-------|---|
| Auth.css | ~6 KB | 18+ | 4 | Forms, buttons, animations |
| Home.css | ~8 KB | 20+ | 1 | Hero, cards, testimonials |
| Destination.css | ~10 KB | 25+ | 2 | Cards, filters, gallery |
| Booking.css | ~12 KB | 30+ | 2 | Forms, summary, confirmation |
| User.css | ~11 KB | 28+ | 2 | Tabs, tables, profile |
| Admin.css | ~11 KB | 30+ | 4 | Tables, modals, forms |
| Contact.css | ~9 KB | 22+ | 2 | Forms, cards, maps |
| **Total** | **~67 KB** | **173+** | **18+** | Complete system |

---

## ✅ FEATURES INCLUDED IN ALL CSS FILES

### Responsive Design
- Mobile-first approach
- Tablet and desktop breakpoints
- Flexible grids and layouts
- Touch-friendly buttons

### Accessibility
- `.sr-only` class for screen readers
- Focus states for keyboard navigation
- Color contrast compliance
- ARIA-friendly structure

### Animations
- Smooth transitions
- Hover effects
- Fade-in animations
- Respects `prefers-reduced-motion`

### Color Variables
- Uses CSS custom properties (--midnight-green, etc.)
- Consistent branding throughout
- Easy to customize

### Interactive Elements
- Button hover/active states
- Form input focus states
- Tab switching animations
- Modal transitions

---

## 🔧 CUSTOMIZATION GUIDE

### Change Primary Color
Edit `site.css` (Master Page):
```css
:root {
    --dartmouth-green: #0b6e4f; /* Change this */
}
```

### Change Button Sizes
Edit specific CSS file:
```css
.btn-primary {
    padding: 0.75rem 1.5rem; /* Adjust padding */
    font-size: 1rem; /* Adjust size */
}
```

### Modify Animations
Edit relevant CSS:
```css
.card-hover {
    transition: all 0.4s ease; /* Change timing */
}
```

---

## 📝 NEXT STEPS

### 1. **Update Each Page**
   - Remove embedded `<style>` tags
   - Add link to corresponding CSS file
   - Test page styling

### 2. **Create a CSS Audit**
   - Document unused classes
   - Remove duplicate styles
   - Consolidate common utilities

### 3. **Optimize for Production**
   - Minify CSS files
   - Implement CSS caching
   - Consider CSS preprocessing (SASS/LESS)

### 4. **Monitor Performance**
   - Check CSS file sizes
   - Measure load times
   - Use browser DevTools

---

## 📌 NOTES

- All CSS files use standard CSS (no preprocessors)
- Compatible with all modern browsers
- Follows CSS best practices
- Includes media queries for responsive design
- Uses semantic HTML classnames
- Mobile-first approach throughout

---

## 🎯 CHECKLIST FOR IMPLEMENTATION

- [ ] Remove all embedded `<style>` tags from ASPX pages
- [ ] Add CSS file links to all pages
- [ ] Test all pages for correct styling
- [ ] Check responsive behavior on mobile
- [ ] Verify accessibility (tab navigation, focus states)
- [ ] Test all interactive elements (buttons, forms, modals)
- [ ] Check console for any CSS errors
- [ ] Validate CSS for syntax errors
- [ ] Optimize CSS files (minify for production)
- [ ] Document any custom overrides needed

---

**Last Updated**: November 10, 2025
**Total Pages**: 18+
**Total CSS Files**: 7
**Total Classes**: 173+
