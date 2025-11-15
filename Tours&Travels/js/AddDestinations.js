// js/AddDestinations.js

document.addEventListener("DOMContentLoaded", function () {
    // Simple scroll‑reveal for intro + form
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

    document.querySelectorAll(".tt-reveal").forEach(function (el) {
        revealObserver.observe(el);
    });
});
