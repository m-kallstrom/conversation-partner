$(document).ready(function() {

    $('.nav-open').click(function() {
      // $('#overlay').fadeIn(120);
      document.getElementById("navbar").style.width = "70%";
      document.getElementById("left-side-close").style.width = "30%";
      document.getElementById("left-side-close").style.display = "block";

    })

    $('.nav-close').click(function() {
      // $('#overlay').fadeOut();
      document.getElementById("navbar").style.width = "0";
      document.getElementById("left-side-close").style.width = "0";
      document.getElementById("left-side-close").style.display = "none";
    })

});


