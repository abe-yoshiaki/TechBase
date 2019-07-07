$(document).on('turbolinks:load', function() {
  var page = 1;
  var flag = false;
  $(window).scroll(function() {
    var scrollHeight = $(document).height();
    var scrollPosition = $(window).height() + $(window).scrollTop();
    if ((scrollHeight - scrollPosition) <= 5 && !flag) {
      page++
      $.ajax({
        url: "/tweets",
        type: "GET",
        dataType: "json",
        data: { "page": page }
      }).done(function(data){
        if (data.length == 0){
          setTimeout(function(){
            $("#overray").fadeOut(500);
          },1000);
        }else{
          $("#overray").fadeIn(500);
        }　
        $.each(data, function(i, tweet) {
          var html2 = "";
          if (tweet.user_id == $('.current_user_id').val()){
            var current_user_html = `<li>
                                       <div class='waves-effect waves-light btn light-blue darken-4' id='card_option--btn'>
                                       <a data-method="get" href="/tweets/${tweet.user_id}/edit">編集</a>
                                       </div>
                                     </li>
                                     <li>
                                       <div class='waves-effect waves-light btn light-blue darken-4' id='card_option--btn'>
                                       <a rel="nofollow" data-method="delete" href="/tweets/${tweet.user_id}">削除</a>
                                       </div>
                                     </li>`
          }
            var html = `<div class='row'>
            <div class='col s12 m6 offset-m3'>
              <div class='card' id='card-box'>
                <div class='card-content' id='content-box'>
                  <a data-method="get" href="/tweets/${tweet.id}">${tweet.title}
                  </a><br>
                  <div class='tweet-content'>${tweet.content}</div>
                  <br>
                </div>
                <div class='tweet-userinfo'>
                  <div class='tweet-nickname'>by ${tweet.nickname}</div>
                  <div class='tweet-created_at'>
                    投稿日:
                    ${tweet.created_at}
                  </div>
                </div>
                <div class='created_at-border'></div>
                <div class='card_option'>`+ current_user_html +`
                </div>
                </div>
              </div>
            </div>`
            
          if(document.URL.match('/users')){
            if (tweet.user_id == $('.current_user_id').val()){
            $('.contents.row').append(html);
            };
          }else{
            $('.contents.row').append(html);
          };

        });
        flag = false;
      }).fail(function(xhr, status, error){
        console.log("エラー")
      });
    }
  });
});
