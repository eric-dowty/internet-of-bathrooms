function botInfo(){

  $('#bathroom-bot-question').append("Click to enable<br>Bathroom-Bot");

  Tipped.create('#bathroom-bot-about-btn', "Bathroom-Bot will send a personal message to Slack #watercooler when a bathroom becomes available.");

  $('#bathroom-bot-question').click(function(){
    console.log("clicked bot") 

    $.ajax({
      url: "/bot_update",
      dataType: 'json',
      success: function(success){
        var stuff = success
        console.log(stuff)
      },
      error: function(error){
        console.log(error)
      }
    });

  })
}



  

  
