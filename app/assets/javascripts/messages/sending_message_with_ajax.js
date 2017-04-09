$(function() {
  $('#js-comment-send').on('click', function(e){
    e.preventDefault();
    var comment = $('#js-comment-input').val();
    var postUrl = $('.new_message').attr('action')
    $.ajax({
      type: 'POST',
      url: postUrl,
      data: {
        message: {
          comment: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      var addTxt = "<div class='timeline-message'> <div class='timeline-message__user'> <div class='timeline-message__user__name'>" + data.name + " </div> <div class='timeline-message__user__date'>" + data.created_at + "</div> </div> <div class='timeline-message__text'>" + data.comment + "</div> </div>";
      $('.timeline').append(addTxt);
      $('#js-comment-input').val('');
    })
    // TODO:error処理は後で書く
    .fail(function(){
      alert('失敗しました');
    })
  });
});
