// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./bootstrap.min"
//= require jquery3
//= require popper

if (window.innerWidth < 768) {
    [].slice.call(document.querySelectorAll('[data-bss-disabled-mobile]')).forEach(function (elem) {
        elem.classList.remove('animated');
        elem.removeAttribute('data-bss-hover-animate');
        elem.removeAttribute('data-aos');
    });
}

document.addEventListener('DOMContentLoaded', function() {
    AOS.init();

    var hoverAnimationTriggerList = [].slice.call(document.querySelectorAll('[data-bss-hover-animate]'));
    var hoverAnimationList = hoverAnimationTriggerList.forEach(function (hoverAnimationEl) {
        hoverAnimationEl.addEventListener('mouseenter', function(e){ e.target.classList.add('animated', e.target.dataset.bssHoverAnimate) });
        hoverAnimationEl.addEventListener('mouseleave', function(e){ e.target.classList.remove('animated', e.target.dataset.bssHoverAnimate) });
    });
}, false);


(function() {
    "use strict"; // Start of use strict

    // Show the navbar when the page is scrolled up
    var MQL = 992;
    var vw = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0);
    var mainNav = document.querySelector('#mainNav');

    //primary navigation slide-in effect
    if (mainNav && vw > MQL) {
        var headerHeight = mainNav.offsetHeight;
        var previousTop = window.pageYOffset;

        window.addEventListener('scroll', function() {
            var currentTop = window.pageYOffset;
            //check if user is scrolling up
            if (currentTop < previousTop) {
                //if scrolling up...
                if (currentTop > 0 && mainNav.classList.contains('is-fixed')) {
                    mainNav.classList.add('is-visible');
                } else {
                    mainNav.classList.remove('is-visible', 'is-fixed');
                }
            } else if (currentTop > previousTop) {
                //if scrolling down...
                mainNav.classList.remove('is-visible');

                if (currentTop > headerHeight && !mainNav.classList.contains('is-fixed')) {
                    mainNav.classList.add('is-fixed');
                }
            }
            previousTop = currentTop;
        });
    }

})(); // End of use strict

