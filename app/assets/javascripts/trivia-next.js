function triviaNext(){

  $("#trivia-next-btn").click(function(){
    $("#trivia-input").attr('placeholder', "enter your guess");
    triviaForm()
  });

};