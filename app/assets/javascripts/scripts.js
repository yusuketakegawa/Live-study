$(document).ready(function () {
  $('.sidenav').sidenav({
    edge: 'right',
  });
})

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.tap-target');
  var instances = M.TapTarget.init(elems, options);
});

// Or with jQuery

$(document).ready(function(){
  $('.tap-target').tapTarget();
});
     