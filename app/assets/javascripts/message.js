$(function () {
  function buildHTML(message) {
    let html = `<div class="item__right">
                  <div class="item__right__fukidasi">
                    ${message.content}
                  </div>
                  <div class="chat-face">
                    <img height="30" width="30" class="user-image" src="${message.user_image}">
                  </div>
                </div>`
                return html;
  }
  $('.new_message').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.message__content').append(html);
      $('.textbox').val('');
      $(".message__content").animate({
        scrollTop: $(".message__content")[0].scrollHeight,
      });
      $(".form__submit").prop("disabled", false);
    })
  })
});
