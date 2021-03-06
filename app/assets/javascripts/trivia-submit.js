const correctAnswer = ["F'n A right Cotton!",
                       "Hot dog! good guess.",
                       "Genius, pure genius.",
                       "Good book learnin'!",
                       "You're on fire!",
                       "Exactly...",
                       "That's right!!",
                       "Too smart for words.",
                       "A million points! j/k.",
                       "Bullseye...",
                       "Perfect answer!",
                       "Your brain must be huge."]

const wrongAnswer = ["WTF? Bad answer...", 
                     "That is sooo wrong.",
                     "Not even close.",
                     "Why do you even try?!",
                     "You need a counselor.",
                     "That doesn't deserve points.",
                     "Wrong, wrong, wrong.",
                     "You should read more...",
                     "Are you drunk?",
                     "Wow... no words.",
                     "Are you a GSchooler?",
                     "Ain't no time for that."]

function clearAnswerForm(){
  $("#right-or-wrong-label").empty()
  $("#guess-yours").empty()
  $("#answer-judges").empty()
  $("#points-awarded-number").empty()
  $("#raw-score").empty()
}

function triviaSubmit(){

  $("#trivia-submit-btn").click(function(){

    var inputBox = $('#trivia-input').val();
    
    $("#trivia-div").fadeOut();
    
    if (inputBox === "?"){
      triviaForm();
    } else {
      $.ajax({
        type: "GET",
        url:  "/answer",
        data: "guess=" + inputBox,
        dataType: "json",
        success: function(success){
          clearAnswerForm();
          loadReport(success)
        },
        error: function(error){
          console.log(error)
        }
      })
    }
  });

};

function loadReport(report){
  $("#right-or-wrong-label").append(answerMessage(report.success))
  $("#guess-yours").append(report.guess)
  $("#answer-judges").append(report.answer)
  $("#points-awarded-number").append(report.value)
  $("#raw-score").append(report.score)
  $("#trivia-answer-div").fadeIn(900);
}

function answerMessage(success){
  if(success){
    return correctAnswer[Math.floor(Math.random()*correctAnswer.length)];
  } else {
    return wrongAnswer[Math.floor(Math.random()*wrongAnswer.length)];
  }
}