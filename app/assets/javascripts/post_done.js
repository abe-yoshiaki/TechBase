$(document).on('turbolinks:load', function() {
  if(document.URL.match(/tweets/)){
    if($('div').hasClass('post_done')){
      Materialize.toast('投稿を完了しました！', 4000);
    }
  }
});
