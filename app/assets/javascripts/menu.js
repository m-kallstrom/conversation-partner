  var open;
  open = function(){
        $('.nav-open').click(function() {
        document.getElementById("navbar").style.width = "70%";
        document.getElementById("navbar").style.height = "100%";
        document.getElementById("left-side-close").style.width = "30%";
        document.getElementById("left-side-close").style.display = "block";
      })
  }

  var close;
  close = function(){
        $('.nav-close').click(function() {
        document.getElementById("navbar").style.width = "0";
        document.getElementById("navbar").style.height = "0";
        document.getElementById("left-side-close").style.width = "0";
        document.getElementById("left-side-close").style.display = "none";
      })
  }

// function updateScroll(){
//     var element = document.getElementById("main-conv");
//     element.scrollTop = element.scrollHeight;
// }

  $(document).on('turbolinks:load', function(){
      open();
      close();
      // updateScroll();
  });

  $(document).ready(function() {
      open();
      close();
      // updateScroll();
  });


