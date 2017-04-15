$(function(){
  if(document.URL.match("/messages")) {
    var messageUpdateCheck = function(){
      var messageId = $('.timeline-message:last-child').attr('data-message-id');
      $.ajax({
        type: 'GET',
        url: location.pathname,
        dataType: 'json',
        data: { message_id : messageId }
      })
      .done(function(data){
        if(data.reload == true){
          console.log(data.reload);
          location.reload();
        }else{
          console.log(data.reload);
        }
      })
    }
    setInterval(messageUpdateCheck, 10000);
  }
});
