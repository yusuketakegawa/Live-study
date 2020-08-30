
$(document).on('turbolinks:load',function () {
  $('.sidenav').sidenav({
    edge: 'right'
  });
  $('.tap-target').tapTarget();
  $('select').formSelect();
})

