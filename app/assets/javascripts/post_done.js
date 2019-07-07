$(document).on('turbolinks:load', function() {
  if(document.URL.match(/tweets/)){
    if($('div').hasClass('post_done')){
      M.toast({html: '投稿を完了しました！'});
    }
  }
});
