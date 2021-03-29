import Iconify from "@iconify/iconify";

// This listener is needed to reload the icons after Turbolinks replaces the DOM
document.addEventListener("turbolinks:load", function() {
  Iconify.scanDOM();
})
