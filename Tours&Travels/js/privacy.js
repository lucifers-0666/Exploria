// privacy.js

document.addEventListener("DOMContentLoaded", function () {
    // 1) Trigger hero intro animations by adding a class on <body>
    document.body.classList.add("privacy-hero-ready");

    // 2) Scroll reveal for sections and cards
    var observerOptions = {
        root: null,
        rootMargin: "0px",
        threshold: 0.15
    };

    var revealObserver = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add("pp-reveal-in");
                revealObserver.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Elements that should animate in when visible
    var revealSelectors = [
        ".privacy-section",
        ".privacy-chip-card",
        ".privacy-contact-card"
    ];

    revealSelectors.forEach(function (selector) {
        document.querySelectorAll(selector).forEach(function (el) {
            el.classList.add("pp-reveal");   // initial hidden state
            revealObserver.observe(el);      // watch for scroll into view
        });
    });

    // 3) Active state for sidebar links while scrolling
    var sections = document.querySelectorAll(".privacy-section[id]");
    var navLinks = document.querySelectorAll(".privacy-sidebar-link");

    function setActiveLink(id) {
        navLinks.forEach(function (link) {
            if (link.getAttribute("href") === "#" + id) {
                link.classList.add("privacy-sidebar-link-active");
            } else {
                link.classList.remove("privacy-sidebar-link-active");
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
