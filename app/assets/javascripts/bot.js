function botInfo(){

  $('#bathroom-bot-question').append("Click to enable<br>Bathroom-Bot");

  Tipped.create('#bathroom-bot-about-btn', "Bathroom-Bot will send a personal message to Slack #watercooler when a bathroom becomes available.");

  $('#bathroom-bot-question').click(function(){

    $.ajax({
      url: "/bot_update",
      dataType: 'json',
      success: function(success){
      },
      error: function(error){
        console.log(error)
      }
    });

  })
}



  

  
