$(function() {
  $('#user-search-field').on('input', function(e){
    $('#chat-group-form__ul').empty();
    var name = $('#user-search-field').val();
    var url = '/users/search';
    $.ajax({
      type: 'GET',
      url: url,
      data: {
        user: {
          name: name
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      $('#chat-group-form__ul').append('ユーザーをクリックして、リストに追加します');
      $.each(data, function(i, val){
        var addTxt = "<li data-user_id=" + val.id + " >" + val.name + "</li>" ;
        $('#chat-group-form__ul').append(addTxt);
      });
      $(document).on('click', '#chat-group-form__ul li', function(){
        var userId = $(this).attr('data-user_id');
        var searchId = "#group_user_ids_" + userId
        if ( $(searchId).length == 0 ){
          var userName = $(this)[0].innerText;
          var addHtml = "<input type='checkbox' checked='checked' value='" + userId + "' name='group[user_ids][]'' id='group_user_ids_" + userId + "'><label for='group_user_ids_" + userId + "'>" + userName + "</label>";
          $('#chat-group-user-22').append(addHtml);
        }
      });
    })
    .fail(function(){
      $('#chat-group-form__ul').append('ユーザーがいません。');
    })
  });
});
