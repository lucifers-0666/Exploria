// terms.js

document.addEventListener("DOMContentLoaded", function () {
    // 1) Trigger hero intro animations by adding a class on <body>
    document.body.classList.add("terms-hero-ready");

    // 2) Scroll reveal for sections and contact cards
    var observerOptions = {
        root: null,
        rootMargin: "0px",
        threshold: 0.15
    };

    var revealObserver = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add("tt-reveal-in");
                revealObserver.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Elements that should animate in when they enter the viewport
    var revealSelectors = [
        ".terms-section",
        ".terms-contact-card"
    ];

    revealSelectors.forEach(function (selector) {
        document.querySelectorAll(selector).forEach(function (el) {
            el.classList.add("tt-reveal");  // initial hidden state (CSS)
            revealObserver.observe(el);     // watch element
        });
    });

    // 3) Active link in sidebar (scroll spy)
    var sections = document.querySelectorAll(".terms-section[id]");
    var navLinks = document.querySelectorAll(".terms-sidebar-link");

    function setActiveLink(id) {
        navLinks.forEach(function (link) {
            if (link.getAttribute("href") === "#" + id) {
                link.classList.add("terms-sidebar-link-active");
            } else {
                link.classList.remove("terms-sidebar-link-active");
            }
        });
    }

    var sectionObserver = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                setActiveLink(entry.target.id);
            }
        });
    }, { threshold: 0.4 });

    sections.forEach(function (section) {
        sectionObserver.observe(section);
    });
});
