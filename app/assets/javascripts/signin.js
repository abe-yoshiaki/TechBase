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
  $("#login-btn").click(function(){
    input_check("#user_email",'.err_email_login',"メールアドレス を入力してください" );
    input_check("#user_password",'.err_password_login',"パスワード を入力してください" );
  });
});
