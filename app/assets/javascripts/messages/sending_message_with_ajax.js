$(function() {
  $('#js-comment-send').on('click', function(e){
    e.preventDefault();
    var form = $('#new_message').get()[0];
    var formData = new FormData(form);
    var postUrl = $('.new_message').attr('action')
    console.log(formData);

    $.ajax({
      type: 'POST',
      url: postUrl,
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data){
      var addUser = "<div class='timeline-message'><div class='timeline-message__user'><div class='timeline-message__user__name'>" + data.name + " </div><div class='timeline-message__user__date'>" + data.created_at + "</div></div></div>";
      $('.timeline').append(addUser);

      if (data.comment.length != 0){
        var addText = "<div class='timeline-message__text'>" + data.comment + "</div>";
        $('.timeline .timeline-message:last-child').append(addText);
      }

      if (data.image.url != null){
      var addImage = "<img class='timeline-message__image' src='" + data.image.url + "' alt='Pylamid'>";
      $('.timeline .timeline-message:last-child').append(addImage);
      }

      $('#js-comment-input').val('');
      $('#js-file-input').val('');
    })
    .fail(function(){
      alert('失敗しました');
    })
  });
});
