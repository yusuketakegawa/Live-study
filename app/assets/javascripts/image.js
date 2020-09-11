$(function(){
  $(".new__content__field").change(function () {
    var file = $('input[type="file"]').prop("files")[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function () {
      var src = fileReader.result;
      var html = `<img src="${src}" width="100%" height="100%">`;
      $(".prev-contents").replaceWith(html);
    };
    fileReader.readAsDataURL(file);
  });
})