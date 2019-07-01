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
  $("#register-btn").click(function(){
    input_check("#user_nickname",'.err_nickname',"ニックネーム を入力してください" );
    input_check("#user_email",'.err_email',"メールアドレス を入力してください" );
    input_check("#user_password",'.err_password',"パスワード を入力してください" );
    input_check("#user_password_confirmation",'.err_password_confirmation',"パスワード (確認) を入力してください" );

    // パスワードの文字数チェック
    if($("#user_password").val().length < 6 || $("#user_password").val().length > 128 ){
      $(".err_passwordlength").text("パスワードは6文字以上128文字以下で入力してください");
      $(".err_passwordlength").css({'color':'red','font-size':'14px','margin-top':'8px'});
      $(".err_passwordlength").css('border-color','red');
    }else{
      $(".err_passwordlength").text("");
    }
    // メールアドレスのフォーマットチェック
    email_format_check = /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/;
    if($("#user_email").val().match(email_format_check)){
      $(".err_email_format").text("");
    }else{
      if($("#user_email").val() == ""){
        // 空欄の時はメッセージを表示しない
      }else{
      // エラーメッセージを赤色で表示
      $(".err_email_format").text("フォーマットが不適切です");
      $(".err_email_format").css({'color':'red','font-size':'14px','margin-top':'8px'});
      }
    }
    // パスワードの整合性チェック
    if($("#user_password").val() == $("#user_password_confirmation").val()){
    }else{
      // エラーメッセージを赤色で表示
      $(".err_password_confirmation_unmatch").text("パスワードとパスワード(確認)が一致しません");
      $(".err_password_confirmation_unmatch").css({'color':'red','font-size':'14px','margin-top':'8px'});
    }
  });
});