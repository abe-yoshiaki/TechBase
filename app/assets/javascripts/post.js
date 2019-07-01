$(document).on('turbolinks:load', function() {
  // ***入力チェック用関数***
  function input_check(err_border, err_text, err_msg){
    if($(err_border).val() == ""){
      // エラーメッセージを赤色で表示
      $(err_text).text(err_msg);
      $(err_text).css({'color':'red','font-size':'14px','margin-top':'8px'});
    }else{
      $(err_text).text("");
    }
  }
  $("#post-submit").click(function(){
    input_check("#first_name2",'.err_title',"タイトル を入力してください" );
    input_check("#post-textarea",'.err_content',"本文 を入力してください" );
  });
});
