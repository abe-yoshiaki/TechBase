$(document).on('turbolinks:load', function() {
  function post_message(classname, message){
    if($('div').hasClass(classname)){
      M.toast({html: message});
    }
  }
  if(document.URL.match(/tweets/)){
    post_message('post_done', '投稿を完了しました！');
    post_message('post_update', '投稿を更新しました！');
  }
});
