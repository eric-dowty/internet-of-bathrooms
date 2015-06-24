function botInfo(){

  $('#bathroom-bot-question').append("Click to enable<br>Bathroom-Bot");

  Tipped.create('#bathroom-bot-about-btn', "Bathroom-Bot will send a personal message to Slack #watercooler when a bathroom becomes available.");

  $('#bathroom-bot-question').click(function(){
    var notice = $('#bathroom-bot-question').html(); 
    $('#bathroom-bot-question').empty();
    if(notice === "Click to enable<br>Bathroom-Bot"){
      $('#bathroom-bot-question').append("Bot enabled!!<br>Click to disable");  
    } else {
      $('#bathroom-bot-question').append("Click to enable<br>Bathroom-Bot");  
    }
    $.ajax({
      url: "/bot_update"
    });
  })

}



  

  
