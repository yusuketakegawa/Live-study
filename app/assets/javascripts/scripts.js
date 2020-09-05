
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

  //タイムピッカー
   $(document).ready(function () {
     $(".timepicker").timepicker();
   });

   //ツールチップ
  $(document).ready(function () {
    $(".tooltipped").tooltip({
      outDuration: 0,
      enterDelay: 0,
      transitionMovement: 10,
    });
  });