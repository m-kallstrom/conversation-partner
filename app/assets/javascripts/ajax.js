  // $(document).on('turbolinks:load', function(){
  //   sendInput();
  //   $('.A').hide();
  // });


  $(document).ready(function() {
    sendInput();
    $('.A').hide();
  });

$(document).on('page:receive', function() {
  $('[data-disable-with]:not([data-remote])').trigger('ajax:complete');
});


sendInput = function() {

  $('#input-form').on('submit', function(event) {
      event.preventDefault();

      var $form = $(this);
      var userInput = $form.find('textarea').val();
      $form.find('textarea').val("");
      console.log(userInput);
      var data = $form.serialize();
      console.log(data);

      var output = "<li class='t-left'><span class='dialog'> you said: </span><br> " + userInput + "</li>"
      console.log(output);
      $("#output-form").append(output);


      var $request = $.ajax({
        url: "/conversations",
        method: "post",
        data: data
      });

    $request.done(function(response) {
      console.log(response);
      $("#output-form").append(response);

    })


  })



}
