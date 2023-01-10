// source: https://code-boxx.com/html-scroll-to-top-button/
var backToTopButton = document.getElementById("back-to-top-button");
backToTopButton.style.display = "none"

function scrollUp() {
    window.scroll({
        top: 0, behavior: 'smooth'
    });
}

function checkScroll() {
    if (window.scrollY >= 100) {
        backToTopButton.style.display = "block";
    } else {
        backToTopButton.style.display = "none";
    }
}
window.addEventListener("scroll", checkScroll);
window.addEventListener("resize", checkScroll);