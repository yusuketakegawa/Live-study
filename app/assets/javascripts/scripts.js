
//サイドナビバー
  $(document).ready(function () {
    $(".sidenav").sidenav({
      edge: 'right',
      inDuration: 400,
      outDuration: 400
    });
  });
  //セレクトボックス
  $(document).ready(function () {
    $("select").formSelect();
  });
//フラッシュメッセージ 
  $(function () {
    $(".Notification").fadeOut(5000);
  });