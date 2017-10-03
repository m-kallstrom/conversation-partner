

// window.scrollTo(0,document.body.scrollHeight);

  $(document).ready(function() {
    $(document).bind('keypress',pressed);
    sendButton();
    $('.A').hide();
  });


  function pressed(e) {
    if(e.keyCode === 13) {
        sendInput(e);
    };
  };


sendButton = function() {
  $('#input-form').on('submit', function(event) {
      sendInput(event);
  });
};

sendInput = function(event) {
  event.preventDefault();

      var $form = $('#input-form');
      var userInput = $form.find('textarea').val();
      $form.find('textarea').val("");
      var data = { sentence: {content: userInput} };
      var output = "<li class='t-left'><span class='dialog'> you said: </span><br> " + userInput + "</li>"
      $("#output-form").append(output);


      var $request = $.ajax({
        url: "/conversations",
        method: "post",
        data: data
      });

    $request.done(function(response) {
      $("#output-form").append(response);
      $('html,body').animate({scrollTop: document.body.scrollHeight},"slow");

    })
}