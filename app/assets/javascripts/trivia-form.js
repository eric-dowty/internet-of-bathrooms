function triviaForm(){
  $.ajax({
    url: "/trivia.json",
    dataType: 'json',
    success: function(success){
      loadForm(success)
    },
    error: function(error){
      console.log(error)
    }
  });
};

function loadForm(trivia){
  // $("#trivia-form").append(renderForm(trivia))
};

function checkAnswer(){

};