$(function(){
  $('#img-file').change(function(){
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function(){
      var src = fileReader.result
      var html = `<img src="${src}" width="100" height="100">`
            $(".prev-contents").before(html);
    }
     fileReader.readAsDataURL(file);
  })
})