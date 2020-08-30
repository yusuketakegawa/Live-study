
$(document).on('turbolinks:load',function () {
  $('.sidenav').sidenav({
    edge: 'right',
    inDuration: 400,
    outDuration: 400
  });
  $('.tap-target').tapTarget();
  $('select').formSelect();
})

