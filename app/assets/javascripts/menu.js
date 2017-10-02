$(document).ready(function() {

    $('.nav-open').click(function() {
      // $('#overlay').fadeIn(120);
      document.getElementById("navbar").style.width = "70%";
    })

    $('.nav-close').click(function() {
      // $('#overlay').fadeOut();
      document.getElementById("navbar").style.width = "0";
    })

});


