function clearPlaceholder(){

  $("#trivia-input").focus(function(){
    $("#trivia-input").attr('placeholder', "");
  });

};