function triviaForm(){
  
  clearForm();

  $("#trivia-answer-div").hide();
  $("#trivia-div").show();

  $.ajax({
    type: "GET",
    url: "/trivia",
    dataType: "json",
    success: function(success){
      loadForm(success)
    },
    error: function(error){
      console.log(error)
    }
  });

  $.ajax({
    type: "GET",
    url: "/score",
    dataType: "json",
    success: function(success){
      loadScore(success)
    },
    error: function(error){
      console.log(error)
    }
  });
  
};

function loadForm(trivia){
  $('#points-up').append(trivia.value)
  $('#trivia-category').append(trivia.category.title)
  $('#trivia-question').append(trivia.question)
};

function loadScore(score){
  $('#raw-score').append(score)
};

function clearForm(){
  $('#points-up').empty()
  $('#trivia-category').empty()
  $('#trivia-question').empty()
  $('#raw-score').empty()
  $('#trivia-input').val("")
}