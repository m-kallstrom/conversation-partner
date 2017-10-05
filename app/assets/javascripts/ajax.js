
  $(document).ready(function() {
    $(document).bind('keypress',pressed);
    console.log('doc ready');

  });

  $(document).on('turbolinks:load', function(){
    // console.log('tl load')
    sendButton();
    $('.A').hide();
        $("#start").on("click", function(){
    recognition.start();
    });

    $("#stop").on("click", function(){
    recognition.stop();
    });
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
      var output = "<li class='t-left'><span class='dialog'>you said: </span><br><span class='u-input border-left'></span></li>"

      $("#output-form").append(output);
      $("#output-form .u-input:last").text(userInput);
      $("#start-conv").hide();


      var $request = $.ajax({
        url: "/conversations",
        method: "post",
        data: data
      });

    $request.done(function(response) {
      $("#output-form").append(response);
      $('html,body').animate({scrollTop: document.body.scrollHeight},"slow");

    });
};

try {
  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.lang = 'en-US';
  recognition.interimResults = true;
  recognition.maxAlternatives = 3;

  var output = $('#input-textbox');
  recognition.onresult = function(event) {
    output.textContent = event.results[0][0].transcript;
    $('#input-textbox').val(event.results[0][0].transcript)
  };

  //when starting change icon
  recognition.onaudiostart = function() {
    console.log('Audio capturing started');
  }

  //for ending change icon
  recognition.onaudioend = function() {
    console.log('Audio capturing ended');
  }

  recognition.onspeechstart = function() {
    console.log('Speech has been detected');
  }
  recognition.onspeechend = function() {
    console.log('Speech has stopped being detected');
  }
}
catch (e) {


}
