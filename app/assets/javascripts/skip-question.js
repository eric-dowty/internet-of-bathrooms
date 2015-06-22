function skipQuestion(){

  $("#skip-btn").click(function(){
    $("#trivia-input").attr('placeholder', "enter your guess");
    triviaForm();
  });

}